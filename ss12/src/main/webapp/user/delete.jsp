<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 12/4/2023
  Time: 8:12 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<a href="/users">Back to menu</a>
<p> <span class="message">
    <c:if test='${requestScope["message"]!=null}'>
        <c:out value="${message}"/>
    </c:if>

</span></p>
<div align="center">
    <form method="post">
        <table border="1" cellpadding="4">

            <tr>
                <th>
                    name:
                </th>
                <td>${user.getName()}</td>
            </tr>
            <tr>
                <th>email:</th>
                <td>${user.getEmail()}</td>
            </tr>
            <tr>
                <th>country:</th>
                <td>${user.getCountry()}</td>
            </tr>
            <tr><td><input type="submit" value="delete"></td></tr>

        </table>
    </form>

</div>
</body>
</html>
