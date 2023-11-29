<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 11/28/2023
  Time: 3:57 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Product Discount Caculator</h1>
<form action="/product" method="post">
    <fieldset>
        <legend>Product Discount Calculator</legend>
        <table>
            <tr>
                <td>Product Description:</td>
                <td><input type="text" name="product" id="product"></td>
            </tr>
            <tr>
                <td>List Price:</td>
                <td><input type="text" name="list" id="list"></td>
            </tr>
            <tr>
                <td>Discount Percent:</td>
                <td><input type="text" name="percent" id="percent"></td>
            </tr>
            <tr><input type="submit" value=" Calculate Discount"></tr>
        </table>
    </fieldset>
</form>

</body>
</html>
