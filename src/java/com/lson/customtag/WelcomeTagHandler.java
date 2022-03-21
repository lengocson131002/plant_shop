package com.lson.customtag;

import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.JspFragment;
import javax.servlet.jsp.tagext.SimpleTagSupport;

/**
 *
 * @author lengo
 */
public class WelcomeTagHandler extends SimpleTagSupport {

    private String name;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    /**
     * Called by the container to invoke this tag. The implementation of this
     * method is provided by the tag library developer, and handles all tag
     * processing, body iteration, etc.
     */
    @Override
    public void doTag() throws JspException {
        JspWriter out = getJspContext().getOut();
        try {

            if (name == null) {
                name = "";
            }

            out.println("<div>");
            out.println("<p class=\"text-warning\">Welcome " + name + "</p>");
            out.println("  <a class=\"btn btn-sm btn-success\" href=\"mainController?action=logout\">Logout</a>\n");
            out.println("</div>");

        } catch (java.io.IOException ex) {
            throw new JspException("Error in WelcomeTagHandler tag", ex);
        }
    }

}
