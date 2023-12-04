<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 12/1/2023
  Time: 8:24 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<p>
    <span class="message">
        <c:if test='${requestScope["message"]!=null}'>
            <c:out value="${message}"/>
        </c:if>
    </span>
</p>
<a href="/users">Back to the menu</a>
<div align="center">
    <form method="post">
        <table cellpadding="5" border="1">
            <tr>
                <th>Name:</th>
                <td><input type="text" name="name" id="name" value="${user.getName()}"></td>
            </tr>
            <tr>
                <th>Email:</th>
                <td><input type="text" name="email"id="email"value="${user.getEmail()}"></td>
            </tr>
            <tr>
                <th>Country</th>
                <td><input type="text" name="country" id="country" value="${user.getCountry()}"></td>
            </tr>
            <tr>
                <th></th>
                <td><input type="submit" value="Update"></td>
            </tr>
        </table>
    </form>
</div>

</body>
</html>
