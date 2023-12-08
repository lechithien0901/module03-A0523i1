<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 12/7/2023
  Time: 9:41 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<a href="/user_servlet">Back to the menu</a>
<fieldset>
    <legend>update</legend>
    <form method="post">
        <table>
            <tr>
                <td>Name:</td>
                <td><input type="text" id="name" name="name" value="${user.name}"></td>
            </tr>
            <tr>
                <td>Email:</td>
                <td><input type="text" id="email" name="email" value="${user.email}"></td>
            </tr>
            <tr>
                <td>Country:</td>
                <td><input type="text" id="country" name="country" value="${user.country}"></td>
            </tr>
            <tr><input type="submit" value="Update"></tr>
        </table>
    </form>

</fieldset>

</body>
</html>
