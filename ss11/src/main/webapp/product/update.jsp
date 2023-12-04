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
    <style >
        .message{color: green}
    </style>
    <title>Title</title>
</head>
<body>
<a href="/products">Back to the menu</a>
<p>
    <c:if test='${requestScope["message"]!=null}'>
        <span class="message"><c:out value='${requestScope["message"]}'/></span>
    </c:if>
</p>
<h1>Update Sản phẩm</h1>
<form method="post"><fieldset>
    <legend>Update sản phẩm

    </legend>
    <table>
        <tr>
            <td>Tên sản phẩm:</td>
            <td><input type="text" name="name" id="name" value="${requestScope["product"].getNameProduct()}" ></td>
        </tr>
        <tr>
            <td>Giá Sản phẩm:</td>
            <td><input type="text" name="salary" id="salary" value="${requestScope["product"].getSalaryProduct()}"></td>
        </tr>
        <tr>
            <td>Mô tả của sản phẩm:</td>
            <td><input type="text" name="mota" id="mota" value="${requestScope["product"].getProductDescription()}"></td>
        </tr>
        <tr>
            <td>Nhà sản xuất</td>
            <td><input type="text" name="sanxuat" id="sanxuat" value="${requestScope["product"].getProducer()}" ></td>
        </tr>
        <tr>
            <td><input type="submit" value="Update Product"></td>
        </tr>
    </table>
</fieldset></form>


</body>
</html>
