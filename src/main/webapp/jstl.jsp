<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: sebastiansantamaria
  Date: 6/30/21
  Time: 11:24 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
  request.setAttribute("LactoseIntolerant", true);

  List<String> dairyProdcuts = new ArrayList<>();
  dairyProdcuts.add("milk");
  dairyProdcuts.add("cheese");
  dairyProdcuts.add("yogurt");
  dairyProdcuts.add("icecream");
  dairyProdcuts.add("cottage cheese");
  dairyProdcuts.add("butter");

  request.setAttribute("dairyProducts", dairyProdcuts);

  boolean textIsBlue = true;
  request.setAttribute("blue", textIsBlue);



%>


<html>
<head>
    <title>JSPs: JSTL</title>
</head>
<body>

  <h1>Hello!</h1>
  <c:choose>
    <c:when test="${LactoseIntolerant}">
      <h1>You are lactose intolerant, please don't buy this crap.</h1>
    </c:when>
    <c:otherwise>
      <h3>Dairy Products List</h3>
      <c:forEach items="${dairyProducts}" var="dairyProduct">
        <div>
          <p>${dairyProduct}</p>
        </div>
      </c:forEach>
    </c:otherwise>
  </c:choose>

<c:if test="${blue}">
  <p style="color: blue">Blue text</p>
</c:if>

</body>
</html>
