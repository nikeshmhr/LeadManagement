<%-- 
    Document   : dashboard
    Created on : Dec 27, 2015, 10:51:10 AM
    Author     : nilu
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
            if (sessionInfo.redirectPage(request).isEmpty() || sessionInfo.getUserRoleId() != Role.TOP_MANAGEMENT) {
                response.sendRedirect("/LeadManagement/login");
            }
        %>
        <h1>Hello Top Management!!</h1>
    </body>
</html>
