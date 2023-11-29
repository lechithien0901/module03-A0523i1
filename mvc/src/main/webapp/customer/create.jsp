<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 11/27/2023
  Time: 7:01 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <style>
        .message{
            color: green;
        }
    </style>
</head>
<body>
<h1>Create new Customer</h1>
<p>
    <c:if test='${requestScope["message"]!=null}'>
<span class="message">${requestScope["message"]}</span>
    </c:if>
</p>
<p>
    <a href="/customers">Back to the menu</a>
</p>
<form method="post">
    <fieldset>
        <legend>Customer Information</legend>
        <table>
            <tr>
                <td>Name:</td>
                <td><input type="text" name="name" id="name"></td>
            </tr>
            <tr>
                <td>Email:</td>
                <td><input type="text"name="email"id="email"></td>
            </tr>
            <tr>
                <td>Address:</td>
                <td><input type="text"name="address"id="address"></td>
            </tr>
            <tr>
                <td><input type="submit" value="create"></td>
            </tr>
        </table>
    </fieldset>
</form>


</body>
</html>
