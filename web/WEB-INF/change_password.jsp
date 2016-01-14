<%-- 
    Document   : change_password
    Created on : Jan 14, 2016, 3:05:19 PM
    Author     : Nikesh Maharjan
--%>

<%@page import="com.leadmngmt.model.Role"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
    <head>
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
    </head>
    <body>
        <%@include file="../resources/includes/functions.jsp" %>
        <%
            disableBrowserCache(response);

            /*SessionInfo sessionInfo = new SessionInfo();
            if (sessionInfo.redirectPage(request).isEmpty() || sessionInfo.getUserRoleId() != Role.ADMIN) {
                response.sendRedirect("/LeadManagement/login");
            }*/
        %>

        <%
            if (request.getAttribute("changed") != null) {
                out.print(request.getAttribute("changed"));
                response.sendRedirect("/LeadManagement/logout");
            }
        %>
        <form action="/LeadManagement/changepass" method="post">
            <div>
                <label for="old">Old Password</label>
                <input type="password" name="old" /> <span style="color:red;"><c:out value="${incorrect}" /></span>
            </div>
            <div>
                <label for="new">New Password</label>
                <input type="password" name="new" id="new" />
            </div>
            <div>
                <label for="newAgain">Confirm Password</label>
                <input type="password" name="confirmPass" id="confirm" />
            </div>
            <div>
                <input type="submit" value="Done" name="done" onclick="return validate();" />
            </div>
            <input type="hidden" value="<%= (session.getAttribute("userId"))%>" name="email" />
            <div>
                <span id="msg"></span>
            </div>
        </form>

        <%= (session.getAttribute("userId"))%>
    </body>
