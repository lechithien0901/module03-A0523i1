<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 12/11/2023
  Time: 3:57 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
</head>
<body>
<table class="table table-hower">
    <tr>
        <th>employee_id</th>
        <th>employee_name</th>
        <th>employee_birthday</th>
        <th>employee_id_card</th>
        <th>employee_salary</th>
        <th>employee_phone</th>
        <th>employee_email</th>
        <th>employee_address</th>
        <th>position_name</th>
        <th>education_degree_name</th>
        <th>division_name</th>
        <th>password</th>
    </tr>
    <c:forEach items="${list}" var="s">
        <tr>
            <td>${s.employee_id}</td>
            <td>${s.employee_name}</td>
            <td>${s.employee_birthday}</td>
            <td>${s.employee_id_card}</td>
            <td>${s.employee_salary}</td>
            <td>${s.employee_phone}</td>
            <td>${s.employee_email}</td>
            <td>${s.employee_address}</td>
            <td>${s.position_name}</td>
            <td>${s.education_degree_name}</td>
            <td>${s.division_name}</td>
            <td>${s.password}</td>
        </tr>
    </c:forEach>

</table>

</body>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
</html>
