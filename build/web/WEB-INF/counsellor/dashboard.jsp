<%-- 
    Document   : dashboard
    Created on : Dec 27, 2015, 10:51:46 AM
    Author     : Nikesh Maharjan
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.leadmngmt.model.SessionInfo"%>
<%@page import="com.leadmngmt.model.Role"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Counsellor</title>
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

        <div id="container">
            <%@include file="../menus.jsp" %>

            <a href="/LeadManagement/counsellor/leads">List of leads (new)</a>

            <table class="table table-hover">
                <caption><h1>List of leads</h1></caption>
                <thead>
                    <tr>
                        <th>Name</th>
                        <th>Faculty</th>
                        <th>Status</th>
                        <th>Semester</th>
                        <th>Date of Entry</th>
                        <th>Followup Count</th>
                    </tr>
                </thead>

                <tbody>
                    <c:forEach var="lead" items="${leads}">
                        <tr>                            
                            <td>
                                <a href="/LeadManagement/counsellor/lead/details?id=<c:out value='${lead.id}' />">
                                    <c:out value="${lead.name}" />
                                </a>
                            </td>
                            <td><c:out value="${lead.faculty.facultyName}" /></td>
                            <td><c:out value="${lead.status.statusName}" /></td>
                            <td><c:out value="${lead.semester}" /></td>
                            <td><c:out value="${lead.dateOfEntry}" /></td>
                            <td><c:out value="${lead.followupCount}" /></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>

    </body>
</html>
