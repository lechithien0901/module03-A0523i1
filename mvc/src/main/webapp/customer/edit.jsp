<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 11/27/2023
  Time: 7:02 PM
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
<body><h1>Edit Customer</h1>
<p>
    <c:if test='${requestScope["message"]!=null}'>
        <span class="message">${requestScope["message"]}</span>
    </c:if>
    <p>
    <a href="/customers">Back to Customers</a>
</p>
<form method="post">
    <fieldset>
        <legend>Customer edit</legend>
        <table>
            <tr>
                <td>Name:</td>
                <td><input type="text" name="name" id="name" value="${requestScope["customer"].getName()}"></td>
            </tr>
            <tr>
                <td>Email:</td>
                <td><input type="text" name="email" id="email" value="${requestScope["customer"].getEmail()}" ></td>
            </tr>
            <tr>
                <td>Email:</td>
                <td><input type="text" name="address" id="address" value="${requestScope["customer"].getAddress()}" }></td>
            </tr>
            <tr>
                <td><input type="submit" value="Update"></td>
            </tr>

        </table>
    </fieldset>
</form>
</p>

</body>
</html>
