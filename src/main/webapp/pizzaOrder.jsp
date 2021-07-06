<%--
  Created by IntelliJ IDEA.
  User: sebastiansantamaria
  Date: 7/1/21
  Time: 4:50 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Pizza
    </title>
    <%@include file="partials/head.jsp"%>
</head>
<body>
<h1 class="bg-primary">Order pizza!</h1>

<form action="pizza-order" method="POST">

    <div class="form-check">
        <input class="form-check-input" type="radio" name="size" id="small" value="small" checked>
        <label class="form-check-label" for="small">
            Small
        </label>
    </div>
    <div class="form-check">
        <input class="form-check-input" type="radio" name="size" id="medium" value="medium">
        <label class="form-check-label" for="medium">
            Medium
        </label>
    </div>
    <div class="form-check">
        <input class="form-check-input" type="radio" name="size" id="large" value="large">
        <label class="form-check-label" for="large">
            Large
        </label>
    </div>

    <div class="form-group">
        <label for="crust">Crust:</label>
        <select class="form-control" id="crust" name="crust">
            <option value="handtossed">Hand-tossed</option>
            <option value="thin">Thin</option>
            <option value="pan">Pan</option>
        </select>
    </div>

    <div class="form-group">
        <label for="sauce">Sauce:</label>
        <select class="form-control" id="sauce" name="sauce">
            <option value="marinara">Marinara</option>
            <option value="alfredo">Alfredo</option>
            <option value="buffalo">Buffalo</option>
        </select>
    </div>

    <p>Toppings:</p>
    <div class="form-check">
        <input class="form-check-input" type="checkbox" value="cheese" id="cheese" name="topping">
        <label class="form-check-label" for="cheese">
            Cheese
        </label>
    </div>
    <div class="form-check">
        <input class="form-check-input" type="checkbox" value="pepperoni" id="pepperoni" name="topping">
        <label class="form-check-label" for="pepperoni">
            Pepperoni
        </label>
    </div>
    <div class="form-check">
        <input class="form-check-input" type="checkbox" value="sausage" id="sausage" name="topping">
        <label class="form-check-label" for="sausage">
            Sausage
        </label>
    </div>



    <div class="form-group mt-3">
        <label for="address">Enter Your Address:</label>
        <textarea class="form-control" id="address" name="address" rows="3"></textarea>
    </div>



    <button type="submit">Submit pizza order</button>


</form>



</body>
</html>