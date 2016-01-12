<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.leadmngmt.model.Role"%>
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

        <script type="text/javascript">
            function validate(){
                var status = confirm("Are you sure?");
                if(status){
                    return true;
                }else{
                    return false;
                }
            }
        </script>
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
            <nav class="navbar navbar-default">
                <div class="container-fluid">
                    <!--brand and toggle get grouped for better mobile display-->
                    <!-- The following code is for the collapsed menu button -->
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
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
                        </ul>
                    </div>
                </div>
            </nav>


            <div class="clearfix"></div>


            <div class="welcome_text">
                <h1 class="pull-right">
                    Welcome, Administrator
                </h1>
            </div>


            <div id="entry_form_container" class="col-md-8">
                <ul class="nav nav-tabs">
                    <li><a href="/LeadManagement/administrator/addUser">Add New User</a></li>
                    <li class="active"><a href="#">Update Present Users</a></li>
                </ul>

                <!-- This label is out of the table  because of the table's hover property. The hover property doesn't show on this label now.-->
                <h3>Existing User Information</h3>

                <div class="row">
                    <div class="col-sm-6">
                        <div class="input-group">
                            <input type="text" class="form-control" placeholder="Search for...">
                            <span class="input-group-btn">
                                <button class="btn btn-default" type="button">Go!</button>
                            </span>
                        </div><!-- /input-group -->
                    </div><!-- /.col-lg-6 -->
                </div><!-- /.row -->


                <div class="col-sm-6 pull-left" style="width:50%;">
                    <form method="POST" action="#">
                        <table class="table table-hover">

                            <tr>
                                <td>ID</td>
                                <td>Email</td>
                                <td>Name</td>
                                <td>Role</td>
                                <td>Faculty</td>
                                <td>Action</td>
                            </tr>
                            <c:forEach items="${allUsers}" var="user">
                                <tr>
                                    <td><c:out value="${user.id}" /></td>
                                    <td><c:out value="${user.emailId}" /></td>
                                    <td><c:out value="${user.name}" /></td>
                                    <td><c:out value="${user.role.roleName}" /></td>
                                    <td><c:out value="${user.facultyName}" /></td>
                                    <td><a href="/LeadManagement/administrator/deleteUser?id=<c:out value='${user.id}' />" onclick="return validate();"><span class="glyphicon glyphicon-remove" /></a></td>
                                </tr>
                            </c:forEach>
                        </table>

                        <!-- This input type is out of the table  because of the table's hover property. The hover property doesn't show on this input type now.-->
                        <input type="submit" value="Update" name="update_user_info">
                    </form>
                </div>
            </div>


            <div class="pull-right" class="col-md-3">
                <img src="/LeadManagement/resources/images/logo.jpg" height="150" width="160">
            </div>
        </div>
    </body>
</html>