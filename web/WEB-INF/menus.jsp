<%-- 
    Document   : menus
    Created on : Jan 14, 2016, 3:57:59 PM
    Author     : Nikesh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Importing bootstrap framework jquery and javascrip from js/ -->
    <script src="/LeadManagement/resources/js/jquery.min.js"></script>
    <script src="/LeadManagement/resources/js/bootstrap.min.js"></script>

    <!--Importing bootstrap min.css framework-->

    <link href="/LeadManagement/resources/css/bootstrap.min.css" rel="stylesheet">
    <!--Importing custom overwriting css named style.css-->
    <link href="/LeadManagement/resources/css/style.css" rel="stylesheet">
    <!-- Linking the favicon icon-image -->
    <link rel="icon" type="image/png" href="/LeadManagement/resources/images/favicon.png">
</head>
<nav class="navbar navbar-default">
    <div class="container-fluid">
        <!--brand and toggle get grouped for better mobile display-->
        <!-- The following code is for the collapsed menu button -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" >
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
                <li><a href="/LeadManagement/logout">Log Out</a></li>               
                <li><a href="/LeadManagement/changepass">Change password</a></li>
            </ul>
        </div>
    </div>
</nav>