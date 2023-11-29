
<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 11/28/2023
  Time: 9:33 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<a href="/calculator">
    Back to the Calculator
</a>
<span>result:<c:out value='${requestScope["result"]}'/></span>


</body>

</html>
