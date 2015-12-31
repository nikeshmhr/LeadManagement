<%-- 
    Document   : functions
    Created on : Dec 16, 2015, 1:18:41 PM
    Author     : Nikesh Maharjan
--%>

<%@page import="com.leadmngmt.model.SessionInfo"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%!
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
%>
