<%-- 
    Document   : dashboard
    Created on : Dec 27, 2015, 10:51:46 AM
    Author     : nilu
--%>

<%@page import="com.leadmngmt.model.SessionInfo"%>
<%@page import="com.leadmngmt.model.Role"%>
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
            if (sessionInfo.redirectPage(request).isEmpty() || sessionInfo.getUserRoleId() != Role.COUNSELLOR) {
                response.sendRedirect("/LeadManagement/login");
            }
        %>
        <h1>Hello Counsellor!</h1>
    </body>
</html>
