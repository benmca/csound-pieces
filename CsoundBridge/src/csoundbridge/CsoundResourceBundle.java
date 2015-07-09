/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package csoundbridge;

/**
 *
 * @author ben
 */
import java.util.*;
import java.net.*;

/***
 * ImageBundle is a ResourceBundle that produces ImageIcon objects
 * based on the locale.  All the images are GIFs that end with the
 * .gif suffix.  GIF files are assumed to have the same base name as
 * the key used to look them up.  An underscore followed by the country
 * id is appended to the basename to generate the file name.  The
 * default locale, represented by ImageBundle, has no country id.
 ***/
public class CsoundResourceBundle extends ResourceBundle {
  private String __fileSuffix;
  private static final Vector __KEYS;
  private static Hashtable __TABLE;

  static {
     __KEYS  = new Vector();
     __KEYS.addElement("language");
     __TABLE = new Hashtable();
  }

  private Object __loadImage(String basename, String extension) {
    String imageName = basename + __fileSuffix + extension;
    Object icon;
    URL url;

    icon = (Object)__TABLE.get(imageName);

    if(icon != null)
      return icon;

    url = CsoundResourceBundle.class.getResource("images/" + imageName);

    if(url == null)
      return null;

//    icon = new Object(url);
    icon = new String();
    __TABLE.put(imageName, icon);

    return icon;
  }

  protected CsoundResourceBundle(String suffix) {
    __fileSuffix = suffix;
  }

  public CsoundResourceBundle() {
    this("");
  }

  public Enumeration getKeys() {
    return __KEYS.elements();
  }

  protected final Object handleGetObject(String key) {
    // All of our files are GIFs named by key
    return __loadImage(key, ".gif");
  }

}

