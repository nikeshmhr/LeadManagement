<%@page import="com.leadmngmt.model.SessionInfo"%>
<%@page import="com.leadmngmt.model.Role"%>
<!DOCTYPE html>

<%@include file="../header.jsp" %>


    <body class="nav-md">
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