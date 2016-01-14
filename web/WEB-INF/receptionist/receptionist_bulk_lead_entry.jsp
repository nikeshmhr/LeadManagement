<%@page import="com.leadmngmt.model.SessionInfo"%>
<%@page import="com.leadmngmt.model.Role"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>LMS Reception</title>

        <!-- Importing bootstrap framework jquery and javascrip from js/ -->
        <script src="/LeadManagement/resources/js/jquery.min.js"></script>
        <script src="/LeadManagement/resources/js/bootstrap.min.js"></script>

        <!--Importing bootstrap min.css framework-->
        <link href="/LeadManagement/resources/css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <!--Importing custom overwriting css named style.css-->
        <link href="/LeadManagement/resources/css/style.css" rel="stylesheet" type="text/css">
        <!-- Linking the favicon icon-image -->
        <link rel="icon" type="image/png" href="/LeadManagement/resources/images/favicon.png" />        

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
            <%@include file="../menus.jsp" %>


            <div class="clearfix"></div>


            <div id="entry_form_container" class="col-md-8">
                <ul class="nav nav-tabs">
                    <li><a href="/LeadManagement/receptionist/add">Add New Lead Information</a></li>
                    <li class="active"><a href="#">Add Information in Bulk</a></li>
                </ul>

                <div class="col-sm-6 pull-left" style="width:50%;">
                    <form method="POST" action="#">
                        <table width="440px">
                            <label><h3>Bulk Information File Upload</h3></label>
                            <tr>
                                <td>Choose file:<br>(File format: .csv)</td>
                                <td>
                                    <input type="file" name="bulk_file">
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

            <div class="pull-right" class="col-md-3">
                <img src="/LeadManagement/resources/images/logo.jpg" height="150px" width="160px">
            </div>


            <div class="container">
            </div>

        </div>

    </body>
</html>