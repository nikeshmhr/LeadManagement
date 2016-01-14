<%@page import="com.leadmngmt.model.Role"%>
<%@page import="com.leadmngmt.model.SessionInfo"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>LMS Administrator</title>

        <!-- Importing bootstrap framework jquery and javascrip from js/ -->
        <script src="/LeadManagement/resources/js/jquery.min.js"></script>
        <script src="/LeadManagement/resources/js/bootstrap.min.js"></script>

        <!--Importing bootstrap min.css framework-->
        <link href="/LeadManagement/resources/css/bootstrap.min.css" rel="stylesheet">
        <!--Importing custom overwriting css named style.css-->
        <link href="/LeadManagement/resources/css/style.css" rel="stylesheet">
        <!-- Linking the favicon icon-image -->
        <link rel="icon" type="image/png" href="/LeadManagement/resources/images/favicon.png">


        <!-- Internal css for image logo -->
        <style type="text/css">
            img {
                opacity: .3;
            }
        </style>
    </head>
    <body>
        <%@include file="../../resources/includes/functions.jsp" %>
        <%
            disableBrowserCache(response);

            SessionInfo sessionInfo = new SessionInfo();
            if (sessionInfo.redirectPage(request).isEmpty() || sessionInfo.getUserRoleId() != Role.ADMIN) {
                response.sendRedirect("/LeadManagement/login");
            }
        %>
        <div class="container">
            <%@include file="../menus.jsp" %>


            <div class="clearfix"></div>


            <div class="welcome_text">
                <h1 class="pull-right">
                    Welcome, Administrator
                </h1>
            </div>

            ${message}
            ${details}
            <div id="entry_form_container" class="col-md-8">
                <ul class="nav nav-tabs">
                    <li class="active"><a href="#">Add New User</a></li>
                    <li><a href="/LeadManagement/administrator/updateUser">Update Present Users</a></li>
                </ul>

                <div class="col-sm-6 pull-left" style="width:50%;">
                    <form method="POST" action="/LeadManagement/administrator/addUser">
                        <table>
                            <label><h3>New System User Entry</h3></label>
                            <tr>
                                <td>Name: </td>
                                <td><input type="text" name="name" placeholder="Name" required></td>
                            </tr>
                            <tr>
                                <td>Email ID: </td>
                                <td><input type="email" name="email_id" placeholder="Email ID" required></td>
                            </tr>
                            <tr>
                                <td>Date of Birth: </td>
                                <td><input type="date" name="date_of_birth" required></td>
                            </tr>
                            <tr>
                                <td>Role:</td>
                                <td>
                                    <select name = "Role" required>
                                        <option>Select Role</option>
                                        <option value="2">Counselor</option>
                                        <option value="3">Receptionist</option>
                                        <option value="4">Admission Officer</option>
                                        <option value="5">Top Management</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>Faculty:</td>
                                <td>
                                    <select name = "Faculty" required>
                                        <option value="1">Computing</option>
                                        <option value="2">Networking</option>
                                        <option value="3">Multimedia</option>
                                        <option value="4">Management</option>
                                        <option value="6">N/A</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>Gender: </td>
                                <td>
                                    <input type="radio" name="gender" value="true" checked> Male
                                    <input type="radio" name="gender" value="false"> Female
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td>
                                    <input type="submit" name="Submit">
                                    <input type="reset" value="Clear">
                                </td>
                            </tr>
                        </table>
                    </form>
                </div>
            </div>


            <div class="pull-right" class="col-md-3" >
                <img src="/LeadManagement/resources/images/logo.jpg" height="150" width="160">
            </div>
        </div>
    </body>
</html>