
<%@page import="com.leadmngmt.model.Staff"%>
<%@page import="com.leadmngmt.model.Role"%>
<%@page import="com.leadmngmt.model.SessionInfo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <script type="text/javascript">
            function validate() {
                var status = confirm("Are you sure?");
                if (status) {
                    return true;
                } else {
                    return false;
                }
            }
            
            function runAjaxForNotification() {
                var xmlhttp;
                var url = "/LeadManagement/admission_officer/notification";
                if (window.XMLHttpRequest)
                {
                    xmlhttp = new XMLHttpRequest();
                }
                else
                {
                    xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
                }
                xmlhttp.onreadystatechange = function ()
                {
                    if (xmlhttp.readyState == 4 && xmlhttp.status == 200)
                    {
                        document.getElementById("count").innerHTML = xmlhttp.responseText;
                    }
                }

                xmlhttp.open("POST", url, true);
                xmlhttp.send();
            }
        </script>
    </head>

    <body class="nav-md" onmousemove="runAjaxForNotification();">
        <%@include file="../../resources/includes/functions.jsp" %>

        <%
            disableBrowserCache(response);

            SessionInfo sessionInfo = new SessionInfo();
            if (sessionInfo.redirectPage(request).isEmpty() || sessionInfo.getUserRoleId() != Role.ADMIN) {
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
                                            <li><a href="/LeadManagement/administrator/addUser">Add New Staffs</a>
                                            </li>
                                            <li><a href="#">List of Staffs</a>
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
                                        <h2>Update Existing Users</h2>
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
                                                    <th>ID </th>
                                                    <th>Email </th>
                                                    <th>Name </th>
                                                    <th>Role </th>
                                                    <th>Faculty </th>
                                                    <th class=" no-link last">
                                                        <span class="nobr">Action</span>
                                                    </th>
                                                </tr>
                                            </thead>

                                            <tbody>
                                                <c:forEach items="${allUsers}" var="user">
                                                    <tr class="even pointer">
                                                        <td class=" "><c:out value="${user.id}" /></td>
                                                        <td class=" "><c:out value="${user.emailId}" /> </td>
                                                        <td class=" "><c:out value="${user.name}" /> </td>
                                                        <td class=" "><c:out value="${user.role.roleName}" /></td>
                                                        <td class=" "><c:out value="${user.facultyName}" /></td>
                                                        <td class=" last">
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
                                                                        <button type="button" class="btn btn-danger" id="but" data-dismiss="modal">Close</button>
                                                                        <input type="submit" value="Save changes" class="btn btn-default btn-success" />
                                                                    </div>
                                                                </form>
                                                            </div>
                                                        </div>
                                                    </div>
                                            </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>


                            <!--                            
                            Donut donut donut Donut donut donut Donut donut donut Donut donut donut
                            Donut donut donut
                            Donut donut donut
                            Donut donut donut
                            Donut donut donut
                            Donut donut donut-->

                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <div class="x_panel">
                                    <div class="x_title">
                                        <h2>Donut Graph</h2>
                                        <ul class="nav navbar-right panel_toolbox">
                                            <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                                            </li>
                                        </ul>
                                        <div class="clearfix"></div>
                                    </div>
                                    <div class="x_content">
                                        <canvas id="canvas_doughnut"></canvas>
                                    </div>
                                </div>
                            </div>

                            <!--                            
                            Donut donut donut Donut donut donut Donut donut donut Donut donut donut
                            Donut donut donut
                            Donut donut donut
                            Donut donut donut
                            Donut donut donut
                            Donut donut donut-->





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

