<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 12/10/2023
  Time: 9:00 PM
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
    <legend>Update</legend>
    <form method="post">
        <tr>
            <td>Name</td>
            <td><input type="text" id="name" name="name" value="${productDTO.name}"></td>
        </tr>
        <tr>
            <td>Category:</td>
            <td>
                <select name="categoryId">
                    <option value="1" ${productDTO.category.id == 1 ? 'selected' : ''}>thien</option>
                    <option value="2" ${productDTO.category.id == 2 ? 'selected' : ''}>thanh</option>
                </select>
            </td>
        </tr>
        <tr>
            <td><input type="submit" value="update"></td>
        </tr>
    </form>


</fieldset>

</body>
</html>
