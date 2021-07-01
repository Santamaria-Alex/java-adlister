<%--
  Created by IntelliJ IDEA.
  User: sebastiansantamaria
  Date: 6/30/21
  Time: 10:46 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    // Setting request attribute (this would usually be done in a servlet)
    request.setAttribute("userRole", "admin");

    String message;

    switch (request.getAttribute("userRole").toString()){
        case "admin":
            message = " administrator";
            break;
        case "s_admin":
            message = "super administrator";
            break;
        case "user_2":
            message = "active user";
            break;
        default:
            message = "unknown status";
    }

    request.setAttribute("userRoleMessage", message);


%>

<html>
<head>
    <title>Expression Language</title>
</head>
<body>


    <h1>${userRole}</h1>

    <h2>Your name is: ${param.name}</h2>
    <h3>User Status: ${userRoleMessage}</h3>


</body>
</html>
