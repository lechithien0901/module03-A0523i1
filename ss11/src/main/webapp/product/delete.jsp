<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 11/29/2023
  Time: 3:51 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<a href="/products">Back to the Menu</a>
<h1>Xóa đối tượng sản phẩm</h1>
<form method="post">
    <fieldset>
        <legend>Xóa đối tượng</legend>
        <table>
            <tr>
                <td>Tên đối tượng sản phẩm</td>
                <td>${requestScope["product"].getNameProduct()}</td>
            </tr>
            <tr>
                <td>Giá tiền của sản phẩm</td>
                <td>${requestScope["product"].getSalaryProduct()}</td>
            </tr>
            <tr>
                <td>Mô tả sản phẩm</td>
                <td>${requestScope["product"].getProductDescription()}</td>
            </tr>
            <tr>
                <td>Nhà sản xuất</td>
                <td>${requestScope["product"].getProducer()}</td>
            </tr>
            <tr>
                <td><input type="submit" value="delete"></td>
            </tr>
        </table>
    </fieldset>
</form>

</body>
</html>
