<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page import="com.leadmngmt.model.Role"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <title>Change Password</title>
        <script type="text/javascript" src="/LeadManagement/resources/js/jquery.min.js"></script>
        <script type="text/javascript" src="/LeadManagement/resources/js/bootstrap.min.js"></script>
        <link rel="stylesheet" type="text/css" href="/LeadManagement/resources/css/bootstrap.min.css" />
        <style type="text/css">
            #logo {
                height: 150px;
                width: 160px;
                margin-left: auto;
                margin-right: auto;
            }

            html, body {
                width: 100%;
                height: 100%;
            }

            .clear {
                clear: both;
            }

            #container {
                position: fixed;
                width: 340px;
                height: 280px;
                top: 50%;
                left: 50%;
                margin-top: -170px;
                margin-left: -170px;
                background-color: white;
            }

            #username {
                margin-top: 30px;
                background-color: #d3d3d3;
                padding: 10px;
                border: none;
                border-radius: 10px 0px 10px 0px;
            }

            p {
                text-align: center;
            }

            p a {
                font-size: 15px;
                color: #CB0012;
                float: right;
                margin-top: -13px;
            }

            p a:hover {
                color: #555;
            }

            input {
                color: #777;
                padding-left: 10px;
                margin-left: 19px;
                width: 280px;
                height: 40px;
                border: none;
                font-size: 15px;
            }

            input[type=text] {
                border-radius: 10px 10px 0px 0px;
                width: 280px;
            }

            input[type=password] {
                margin-top: 2px;
                margin-bottom: 2px;
            }

            input[type=submit] {
                background-color: #49486E;
                color: white;
                width: 280px;
                margin: 4px 15px 0px 19px;
                margin-bottom: 15px;
                border-radius: 0px 0px 10px 10px;
            }

            input[type=submit]:hover {
                cursor: pointer;
                background-color: #9392B2;
                color: #FFF;
            }
        </style>

        <script type="text/javascript">
            function validate() {
                //alert("clicked");
                var newpwd1 = document.getElementById("new").value;
                var newpwd2 = document.getElementById("confirm").value;
                //alert(newpwd1 + " " + newpwd2);
                if (newpwd1 === newpwd2) {
                    return true;
                } else {
                    document.getElementById("msg").innerHTML = "New password does not match.";
                    return false;
                }
            }
        </script>

        <!-- Linking the favicon icon-image -->
        <link rel="icon" type="image/png" href="resources/images/favicon.png">

    </head>

    <body>
        <%@include file="../resources/includes/functions.jsp" %>
        <%
            disableBrowserCache(response);

            SessionInfo sessionInfo = new SessionInfo();
            if (sessionInfo.redirectPage(request).isEmpty()) {
                int role = sessionInfo.getUserRoleId();
                if (role != Role.ADMIN || role != Role.ADMISSION_OFFICER || role != Role.COUNSELLOR || role != Role.RECEPTIONIST || role != Role.TOP_MANAGEMENT) {
                    response.sendRedirect("/LeadManagement/login");
                }
            }
        %>

        <%            if (request.getAttribute("changed") != null) {
                out.print(request.getAttribute("changed"));
                response.sendRedirect("/LeadManagement/logout");
            }
        %>
        <div id = "container">

            <div id = "username">
                <p><b>Change Password</b></p>
                <form action="/LeadManagement/changepass" method="post">
                    <div>
                        <input type="password" name="old" placeholder="Old Password"/> <span style="color:red;"><c:out value="${incorrect}" /></span>
                    </div>
                    <div>
                        <input type="password" name="new" id="new" placeholder="New Password"/>
                    </div>
                    <div>
                        <input type="password" name="confirmPass" id="confirm"  placeholder="Confirm Password"/>
                    </div>
                    <div>
                        <input type="submit" value="Done" name="done" onclick="return validate();" />
                    </div>
                    <input type="hidden" value="<%= (session.getAttribute("userId"))%>" name="email" />
                    <div>
                        <span id="msg"></span>
                    </div>
                </form>
            </div>
        </div>
        <% session.getAttribute("userId");%>

    </body>
</html>