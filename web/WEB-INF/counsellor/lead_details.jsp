<%-- 
    Document   : lead_details
    Created on : Jan 14, 2016, 7:16:45 PM
    Author     : Nikesh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.leadmngmt.model.Role"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lead Details</title>
        <!-- Importing bootstrap framework jquery and javascrip from js/ -->
        <script src="/LeadManagement/resources/js/jquery.min.js"></script>
        <script src="/LeadManagement/resources/js/bootstrap.min.js"></script>

        <!--Importing bootstrap min.css framework-->

        <link href="/LeadManagement/resources/css/bootstrap.min.css" rel="stylesheet">
        <!--Importing custom overwriting css named style.css-->
        <link href="/LeadManagement/resources/css/style.css" rel="stylesheet">
        <!-- Linking the favicon icon-image -->
        <link rel="icon" type="image/png" href="/LeadManagement/resources/images/favicon.png">
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
        <h2>Details of Lead:</h2>
        Name: <c:out value="${lead.name}" /> <br/>
        Email: <c:out value="${lead.email}" /><br/>
        Faculty: <c:out value="${lead.faculty.facultyName}" /><br/>
        Status: <c:out value="${lead.status.statusName}" /><br/>
        Phone: <c:out value="${lead.phone}" /><br/>
        Followup Count: <c:out value="${lead.followupCount}" /><br/>
        Semester: <c:out value="${lead.semester}" /><br/>
        Gender: <c:choose><c:when test="${lead.gender}">Male</c:when><c:otherwise>Female</c:otherwise></c:choose> <br/>
        DOB: <c:out value="${lead.dateOfBirth}" /><br/>
        DOE: <c:out value="${lead.dateOfEntry}" /><br/>
        Next followup date: <c:out value="${lead.nextFollowup}" />
    </body>
</html>
