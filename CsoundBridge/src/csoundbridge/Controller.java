package csoundbridge;
import java.awt.*;
import java.awt.event.*;
import java.applet.Applet;
/**
 *
 * @author ben
 */
public class Controller extends Frame {
    public Controller()
    {
        super("CsoundBridge");
        setSize(720,480);
        setLayout(new FlowLayout(FlowLayout.LEFT,0,0));
        ProcessingApplet a = new ProcessingApplet();
        add(a);
        setResizable(false);
        addWindowListener(new WindowAdapter(){
            public void windowClosing(WindowEvent e){
                System.exit(0);
                
            }
        });
        a.init();
    }
    
    public static void main(String[] s){
        new Controller().setVisible(true);
    }
    
}
