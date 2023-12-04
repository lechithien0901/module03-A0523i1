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
<p> <span class="message">
    <c:if test='${requestScope["message"]!=null}'>
        <c:out value="${message}"/>
    </c:if>

</span></p>
<a href="/users">Back to the menu</a>
<table border="1" cellpadding="5">
    <tr>
        <th>Name:</th>
        <td>${user.getName()}</td>
    </tr>
    <tr>
        <th>Email:</th>
        <td>${user.getEmail()}</td>
    </tr>
    <tr>
        <th>Country:</th>
        <td>${user.getCountry()}</td>
    </tr>
</table>

</body>
</html>
