<%-- 
    Document   : functions
    Created on : Dec 16, 2015, 1:18:41 PM
    Author     : Nikesh Maharjan
--%>

<%!
    /**
     * Returns the username of the current session if any.
     */
    String getSessionUser(HttpServletRequest req, HttpServletResponse resp) throws ServletException {
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
    int getSessionUserRole(HttpServletRequest req, HttpServletResponse resp) {
        int role = 0;

        HttpSession session = req.getSession(false);
        if (session.getAttribute("userRole") != null) {

            role = (Integer) session.getAttribute("userRole");

            //System.out.println(role + " empty?");
        }

        return role;
    }
%>
