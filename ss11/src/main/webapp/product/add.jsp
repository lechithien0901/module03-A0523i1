<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 11/29/2023
  Time: 3:52 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <style>
        .message{
            color: black;
        }
    </style>
    <title>Title</title>
</head>
<a href="/products">Back to the menu</a>
<p>
    <c:if test='${requestScope["message"]!=null}'>
        <span class="message">${requestScope["message"]}</span>
    </c:if>
</p>
<body>
<form method="post">
    <fieldset>
        <legend>Tạo mới đối tượng</legend>
        <table>
            <tr>
                <td>Tên đối tượng:</td>
                <td><input type="text" id="name" name="name"></td>
            </tr>
            <tr>
                <td>Giá sản phẩm:</td>
                <td><input type="text" id="salary" name="salary"></td>
            </tr>
            <tr>
                <td>Mô tả sản phẩm:</td>
                <td><input type="text" id="mota" name="mota"></td>
            </tr>
            <tr>
                <td>Nhà sản xuất:</td>
                <td><input type="text" id="sanxuat" name="sanxuat"></td>
            </tr>
            <tr>
                <td><input type="submit" value="Create Product"></td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>
