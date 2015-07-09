/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package csoundbridge;

import java.awt.Image;
import java.net.URL;
import processing.core.PApplet;

/**
 *
 * @author ben
 */
public class CSImageSequence extends CSEvent
{
    public ImageDescriptor [] images = null;
    public int fps;
    public int x=0;
    public int y=0;
    public int width = 0;
    public int height = 0;

    /**
     *
     * @param applet
     * @param mytime
     */
    @Override
    public void updateImage(PApplet applet, double mytime)
    {
        if(images == null)throw new NullPointerException("Image Sequence not init'd, or no images loaded.");
        double timeIn = mytime - this.startTime;
        int numFrames = images.length;

        if(startTime <= mytime 
            && (startTime + duration) >= mytime
            && timeIn < duration)
        {
            int framesIn = (int)Math.floor(fps * timeIn);
            int curFrame = (framesIn > (numFrames-1)) ? (numFrames-1) : framesIn;
            applet.image(images[curFrame].image, x,y);
            System.out.printf("timeIn: %f, startTime: %f, duration: %f, curFrame: %d, framesIn: %d, numFrames: %d/n",
                    timeIn, startTime, duration, curFrame, framesIn, numFrames);
            System.out.println();
        }
        else
        {
            applet.image(images[0].image, x,y);
        }
    }

    /**
     * Loads constituent images
     */
    public CSImageSequence init(PApplet applet)
    {



        images = new ImageDescriptor[9];
        //launch gui to browse for images if not preset
        for(int i=0; i<4;i++)
        {
            images[i] = new ImageDescriptor();
            URL url = getClass().getResource("/csoundbridge/images/" + String.valueOf(i+1) + ".jpg");
            String path = url.getPath();
            images[i].image = applet.loadImage(path);
        }
        for(int i=4; i<7;i++)
        {
            images[i] = new ImageDescriptor();
            URL url = getClass().getResource("/csoundbridge/images/" + String.valueOf(i-3) + ".jpg");
            String path = url.getPath();
            images[i].image = applet.loadImage(path);
        }
        for(int i=7; i<9;i++)
        {
            images[i] = new ImageDescriptor();
            URL url = getClass().getResource("/csoundbridge/images/" + String.valueOf(i-5) + ".jpg");
            String path = url.getPath();
            images[i].image = applet.loadImage(path);
        }

        for(ImageDescriptor image : images)
        {
            width = image.image.width > width ? image.image.width : width;
            height = image.image.height > height ? image.image.height : height;
        }

        return this;

    }

    public void init(Image[] images)
    {

    }
}
