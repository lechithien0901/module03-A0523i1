<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 11/28/2023
  Time: 3:57 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<h1>Product Discount Calculator</h1>
<fieldset>
    <legend>Product Discount Calculator</legend>
    <table>
        <tr>
            <td>Product Description:</td>
            <td><c:out value="${productDescription}"/></td>
        </tr>
        <tr>
            <td>List Price:</td>
            <td><c:out value="${listPrice}"/></td>
        </tr>
        <tr>
            <td>Discount Percent:</td>
            <td><c:out value="${discountPercent}"/></td>
        </tr>
        <tr>
            <td>Discount Amount: Lượng chiết khấu</td>
            <td><c:out value="${discountAmount}"/></td>
        </tr>
        <tr>
            <td>Discount Price: Giá sau khi đã được chiết khấu</td>
            <td><c:out value="${discountPrice}"/></td>
        </tr>



    </table>
</fieldset>
</body>
</html>
