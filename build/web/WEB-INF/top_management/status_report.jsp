<%@page import="com.leadmngmt.model.Staff"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.leadmngmt.model.Role"%>
<%@page import="com.leadmngmt.model.SessionInfo"%>
<!DOCTYPE html>

<html lang="en">

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Meta, title, CSS, favicons, etc. -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>LMS Islington College</title>

        <!-- Bootstrap core CSS -->

        <link href="/LeadManagement/resources/css/bootstrap.min.css" rel="stylesheet">

        <link href="/LeadManagement/resources/fonts/css/font-awesome.min.css" rel="stylesheet">
        <link href="/LeadManagement/resources/css/animate.min.css" rel="stylesheet">

        <!-- Custom styling plus plugins -->
        <link href="/LeadManagement/resources/css/custom.css" rel="stylesheet">
        <link href="/LeadManagement/resources/css/icheck/flat/green.css" rel="stylesheet">
        <link href="/LeadManagement/css/datatables/tools/css/dataTables.tableTools.css" rel="stylesheet">


        <script src="/LeadManagement/resources/js/jquery.min.js"></script>
        <link rel="icon" type="image/png" href="/LeadManagement/resources/images/favicon.png">

        <!--[if lt IE 9]>
            <script src="../assets/js/ie8-responsive-file-warning.js"></script>
            <![endif]-->

        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
              <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
              <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
            <![endif]-->

    </head>

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
                                        <h2>Generate Status Report</h2>
                                        <ul class="nav navbar-right panel_toolbox">
                                            <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                                            </li>

                                        </ul>
                                        <div class="clearfix"></div>
                                    </div>
                                    <div class="x_content">
                                        <form action="/LeadManagement/top_management/reports/status" method="POST">
                                            <select name="statusId">
                                                <option value="0">Select Status</option>
                                                <c:forEach var="status" items="${status}">
                                                    <option value="<c:out value='${status.statusId}' />"><c:out value="${status.statusName}" /></option>
                                                </c:forEach>
                                            </select>
                                            <input type="submit" name="generate" value="Generate report" />
                                        </form>

                                        <c:if test="${listOfLeads ne null}">
                                            <table id="example" class="table table-striped responsive-utilities jambo_table">
                                                <thead>
                                                    <tr class="headings">
                                                        <th>Lead Name</th>
                                                        <th>Email</th>
                                                        <th>Date of Birth</th>
                                                        <th>Date of Entry</th>
                                                        <th>Semester</th>
                                                        <th class=" no-link last">
                                                            <span class="nobr">Counsellor</span>
                                                        </th>
                                                    </tr>
                                                </thead>

                                                <tbody>
                                                    <c:forEach var="leads" items="${listOfLeads}">
                                                        <tr class="even pointer">
                                                            <td><c:out value="${leads.name}" /></td>
                                                            <td><c:out value="${leads.email}" /></td>
                                                            <td><c:out value="${leads.dateOfBirth}" /></td>
                                                            <td><c:out value="${leads.dateOfEntry}" /></td> 
                                                            <td><c:out value="${leads.semester}" /></td>
                                                            <td class=" last">
                                                                <c:out value="${leads.counselor.name}" />
                                                            </td>
                                                        </tr>

                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                        </c:if>
                                    </div>
                                </div>
                            </div>








                            <br />
                            <br />
                            <br />

                        </div>
                    </div>

                    <!-- footer content -->
                    <!-- footer content footer content footer contentfooter contentfooter content footer content footer content
                    footer content footer content footer contentfooter contentfooter content footer content footer content
                    footer content footer content footer contentfooter contentfooter content footer content footer content
                    footer content footer content footer contentfooter contentfooter content footer content footer content
                    footer content footer content footer contentfooter contentfooter content footer content footer contentfooter
                    footer content footer content footer contentfooter contentfooter content footer content footer content--> 
                    <footer>
                        <div class="">
                            <p class="pull-right">Islington College Lead Management System by |
                                <span > <i class="fa fa-spinner"></i> Ella Productions</span>
                            </p>
                        </div>
                        <div class="clearfix"></div>
                    </footer>
                </div>
                <!-- /page content -->
            </div>

        </div>

        <div id="custom_notifications" class="custom-notifications dsp_none">
            <ul class="list-unstyled notifications clearfix" data-tabbed_notifications="notif-group">
            </ul>
            <div class="clearfix"></div>
            <div id="notif-group" class="tabbed_notifications"></div>
        </div>

        <script src="/LeadManagement/resources/js/bootstrap.min.js"></script>

        <!-- chart js -->
        <script src="/LeadManagement/resources/js/chartjs/chart.min.js"></script>
        <!-- bootstrap progress js -->
        <script src="/LeadManagement/resources/js/progressbar/bootstrap-progressbar.min.js"></script>
        <script src="/LeadManagement/resources/js/nicescroll/jquery.nicescroll.min.js"></script>
        <!-- icheck -->
        <script src="/LeadManagement/resources/js/icheck/icheck.min.js"></script>

        <script src="/LeadManagement/resources/js/custom.js"></script>


        <!-- Datatables -->
        <script src="/LeadManagement/resources/js/datatables/js/jquery.dataTables.js"></script>
        <script src="/LeadManagement/resources/js/datatables/tools/js/dataTables.tableTools.js"></script>
        <script>
            var randomScalingFactor = function () {
                return Math.round(Math.random() * 100)
            };


            $(document).ready(function () {
                $('input.tableflat').iCheck({
                    checkboxClass: 'icheckbox_flat-green',
                    radioClass: 'iradio_flat-green'
                });
            });

            var asInitVals = new Array();
            $(document).ready(function () {
                var oTable = $('#example').dataTable({
                    "oLanguage": {
                        "sSearch": "Search all columns:"
                    },
                    "aoColumnDefs": [
                        {
                            'bSortable': false,
                            'aTargets': [0]
                        } //disables sorting for column one
                    ],
                    'iDisplayLength': 12,
                    "sPaginationType": "full_numbers",
                    "dom": 'T<"clear">lfrtip',
                    "tableTools": {
                        "sSwfPath": "<?php echo base_url('assets2/js/Datatables/tools/swf/copy_csv_xls_pdf.swf'); ?>"
                    }
                });
                $("tfoot input").keyup(function () {
                    /* Filter on the column based on the index of this element's parent <th> */
                    oTable.fnFilter(this.value, $("tfoot th").index($(this).parent()));
                });
                $("tfoot input").each(function (i) {
                    asInitVals[i] = this.value;
                });
                $("tfoot input").focus(function () {
                    if (this.className == "search_init") {
                        this.className = "";
                        this.value = "";
                    }
                });
                $("tfoot input").blur(function (i) {
                    if (this.value == "") {
                        this.className = "search_init";
                        this.value = asInitVals[$("tfoot input").index(this)];
                    }
                });
            });
        </script>
    </body>

</html>

