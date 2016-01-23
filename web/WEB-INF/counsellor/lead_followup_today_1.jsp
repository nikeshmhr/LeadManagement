<%-- 
    Document   : lead_followup_today
    Created on : Jan 20, 2016, 1:18:56 PM
    Author     : Nikesh Maharjan
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.leadmngmt.model.Role"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Followup Today</title>
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
        <h1>Leads to followup today.</h1>
        <c:out value="Msg: ${message}" />

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
                    <th>Followup done?</th>
                    <th>&nbsp;</th>
                </tr>
            </thead>

            <tbody>
                <c:forEach var="lead" items="${leads}">

                    <tr>
                        <td><c:out value="${lead.name}" /></td>
                        <td><c:out value="${lead.faculty.facultyName}" /></td>
                        <td><c:out value="${lead.status.statusName}" /></td>
                        <td><c:out value="${lead.semester}" /></td>
                        <td><c:out value="${lead.dateOfEntry}" /></td>
                        <td><c:out value="${lead.followupCount}" /></td>
                        <td>
                            <a href="#<c:out value='${lead.id}' />" data-toggle="modal">Yes</a>
                            |
                            <a href="/LeadManagement/counsellor/lead/followUpNotDone?id=<c:out value='${lead.id}' />">No</a>
                        </td>
                        <td>
                            <form action="/LeadManagement/counsellor/lead/sendForAdmission" method="post">
                                <div class="form-group">
                                    <input type="hidden" name="leadIdAgain" value="<c:out value='${lead.id}' />" />
                                    <input type="submit" value="Send for admission" class="btn btn-default btn-primary" />
                                </div>
                            </form>
                        </td>
                    </tr>
                <div class="modal fade" tabindex="-1" role="dialog" id="<c:out value='${lead.id}' />">
                    <div class="modal-dialog">
                        <div class="modal-content">

                            <form action="/LeadManagement/counsellor/lead/followupDone" method="post">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                    <h4 class="modal-title">Update Followup Info</h4>
                                </div>

                                <div class="modal-body">
                                    <h3>Information</h3>
                                    <b>
                                        <div class="text-info">Name: <c:out value="${lead.name}" /></div>
                                        <div class="text-info">Email: <c:out value="${lead.email}" /></div>
                                        <div class="text-info">Phone: <c:out value="${lead.phone}" /></div>
                                        <div class="text-info">DOB: <c:out value="${lead.dateOfBirth}" /></div>
                                        <div class="text-info">DOE: <c:out value="${lead.dateOfEntry}" /></div>
                                        <div class="text-info">Faculty: <c:out value="${lead.faculty.facultyName}" /></div>
                                        <div class="text-info">Semester: <c:out value="${lead.semester}" /></div>
                                        <div class="text-info">Followup Count: <c:out value="${lead.followupCount}" /></div>
                                        <div class="text-info">Next followup on: <c:out value="${lead.nextFollowup}" /></div>
                                    </b>
                                    <hr/>
                                    <h3>Actions</h3>
                                    <div class="form-group">
                                        <label for="status">Status</label>
                                        <select name="status" class="form-control">
                                            <option value="1">Interested</option>
                                            <option value="2">Dismissed (Not Interested)</option>
                                            <option value="3">Postpond</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label for="feedback">Feedback</label>
                                        <input type="hidden" name="leadId" value="<c:out value='${lead.id}' />" />
                                        <input type="hidden" name="followupCount" value="<c:out value='${lead.followupCount}' />" />
                                        <textarea class="form-control" name="feedback" required placeholder="Write you comments here..." ></textarea>
                                    </div>
                                    <!-- just for conversion -->
                                    <div class="modal-footer">
                                        <input type="hidden" name="action" value="update" />
                                        <button type="button" class="btn btn-danger" id="but" data-dismiss="modal">Close</button>
                                        <input type="submit" value="Save changes" class="btn btn-default btn-success" />
                                    </div>
                            </form>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>
