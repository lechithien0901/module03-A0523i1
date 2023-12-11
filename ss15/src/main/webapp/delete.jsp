<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 12/10/2023
  Time: 4:12 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<a href="/servlet">Back to the menu</a>
<fieldset>
    <legend>Delete</legend>
    <form method="post"> <table>
        <tr>
            <td>
                name:

            </td>
            <td>${productDTO.name}</td>
        </tr>
        <tr>
            <td>
                category:

            </td>
            <td>${productDTO.categoryName}</td>
        </tr>
        <tr>
            <input type="submit" value="Delete">
        </tr>
    </table></form>


</fieldset>
</body>
</html>
