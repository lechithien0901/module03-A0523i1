<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 12/7/2023
  Time: 8:13 PM
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
    <legend>ADD</legend>
        <form method="post"><table>
            <tr>
                <td>Name:</td>
                <td><input type="text" id="name" name="name"></td>
            </tr>
            <tr><td>Email:</td>
                <td><input type="text" id="email" name="email"></td></tr>
            <tr><td>Country:</td>
                <td><input type="text" id="country" name="country"></td></tr>
            <tr>
                <td><input type="submit" value="add"></td>
            </tr>
        </table></form>


</fieldset>
</body>
</html>
