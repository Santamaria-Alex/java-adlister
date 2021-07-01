<%--
  Created by IntelliJ IDEA.
  User: sebastiansantamaria
  Date: 6/30/21
  Time: 12:08 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    if (request.getMethod().equalsIgnoreCase("post")){
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        if (username.equals("admin") && password.equals("password")){
            response.sendRedirect("/profile.jsp");
        }
    }
%>
<html>
<head>
    <%@include file="partials/head.jsp"%>
    <title>Title</title>
</head>
<body>

    <div class="container">
        <form id="form" class="form" method="post" action="/login.jsp">
            <h2>Register With Us</h2>
            <div class="form-control">
                <label for="username">Username</label>
                <input name="username" type="text" id="username" placeholder="Enter Username">
            </div>

            <div class="form-control">
                <label for="password">Password</label>
                <input name="password" type="password" id="password" placeholder="Enter password">
            </div>

            <button type="submit">Submit</button>
        </form>
    </div>

<%@include file="partials/scripts.jsp"%>


</body>
</html>
