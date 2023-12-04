<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 12/4/2023
  Time: 2:58 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<a href="/users">Back to menu</a>
<p>
    <span class="message">
        <c:if test='${requestScope["message"]!=null}'>
            <c:out value="${message}"/>
        </c:if>

    </span>
</p>
<div align="center">
    <form method="post">
        <table border="1" cellpadding="5">
            <caption><h2>List of Users</h2></caption>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Country</th>

            </tr>
            <c:forEach var="user" items='${requestScope["list"]}'>
                <tr>
                    <td>${user.id}</td>
                    <td>${user.name}</td>
                    <td>${user.email}</td>
                    <td>${user.country}</td>

                </tr>

            </c:forEach>
            <tr><input type="submit" value="Sort"></tr>
        </table>
    </form>

</div>

</body>
</html>
