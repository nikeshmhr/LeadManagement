<%@page import="com.leadmngmt.model.Staff"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.leadmngmt.model.Role"%>
<%@page import="com.leadmngmt.model.SessionInfo"%>

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
        <div class="container body">


            <div class="main_container">

                <div class="col-md-3 left_col">
                    <div class="left_col scroll-view">

                        <div class="navbar nav_title" style="border: 0;">
                            <a href="#" class="site_title"><i class="fa fa-spinner"></i> <span>Islington</span></a>
                        </div>
                        <div class="clearfix"></div>


                        <!-- menu prile quick info -->
                        <div class="profile">
                            <div class="profile_pic">
                                <img src="/LeadManagement/resources/images/img.jpg" alt="..." class="img-circle profile_img">
                            </div>
                            <div class="profile_info">
                                <span>Welcome,</span>
                                <h2>
                                <%String display_name = sessionInfo.getId();
                                    Staff c = new Staff();
                                    c.setId(display_name);
                                    out.print(c.getNameForId());%>
                            </h2>
                            </div>
                        </div>
                        <!-- /menu prile quick info -->

                        <br />

                        <!-- sidebar menu -->
                        <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">

                            <div class="menu_section">
                                <h3>Menu</h3>
                                <ul class="nav side-menu">
                                    <li><a><i class="fa fa-home"></i> Home <span class="fa fa-chevron-down"></span></a>
                                        <ul class="nav child_menu" style="display: none">
                                            <li><a href="#">Add New Lead</a>
                                            </li>
                                            <li><a href="/LeadManagement/receptionist/add/bulk">Bulk Lead Entry</a>
                                            </li>

                                        </ul>
                                    </li>
                                </ul>
                            </div>

                        </div>
                        <!-- /sidebar menu -->
                        <!-- Side bar ends here Side bar ends here Side bar ends here Side bar ends here Side bar ends here
                        Side bar ends here Side bar ends here Side bar ends here Side bar ends here Side bar ends here
                        Side bar ends here Side bar ends here Side bar ends here Side bar ends here Side bar ends here
                        Side bar ends here Side bar ends here Side bar ends here Side bar ends here Side bar ends here
                        Side bar ends here Side bar ends here Side bar ends here Side bar ends here Side bar ends here
                        Side bar ends here Side bar ends here Side bar ends here Side bar ends here Side bar ends here -->


                        <!-- /menu footer buttons -->

                        <!-- /menu footer buttons -->
                    </div>
                </div>

                <!-- top navigation -->
                <!-- /top navigation -->
                <!-- top navigation top navigation top navigation top navigation top navigation
                top navigation top navigation top navigation top navigation top navigation
                top navigation top navigation top navigation top navigation top navigation
                top navigation top navigation top navigation top navigation top navigation
                top navigation top navigation top navigation top navigation top navigation
                top navigation top navigation top navigation top navigation top navigation
                top navigation top navigation top navigation top navigation top navigation
                top navigation top navigation top navigation top navigation top navigation
                top navigation top navigation top navigation top navigation top navigation
                top navigation top navigation top navigation top navigation top navigation -->
                
                <%@include file="../navigation.jsp" %>
                
                <!-- /top navigation -->
                <!-- top navigation top navigation top navigation top navigation top navigation
                top navigation top navigation top navigation top navigation top navigation
                top navigation top navigation top navigation top navigation top navigation
                top navigation top navigation top navigation top navigation top navigation
                top navigation top navigation top navigation top navigation top navigation
                top navigation top navigation top navigation top navigation top navigation
                top navigation top navigation top navigation top navigation top navigation
                top navigation top navigation top navigation top navigation top navigation
                top navigation top navigation top navigation top navigation top navigation
                top navigation top navigation top navigation top navigation top navigation -->



                <!-- page content -->
                <!-- main form main form main form main form main form main form main form
                main form main form main form main form main form main form main form
                main form main form main form main form main form main form main form
                main form main form main form main form main form main form main form
                main form main form main form main form main form main form main form
                main form main form main form main form main form main form main form
                main form main form main form main form main form main form main form -->

                <div class="right_col" role="main">

                    <div class="">
                        <div class="page-title">
                            <div class="title_left">
                                <h3></h3>
                            </div>

                            <div class="title_right">
                                <div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">

                                </div>
                            </div>
                        </div>
                        <div class="clearfix"></div>

                        <div class="row">
                            <div class="col-md-12 col-sm-12 col-xs-12">
                                <div class="x_panel">
                                    <div class="x_title">

                                        <!-- admin page header admin page header admin page header admin page header admin page header admin page header
                                        admin page header admin page header admin page header admin page header admin page header admin page header
                                        admin page header admin page header admin page header admin page header admin page header admin page header
                                        admin page header admin page header admin page header admin page header admin page header admin page header
                                        admin page header admin page header admin page header admin page header admin page header admin page header
                                        admin page header admin page header admin page header admin page header admin page header admin page header
                                        admin page header admin page header admin page header admin page header admin page header admin page header -->

                                        
                                        <h2>Adding New Leads</h2>
                                        <ul class="nav navbar-right panel_toolbox">
                                            <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                                            </li>

                                        </ul>
                                        <div class="clearfix"></div>
                                    </div>
                                    <div class="x_content">

                                        <form class="form-horizontal form-label-left" novalidate method="POST" action="/LeadManagement/receptionist/add/postData">

                                            <!-- add new staffs header add new staffs header add new staffs header add new staffs header add new staffs header
                                                add new staffs header add new staffs header add new staffs header add new staffs header add new staffs header
                                                add new staffs header add new staffs header add new staffs header add new staffs header add new staffs header
                                                add new staffs header add new staffs header add new staffs header add new staffs header add new staffs header
                                                add new staffs header add new staffs header add new staffs header add new staffs header add new staffs header
                                                add new staffs header add new staffs header add new staffs header add new staffs header add new staffs header
                                                add new staffs header add new staffs header add new staffs header add new staffs header add new staffs header -->



                                            <span class="section">Add New Leads</span>

                                            <div class="item form-group">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">Name <span class="required">*</span>
                                                </label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <input id="name" class="form-control col-md-7 col-xs-12" data-validate-length-range="6" data-validate-words="2" name="name" placeholder="both name(s) e.g Bipal Shakya" required="required" type="text">
                                                </div>
                                            </div>

                                            <div class="item form-group">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="email">Email <span class="required">*</span>
                                                </label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <input type="email" id="email" name="email_id" required="required" class="form-control col-md-7 col-xs-12">
                                                </div>
                                            </div>

                                            <div class="item form-group">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="email">Phone Number: <span class="required">*</span>
                                                </label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <input type="number" name="phone" required="required" class="form-control col-md-7 col-xs-12">
                                                </div>
                                            </div>
                                            
                                            <div class="form-group">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12">Date Of Birth <span class="required">*</span>
                                                </label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <input type="date" name="date_of_birth" required="required" type="text" >
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12">Faculty</label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <select class="form-control" name = "Faculty" required>
                                                        <option value="1">B.Sc. Computing</option>
                                                        <option value="2">B.Sc. Networking</option>
                                                        <option value="3">B.Sc. Multimedia</option>
                                                        <option value="4">B.B.A. Management</option>
                                                        <option value="5">M.Sc. IT</option>
                                                    </select>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12">Semester <span class="required">*</span>
                                                </label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <select class="form-control" name = "semester" required>
                                                        <option value="S">Spring</option>
                                                        <option value="A">Autumn</option>
                                                        
                                                    </select>
                                                </div>
                                            </div>
                                            
                                            <div class="form-group">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12">Gender:</label>
                                                <input type="radio" name="gender" value="true" checked> Male
                                                <input type="radio" name="gender" value="false"> Female
                                            </div>

                                            <div>${message}
                                            ${details}
                                            </div>
                                        
                                            <div class="ln_solid"></div>
                                            <div class="form-group">
                                                <div class="col-md-6 col-md-offset-3">
                                                    
                                                    <button id="send" type="submit" class="btn btn-success">Submit</button>
                                                    <button type="reset" class="btn btn-primary">Cancel</button>
                                                </div>
                                            </div>
                                            <!-- form ends here form ends here form ends here form ends here form ends here form ends here form ends here 
                                            form ends here form ends here form ends here form ends here form ends here form ends here form ends here 
                                            form ends here form ends here form ends here form ends here form ends here form ends here form ends here 
                                            form ends here form ends here form ends here form ends here form ends here form ends here form ends here 
                                            form ends here form ends here form ends here form ends here form ends here form ends here form ends here 
                                            form ends here form ends here form ends here form ends here form ends here form ends here form ends here  -->

                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- footer content -->
                    <!-- footer content footer content footer contentfooter contentfooter content footer content footer content
                    footer content footer content footer contentfooter contentfooter content footer content footer content
                    footer content footer content footer contentfooter contentfooter content footer content footer content
                    footer content footer content footer contentfooter contentfooter content footer content footer content
                    footer content footer content footer contentfooter contentfooter content footer content footer contentfooter
                    footer content footer content footer contentfooter contentfooter content footer content footer content--> 
                    <%@include file="../footer.jsp" %>