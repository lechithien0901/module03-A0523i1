<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 12/4/2023
  Time: 3:32 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<a href="/users">Back to the menu</a>
<form method="post">
    <tr>
        <td>Mời bạn nhập thành phố của bạn cần tìm</td>
        <td><input type="text" name="country" id="country"></td>

    </tr>
    <tr><td><input type="submit" value="Find"></td></tr>
</form>

</body>
</html>
