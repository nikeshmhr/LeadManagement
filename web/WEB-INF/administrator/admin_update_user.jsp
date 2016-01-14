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
            function validate() {
                var status = confirm("Are you sure?");
                if (status) {
                    return true;
                } else {
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
            <%@include file="../menus.jsp" %>


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

                <c:out value="${message}" />

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
                                    <td>
                                        <c:if test="${user.role.roleId != 1}">
                                            <a href="/LeadManagement/administrator/deleteUser?id=<c:out value='${user.id}' />" onclick="return validate();">
                                                <span class="glyphicon glyphicon-remove"></span>
                                            </a>
                                            |
                                            <a href="#<c:out value='${user.id}' />" data-toggle="modal">
                                                <span class="glyphicon glyphicon-edit" title="Edit"></span>
                                            </a> 
                                        </c:if>
                                    </td>
                                </tr>
                                <div class="modal fade" tabindex="-1" role="dialog" id="<c:out value='${user.id}' />">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <form action="/LeadManagement/administrator/updateUserInfo" method="post">
                                                <div class="modal-header">
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                                    <h4 class="modal-title">Edit User</h4>
                                                </div>

                                                <div class="modal-body">
                                                    <div class="form-group">
                                                        <label for="userId">User Id</label>
                                                        <input type="text" disabled="true" class="form-control" maxlength="10" value="<c:out value='${user.id}' />" />
                                                        <input type="hidden" name="userId" value="<c:out value='${user.id}' />" />
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="email">Email</label>
                                                        <input type="email" name="email" class="form-control" min="10" max="50" value="<c:out value="${user.emailId}" />" required />
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="name">Name</label>
                                                        <input type="text" name="name" class="form-control" min="3" value="<c:out value="${user.name}" />" />
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="role">Role</label>
                                                        <input type="text" class="form-control" value="<c:out value='${user.role.roleName}' />" disabled="" />
                                                        <input type="hidden" value="<c:out value='${user.role.roleId}' />" name="role" />
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="faculty">Faculty</label>
                                                        <select name = "faculty" required>
                                                            <option value="6">Select Faculty</option>
                                                            <option value="1" <c:if test="${user.facultyName eq 'Computing'}"><c:out value="selected" /></c:if>>Computing</option>
                                                            <option value="2" <c:if test="${user.facultyName eq 'Networking'}"><c:out value="selected" /></c:if>>Networking</option>
                                                            <option value="3" <c:if test="${user.facultyName eq 'Multimedia'}"><c:out value="selected" /></c:if>>Multimedia</option>
                                                            <option value="4" <c:if test="${user.facultyName eq 'Management'}"><c:out value="selected" /></c:if>>Management</option>
                                                            <option value="6" <c:if test="${user.facultyName eq 'NA'}"><c:out value="selected" /></c:if>>N/A</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <input type="hidden" name="action" value="update" />
                                                        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                                                        <input type="submit" value="Save changes" class="btn btn-default btn-success" />
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
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