<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 12/8/2023
  Time: 2:19 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <a href="/user_servlet">Back to the menu</a>
</head>
<body>
<fieldset>
    <legend>Delete</legend>
    <form method="post">
        <table>
            <tr>
                <td>Name</td>
                <td><c:out value="${user.name}"/></td>
            </tr>
            <tr>
                <td>Email:</td>
                <td><c:out value="${user.email}"/></td>
            </tr>
            <tr>
                <td>Country</td>
                <td><c:out value="${user.country}"/></td>
            </tr>
            <tr><input type="submit" value="Delete"></tr>
        </table>
    </form>

</fieldset>

</body>
</html>
