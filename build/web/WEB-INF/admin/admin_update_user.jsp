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
    </head>
    <body>
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
                <span class="pull-right">
                    Welcome, Administrator
                </span>
            </div>


            <div id="entry_form_container" class="col-md-8">
                <ul class="nav nav-tabs">
                    <li><a href="admin_add_user.html">Add New User</a></li>
                    <li class="active"><a href="#">Update Present Users</a></li>
                </ul>

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

                <div class="col-sm-6 pull-left" style="background:#d3d3d3; width:50%;">
                    <form method="POST" action="#">
                        <table class="table table-hover">
                            <label><h3>Existing User Information</h3></label>
                            <tr>
                                <td>S.N.</td>
                                <td>Email</td>
                                <td>Name</td>
                                <td>Role</td>
                                <td>Faculty</td>
                            </tr>

                            <tr>
                                <td>1</td>
                                <td>nikesh_da_awesome@nick.com</td>
                                <td>Nikesh Da Awesome</td>
                                <td>God</td>
                                <td>Computing</td>
                            </tr>

                            <tr>
                                <td>2</td>
                                <td>bipalshakya@gmail.com</td>
                                <td>Bipal Man Shakya</td>
                                <td>Management</td>
                                <td>N/A</td>
                            </tr>

                            <tr>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td>
                                    <input type="submit" name="Update">
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