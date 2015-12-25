<%-- 
    Document   : home
    Created on : Dec 23, 2015, 12:57:56 PM
    Author     : nilu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>${name}</h1>
        
        <%@include file="../resources/includes/functions.jsp" %>
        <%
            SessionInfo sessionInfo = getSessionUserInfo(request, response);
            
            out.println("Email-ID: " + sessionInfo.getUserEmailId());
        %>
    </body>
</html>
