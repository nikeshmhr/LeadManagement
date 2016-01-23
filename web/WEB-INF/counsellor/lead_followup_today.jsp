<%-- 
    Document   : lead_followup_today
    Created on : Jan 20, 2016, 1:18:56 PM
    Author     : Nikesh Maharjan
--%>

<%@page import="com.leadmngmt.model.Staff"%>
<%@page import="com.leadmngmt.model.Counsellor"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.leadmngmt.model.Role"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>

<html>

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
            if (sessionInfo.redirectPage(request).isEmpty() || sessionInfo.getUserRoleId() != Role.COUNSELLOR) {
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
                                            <li><a href="/LeadManagement/counsellor/dashboard">Dashboard</a>
                                            </li>
                                            <li><a href="/LeadManagement/counsellor/lead/followupToday">List of NEW Leads for you today</a>
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
                                        <h2>List of Leads to Follow up Today</h2>
                                        <ul class="nav navbar-right panel_toolbox">
                                            <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                                            </li>

                                        </ul>
                                        <div class="clearfix"></div>
                                    </div>
                                    <div class="x_content">
                                        <table id="example" class="table table-striped responsive-utilities jambo_table">
                                            <thead>
                                                <tr class="headings">
                                                    <th>Name</th>
                                                    <th>Faculty</th>
                                                    <th>Status</th>
                                                    <th>Semester</th>
                                                    <th>Date of Entry</th>
                                                    <th>Followup Count</th>
                                                    <th>Followup done?</th>
                                                    <th class=" no-link last">
                                                        <span class="nobr">&nbsp</span>
                                                    </th>
                                                </tr>
                                            </thead>

                                            <tbody>
                                                <c:forEach var="lead" items="${leads}">
                                                    <tr class="even pointer">
                                                        <td class=" "><c:out value="${lead.name}" /></td>
                                                        <td class=" "><c:out value="${lead.faculty.facultyName}" /></td>
                                                        <td class=" "><c:out value="${lead.status.statusName}" /></td>
                                                        <td class=" "><c:out value="${lead.semester}" /></td>
                                                        <td class=" "><c:out value="${lead.dateOfEntry}" /></td>
                                                        <td class=" "><c:out value="${lead.followupCount}" /></td>
                                                        <td class=" ">
                                                            <a href="#<c:out value='${lead.id}' />" data-toggle="modal">Yes</a>
                                                            |
                                                            <a href="/LeadManagement/counsellor/lead/followUpNotDone?id=<c:out value='${lead.id}' />">No</a>
                                                        </td>
                                                        <td class="last">
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
                                        </div>
                                    </c:forEach>
                                    </tbody>
                                    </table>
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
                            <span> <i class="fa fa-spinner"></i> Ella Productions</span>
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