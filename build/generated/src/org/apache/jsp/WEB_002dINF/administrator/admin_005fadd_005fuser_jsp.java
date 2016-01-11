package org.apache.jsp.WEB_002dINF.administrator;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import com.leadmngmt.model.Role;
import com.leadmngmt.model.SessionInfo;
import com.leadmngmt.model.SessionInfo;
import java.util.HashMap;
import java.util.Map;

public final class admin_005fadd_005fuser_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {


    /**
     * Returns the username of the current session if any.
     */
    /*String getSessionUser(HttpServletRequest req, HttpServletResponse resp) throws ServletException {
     String user = null;

     HttpSession session = req.getSession(false);
     if (session.getAttribute("userId") != null) {
     user = session.getAttribute("userId").toString();
     }

     return user;
     }

     /**
     * Returns the user role for the current session.
     */
    /*int getSessionUserRole(HttpServletRequest req, HttpServletResponse resp) throws ServletException {
     int role = 0;

     HttpSession session = req.getSession(false);
     if (session.getAttribute("userRole") != null) {

     role = (Integer) session.getAttribute("userRole");

     //System.out.println(role + " empty?");
     }

     return role;
     }
    
     SessionInfo getSessionUserInfo(HttpServletRequest req, HttpServletResponse resp) throws ServletException{
     SessionInfo sessionUser = new SessionInfo();
        
     sessionUser.setUserEmailId(getSessionUser(req, resp));
     sessionUser.setUserRoleId(getSessionUserRole(req, resp));
        
     return sessionUser;
     }*/
    void disableBrowserCache(HttpServletResponse response) {
        response.setHeader("Cache-Control", "no-cache"); //Forces caches to obtain a new copy of the page from the origin server
        response.setHeader("Cache-Control", "no-store"); //Directs caches not to store the page under any circumstance
        response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
        response.setHeader("Pragma", "no-cache"); //HTTP 1.0 backward compatibility*/
    }

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(1);
    _jspx_dependants.add("/WEB-INF/administrator/../../resources/includes/functions.jsp");
  }

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("    <head>\r\n");
      out.write("        <meta charset=\"utf-8\">\r\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\r\n");
      out.write("        <title>LMS Administrator</title>\r\n");
      out.write("\r\n");
      out.write("        <!-- Importing bootstrap framework jquery and javascrip from js/ -->\r\n");
      out.write("        <script src=\"/LeadManagement/resources/js/jquery.min.js\"></script>\r\n");
      out.write("        <script src=\"/LeadManagement/resources/js/bootstrap.min.js\"></script>\r\n");
      out.write("\r\n");
      out.write("        <!--Importing bootstrap min.css framework-->\r\n");
      out.write("        <link href=\"/LeadManagement/resources/css/bootstrap.min.css\" rel=\"stylesheet\">\r\n");
      out.write("        <!--Importing custom overwriting css named style.css-->\r\n");
      out.write("        <link href=\"/LeadManagement/resources/css/style.css\" rel=\"stylesheet\">\r\n");
      out.write("        <!-- Linking the favicon icon-image -->\r\n");
      out.write("        <link rel=\"icon\" type=\"image/png\" href=\"/LeadManagement/resources/images/favicon.png\">\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("        <!-- Internal css for image logo -->\r\n");
      out.write("        <style type=\"text/css\">\r\n");
      out.write("            img {\r\n");
      out.write("                opacity: .3;\r\n");
      out.write("            }\r\n");
      out.write("        </style>\r\n");
      out.write("    </head>\r\n");
      out.write("    <body>\r\n");
      out.write("        ");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write('\r');
      out.write('\n');
      out.write("\r\n");
      out.write("        ");

            disableBrowserCache(response);
            
            SessionInfo sessionInfo = new SessionInfo();
            if (sessionInfo.redirectPage(request).isEmpty() || sessionInfo.getUserRoleId() != Role.ADMIN) {
                response.sendRedirect("/LeadManagement/login");
            }
        
      out.write("\r\n");
      out.write("        <div class=\"container\">\r\n");
      out.write("            <nav class=\"navbar navbar-default\">\r\n");
      out.write("                <div class=\"container-fluid\">\r\n");
      out.write("                    <!--brand and toggle get grouped for better mobile display-->\r\n");
      out.write("                    <!-- The following code is for the collapsed menu button -->\r\n");
      out.write("                    <div class=\"navbar-header\">\r\n");
      out.write("                        <button type=\"button\" class=\"navbar-toggle collapsed\" data-toggle=\"collapse\" data-target=\"#bs-example-navbar-collapse-1\">\r\n");
      out.write("                            <span class=\"sr-only\"></span>\r\n");
      out.write("                            <span class=\"icon-bar\"></span>\r\n");
      out.write("                            <span class=\"icon-bar\"></span>\r\n");
      out.write("                            <span class=\"icon-bar\"></span>\r\n");
      out.write("                        </button>\r\n");
      out.write("                    </div>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("                    <!-- Collect the nav links, forms, and other content for toggling -->\r\n");
      out.write("                    <div class=\"collapse navbar-collapse\" id=\"bs-example-navbar-collapse-1\">\r\n");
      out.write("                        <ul class=\"nav navbar-nav\">\r\n");
      out.write("                            <li><a href=\"#\">Support</a></li>\r\n");
      out.write("                        </ul>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("            </nav>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("            <div class=\"clearfix\"></div>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("            <div class=\"welcome_text\">\r\n");
      out.write("                <h1 class=\"pull-right\">\r\n");
      out.write("                    Welcome, Administrator\r\n");
      out.write("                </h1>\r\n");
      out.write("            </div>\r\n");
      out.write("\r\n");
      out.write("            ");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${message}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\r\n");
      out.write("            ");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${details}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\r\n");
      out.write("            <div id=\"entry_form_container\" class=\"col-md-8\">\r\n");
      out.write("                <ul class=\"nav nav-tabs\">\r\n");
      out.write("                    <li class=\"active\"><a href=\"#\">Add New User</a></li>\r\n");
      out.write("                    <li><a href=\"/LeadManagement/administrator/updateUser\">Update Present Users</a></li>\r\n");
      out.write("                </ul>\r\n");
      out.write("\r\n");
      out.write("                <div class=\"col-sm-6 pull-left\" style=\"width:50%;\">\r\n");
      out.write("                    <form method=\"POST\" action=\"/LeadManagement/administrator/addUser\">\r\n");
      out.write("                        <table>\r\n");
      out.write("                            <label><h3>New System User Entry</h3></label>\r\n");
      out.write("                            <tr>\r\n");
      out.write("                                <td>Name: </td>\r\n");
      out.write("                                <td><input type=\"text\" name=\"name\" placeholder=\"Name\" required></td>\r\n");
      out.write("                            </tr>\r\n");
      out.write("                            <tr>\r\n");
      out.write("                                <td>Email ID: </td>\r\n");
      out.write("                                <td><input type=\"email\" name=\"email_id\" placeholder=\"Email ID\" required></td>\r\n");
      out.write("                            </tr>\r\n");
      out.write("                            <tr>\r\n");
      out.write("                                <td>Date of Birth: </td>\r\n");
      out.write("                                <td><input type=\"date\" name=\"date_of_birth\" required></td>\r\n");
      out.write("                            </tr>\r\n");
      out.write("                            <tr>\r\n");
      out.write("                                <td>Role:</td>\r\n");
      out.write("                                <td>\r\n");
      out.write("                                    <select name = \"Role\" required>\r\n");
      out.write("                                        <option>Select Role</option>\r\n");
      out.write("                                        <option value=\"2\">Counselor</option>\r\n");
      out.write("                                        <option value=\"3\">Receptionist</option>\r\n");
      out.write("                                        <option value=\"4\">Admission Officer</option>\r\n");
      out.write("                                        <option value=\"5\">Top Management</option>\r\n");
      out.write("                                    </select>\r\n");
      out.write("                                </td>\r\n");
      out.write("                            </tr>\r\n");
      out.write("                            <tr>\r\n");
      out.write("                                <td>Faculty:</td>\r\n");
      out.write("                                <td>\r\n");
      out.write("                                    <select name = \"Faculty\">\r\n");
      out.write("                                        <option>Select Faculty</option>\r\n");
      out.write("                                        <option value=\"1\">Computing</option>\r\n");
      out.write("                                        <option value=\"2\">Networking</option>\r\n");
      out.write("                                        <option value=\"3\">Multimedia</option>\r\n");
      out.write("                                        <option value=\"4\">Management</option>\r\n");
      out.write("                                        <option value=\"6\">N/A</option>\r\n");
      out.write("                                    </select>\r\n");
      out.write("                                </td>\r\n");
      out.write("                            </tr>\r\n");
      out.write("                            <tr>\r\n");
      out.write("                                <td>Gender: </td>\r\n");
      out.write("                                <td>\r\n");
      out.write("                                    <input type=\"radio\" name=\"gender\" value=\"true\" checked> Male\r\n");
      out.write("                                    <input type=\"radio\" name=\"gender\" value=\"false\"> Female\r\n");
      out.write("                                </td>\r\n");
      out.write("                            </tr>\r\n");
      out.write("                            <tr>\r\n");
      out.write("                                <td></td>\r\n");
      out.write("                                <td>\r\n");
      out.write("                                    <input type=\"submit\" name=\"Submit\">\r\n");
      out.write("                                    <input type=\"reset\" value=\"Clear\">\r\n");
      out.write("                                </td>\r\n");
      out.write("                            </tr>\r\n");
      out.write("                        </table>\r\n");
      out.write("                    </form>\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("            <div class=\"pull-right\" class=\"col-md-3\" >\r\n");
      out.write("                <img src=\"/LeadManagement/resources/images/logo.jpg\" height=\"150\" width=\"160\">\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("    </body>\r\n");
      out.write("</html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
