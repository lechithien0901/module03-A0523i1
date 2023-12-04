<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 12/1/2023
  Time: 8:24 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <style>


    </style>
</head>
<body>
<div style="text-align: center;"><h1>User Management</h1>
    <a href="/users?action=add">Add New User</a>
    <h2>List Of User</h2>
</div>

<div align="center">
    <table border="1" cellpadding="5">
        <caption><h2>List of Users</h2></caption>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Country</th>
            <th>Actions</th>
        </tr>
        <c:forEach var="user" items='${requestScope["list"]}'>
            <tr>
                <td>${user.id}</td>
                <td>${user.name}</td>
                <td>${user.email}</td>
                <td>${user.country}</td>
                <td>
                    <a href="/users?action=update&id=${user.id}">Edit</a>
                    <a href="/users?action=delete&id=${user.id}">Delete</a>
                    <a href="/users?action=order">Order</a>
                    <a href="/users?action=find">Find</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>

</body>
</html>
