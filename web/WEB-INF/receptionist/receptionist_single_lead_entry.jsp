<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.leadmngmt.model.Role"%>
<%@page import="com.leadmngmt.model.SessionInfo"%>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>LMS Reception</title>

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
            if (sessionInfo.redirectPage(request).isEmpty() || sessionInfo.getUserRoleId() != Role.RECEPTIONIST) {
                response.sendRedirect("/LeadManagement/login");
            }
        %>
        <div class="container">
            <nav class="navbar navbar-default">
                <div class="container-fluid">
                    <!--brand and toggle get grouped for better mobile display-->
                    <!-- The following code is for the collapsed menu button -->
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" >
                            <span class="sr-only"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                    </div>


                    <!-- Collect the nav links, forms, and other content for toggling -->
                    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                        <ul class="nav navbar-nav">
                            <li><a href="#">Support</a></li>
                            <li><a href="/LeadManagement/logout">Log Out</a></li>
                        </ul>
                    </div>
                </div>
            </nav>


            <div class="welcome_text"> 
                <h1 class="pull-right">
                    Welcome, Receptionist
                </h1>
            </div>

            <div class="clearfix"></div>


            <div id="entry_form_container" class="col-md-8">
                <ul class="nav nav-tabs">
                    <li class="active"><a href="#">Add New Lead Information</a></li>
                    <li><a href="/LeadManagement/receptionist/add/bulk">Add Information in Bulk</a></li>
                </ul>                
                
                
                <div class="col-sm-6 pull-left" style="width:50%;">
                    <span>${message}</span>
                    <form method="POST" action="/LeadManagement/receptionist/add/postData">
                        <table>
                            <label><h3>New Lead Entry</h3></label>
                            <tr>
                                <td>Name: </td>
                                <td><input type="text" name="name" placeholder="Name" required /></td>
                            </tr>
                            <tr>
                                <td>Email ID: </td>
                                <td><input type="email" name="email_id" placeholder="Email ID" required /></td>
                            </tr>
                            <tr>
                                <td>Phone Number: </td>
                                <td><input type="number" name="phone" placeholder="Phone Number" required /></td>
                            </tr>
                            <tr>
                                <td>Date of Birth: </td>
                                <td><input type="date" name="date_of_birth" required /></td>
                            </tr>
                            <tr>
                                <td>Faculty:</td>
                                <td>
                                    <select name = "Faculty" required />
                            <option>Select Major</option>
                            <option value="1">B.Sc. Computing</option>
                            <option value="2">B.Sc. Networking</option>
                            <option value="3">B.Sc. Multimedia</option>
                            <option value="4">B.B.A. Management</option>
                            <option value="5">M.Sc. IT</option>
                            </select>
                            </td>
                            </tr>
                            <tr>
                                <td>Semester:</td>
                                <td>
                                    <input type="text" name="semester" placeholder="Semester" required />
                                </td>
                            </tr>
                            <tr>
                                <td>Gender: </td>
                                <td>
                                    <input type="radio" value="true" name="gender" checked> Male
                                    <input type="radio" value="false" name="gender"> Female
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


            <div class="pull-right col-md-3">
                <img src="/LeadManagement/resources/images/logo.jpg" height="150px" width="160px">
            </div>
        </div>
    </body>
</html>