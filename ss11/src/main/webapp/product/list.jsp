
<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 11/29/2023
  Time: 3:52 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<p><a href="/products?action=add">Create Product</a></p>
<h1>Tạo Quản Lý Sản Phẩm</h1>

<table border="1">
    <tr>
        <th> Tên Sản Phẩm</th>
        <th> Giá Sản Phẩm</th>
        <th> Mô Tả của Sản Phẩm</th>
        <th> Nhà Sản Xuất</th>
        <th>Xóa</th>
        <th>Update</th>
    </tr>

    <c:forEach items='${requestScope["list"]}' var="i">
        <tr>
            <td><a href="/products?action=view&id=${i.getId()}">${i.getNameProduct()}</a></td>
            <td><c:out value="${i.getSalaryProduct()}"/></td>
            <td><c:out value="${i.getProductDescription() }"/></td>
            <td><c:out value="${i.getProducer()}"/></td>
            <td><a href="/products?action=delete&id=${i.getId()}">delete</a></td>
            <td><a href="/products?action=update&id=${i.getId()}">update</a></td>
        </tr>
    </c:forEach>
</table>


</body>
</html>
