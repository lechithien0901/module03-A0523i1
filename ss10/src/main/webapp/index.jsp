<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
    <style>
        table{
            border-collapse: collapse;
        }
        table{
            height: 100px;
            width: 100px;
        }
        .chinhsua{
            height: 2px;
            width: 1px;
        }
        .suadoi{
            height: 100px;
            width: 100px;
        }
    </style>
</head>
<body>


    <table border="1px" class="suadoi">
        <h1>Danh sách khách hàng</h1>
        <thread>
            <tr>
                <th>Tên</th>
                <th>Ngày Sinh</th>
                <th>Địa Chỉ</th>
                <th>Ảnh</th>
            </tr>
        </thread>
        <tbody>
        <c:forEach items='${requestScope["list"]}' var="s" varStatus="count">
            <tr>
                <td><c:out value="${s.name}"/></td>
                <td><c:out value="${s.date}"/></td>
                <td><c:out value="${s.address}"/></td>

            </tr>
        </c:forEach>
        </tbody>


    </table>

</body>
</html>