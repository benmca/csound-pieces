/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package csoundbridge;

import java.util.ArrayList;
import java.util.List;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import processing.core.*;
import oscP5.*;
import netP5.*;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

/**
 *
 * @author ben
 */
public class ProcessingApplet extends PApplet
{

    int width = 720;
    int height = 480;
    List<CSEvent> eventList;
    List<CSEvent> activeEvents;
//    MovieMaker mm;
    OscP5 oscP5;
    NetAddress myRemoteLocation;
    boolean bComplete = false;
    double totalDur;


    public void setup()
    {
        activeEvents = new ArrayList<CSEvent>();
        eventList = new ArrayList<CSEvent>();
//        mm = new MovieMaker(this, width, height, "/Users/ben/test.mov", 30,
//                MovieMaker.VIDEO, MovieMaker.LOSSLESS);

        size(width, height);
        background(0);
        stroke(0);
        loop();
        smooth();
        frameRate(30);

        OscProperties properties = new OscProperties();
        properties.setRemoteAddress("localhost", 8666);
        properties.setListeningPort(8666);
        properties.setDatagramSize(256);
        oscP5 = new OscP5(this, properties);

//        for(int i=0; i< 4; i++)
//        {
//            CSImageSequence csis = new CSImageSequence();
//            csis.fps = 9;
//            csis.duration = 1f;
//            csis.startTime = -100f;
//            csis.instr = 1;
//            csis.x = i*100;
//            csis.init(this);
//            activeEvents.add(csis.init(this));
//        }

//        processConfig();
    }

    private void processConfig()
    {
        String pathToSchema = getClass().getResource("imageSequenceConfig.xsd").getPath();
        String pathToConfig = getClass().getResource("config.xml").getPath();
        try
        {
            DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
            DocumentBuilder db = dbf.newDocumentBuilder();
            Document doc = db.parse(pathToConfig);
            doc.getDocumentElement().normalize();
            NodeList nodeLst = doc.getElementsByTagName("ns1:root");
            System.out.println("Information of all employees");

            for (int s = 0; s < nodeLst.getLength(); s++)
            {

                Node fstNode = nodeLst.item(s);

                if (fstNode.getNodeType() == Node.ELEMENT_NODE)
                {

                    Element fstElmnt = (Element) fstNode;
                    NodeList fstNmElmntLst = fstElmnt.getElementsByTagName("location");
                    Element fstNmElmnt = (Element) fstNmElmntLst.item(0);
                    NodeList fstNm = fstNmElmnt.getChildNodes();
                    System.out.println("location: " + fstNmElmnt.getNodeValue());
                    NodeList lstNmElmntLst = fstElmnt.getElementsByTagName("sizingBehavior");
                    Element lstNmElmnt = (Element) lstNmElmntLst.item(0);
                    System.out.println("location: " + lstNmElmnt.getNodeValue());
                }

            }
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }

    }

    public void draw()
    {
        removeExpiredEvents();
        pollListForNewActiveEvents();
        processActiveEvents();
    }

    private void pollListForNewActiveEvents()
    {

        for(int i=0;i<eventList.size(); i++)
        {
            if(eventList.get(i).startTime <= getTimeInSeconds()
                && eventList.get(i).startTime + eventList.get(i).duration >= getTimeInSeconds()
                && !activeEvents.contains(eventList.get(i)))
            {
                activeEvents.add(eventList.get(i));
            }
        }
    }

    private void processActiveEvents()
    {
        strokeWeight(1);
        eraseBackground();
        paintGreenHorizontalLine();
        noFill();
        //next, render latest image given activeEvent list
        for (CSEvent activeEvent : activeEvents)
        {
            activeEvent.updateImage(this, getTimeInSeconds());
        }
    }

    private void removeExpiredEvents()
    {
        List<Integer> indexesToRemove = new ArrayList<Integer>();
        for (int i = 0; i < activeEvents.size(); i++)
        {
            if (getTimeInSeconds() > activeEvents.get(i).startTime + activeEvents.get(i).duration)
            {
                indexesToRemove.add(i);
            }
        }

        for (int i = indexesToRemove.size(); i > 0; i--)
        {
            if(!(activeEvents.get(indexesToRemove.get(i-1)) instanceof CSImageSequence))
                activeEvents.remove(activeEvents.get(indexesToRemove.get(i-1)));
        }
    }


    public void oscEvent(OscMessage theOscMessage)
    {
        if (99 == theOscMessage.get(0).intValue())
        {
            totalDur = theOscMessage.get(1).doubleValue();
            bComplete = true;
        }
        else
        {
            CSEvent e = new CSEvent();
//            for(CSEvent e : activeEvents)
//            {
                e.instr = theOscMessage.get(0).intValue();
                e.startTime = getTimeInSeconds();
                e.duration = theOscMessage.get(2).doubleValue();
                e.iamp = theOscMessage.get(3).doubleValue();
                e.ipitch = theOscMessage.get(4).doubleValue();
                eventList.add(e);
//            }
        }
    }


    private double getTimeInSeconds()
    {
        return millis() * .001;
    }


    private void eraseBackground()
    {
        //clear the current image
        background(0);
        fill(0);
        stroke(0, 0, 0);
        rect(0, 0, width, height);
    }



    private void paintGreenHorizontalLine()
    {
        noFill();
        stroke(0, 255, 0);
        line(0, height * .5f, width, height * .5f);
    }



}
