<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 12/1/2023
  Time: 8:24 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
<p>
    <span class="message">
        <c:if test='${requestScope["message"]!=null}'>
            <c:out value="${message}"/>
        </c:if>
    </span>
</p>
<h1 align="center">User Management</h1>
<a align="center" href="/users">Back to the menu</a>
<h2 align="center">Add new User</h2>
<div align="center">
    <form method="post">
        <table border="1" cellpadding="5px">
            <tr>
                <th>User Name:</th>
                <td><input type="text" name="name" id="name"></td>
            </tr>
            <tr>
                <th>
                    User Email:
                </th>
                <td><input type="text" name="email" id="email"></td>

            </tr>
            <tr>
                <th>Country:</th>
                <td><input type="text"name="country" id="country"></td>
            </tr>
            <tr>
                <td style="text-align: center"><input type="submit" value="Save"></td>
            </tr>
        </table>
    </form>

</div>
</body>
</html>
