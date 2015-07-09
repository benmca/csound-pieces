package csoundbridge;

import processing.core.PApplet;
import processing.core.PConstants;

/**
 * Base class for all Csound Events.
 *
 * @author ben mcallister ben@listenfaster.com
 */
public class CSEvent
{
    public double startTime;
    public double duration;
    public double iamp;
    public double ipitch;
    public int instr;
    public int DisplayInfo;

    public void updateImage(PApplet applet, double mytime)
    {
        double timeIn = mytime - this.startTime;
        float scalar = (float) (timeIn / this.duration);
        float colorscalar = (float)this.iamp;
//        int xscalar = (int) (255 * (this.ipitch/500.0));
//        int yscalar = (int) (255-(255 * (this.iamp / 12700)));
        
        float xscalar = (float)(this.ipitch/3000.0);
        float yscalar = (float)this.iamp;

        applet.smooth();
        applet.strokeWeight(4);
//        applet.colorMode(PConstants.RGB,1);
//        if(this.instr == 2)
            applet.stroke(255*colorscalar,255*scalar,255*scalar);
//        else                
//            applet.stroke(colorscalar,scalar,0);
        applet.ellipse(xscalar*applet.width, applet.height*0.5f, (applet.height*0.5f)*scalar, (applet.height*0.5f)*scalar);
    }
}