<%-- 
    Document   : dashboard
    Created on : Dec 27, 2015, 10:52:15 AM
    Author     : Nikesh Maharjan
--%>

<%@page import="com.leadmngmt.model.Role"%>
<%@page import="com.leadmngmt.model.SessionInfo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="../../resources/includes/functions.jsp" %>
        <%
            disableBrowserCache(response);
            
            SessionInfo sessionInfo = new SessionInfo();
            if (sessionInfo.redirectPage(request).isEmpty() || sessionInfo.getUserRoleId() != Role.ADMISSION_OFFICER) {
                response.sendRedirect("/LeadManagement/login");
            }
        %>
        <h1>Hello Admission Officer!</h1>
    </body>
</html>
