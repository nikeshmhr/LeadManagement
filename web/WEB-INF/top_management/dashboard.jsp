<%@page import="com.leadmngmt.model.Staff"%>
<%@page import="com.leadmngmt.model.Role"%>
<%@page import="com.leadmngmt.model.SessionInfo"%>
<!DOCTYPE html>

<%@include file="../header.jsp" %>


<body class="nav-md">
    <%@include file="../../resources/includes/functions.jsp" %>

    <%
        disableBrowserCache(response);

        SessionInfo sessionInfo = new SessionInfo();
        if (sessionInfo.redirectPage(request).isEmpty() || sessionInfo.getUserRoleId() != Role.TOP_MANAGEMENT) {
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
                                        <li><a href="/LeadManagement/top_management/reports/counsellor">Counsellor Report</a>
                                        </li>
                                        <li><a href="/LeadManagement/top_management/reports/activeLeads">Active Leads</a>
                                        </li>
                                        <li><a href="/LeadManagement/top_management/reports/status">Status Report</a>
                                        </li>
                                        <li><a href="/LeadManagement/top_management/reports/customized">Customized Report</a>
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


                                    <h2>Top Management Page</h2>
                                    <ul class="nav navbar-right panel_toolbox">
                                        <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                                        </li>

                                    </ul>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content">
                                    <div class="col-md-8 col-lg-8 col-sm-7">
                                        
                                        <!-- blockquote -->
                                        <blockquote>
                                            <p>Hello, <%out.print(c.getNameForId());%>! Welcome to your dashboard! You can navigate and generate different types of reports by browsing through the navigation bar in the side bar!</p><span class = "glyphicon glyphicon-arrow-left"></span>
                                        </blockquote>

                                        
                                    </div>
                                    
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