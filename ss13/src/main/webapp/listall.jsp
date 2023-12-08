<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 12/7/2023
  Time: 3:42 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
            crossorigin="anonymous"></script>
</head>
<body>
<h1 align="center">Đây là danh sách của User</h1>
<fieldset>
    <table class="table table-hower">
        <thead>
        <tr>
            <th>Name</th>
            <th align="center">Email</th>
            <th>Country</th>
            <th>Thêm</th>
            <th>Sửa</th>
            <th>Xóa</th>
        </tr>
        </thead>
        <c:forEach items='${requestScope["list"]}' var="s">
            <tr>
                <td>${s.getName()}</td>
                <td>${s.email}</td>
                <td>${s.country}</td>
                <td>
                    <button type="button" class="btn btn-danger" onclick="myAdd('${s.id}','${s.getName()}')"
                            data-bs-toggle="modal" data-bs-target="#exampleModal">
                        thêm
                    </button>
                </td>
                <td>
                    <button type="button" class="btn btn-danger" onclick="myFix('${s.id}','${s.name}')"
                            data-bs-toggle="modal" data-bs-target="#exampleModall">
                        sửa
                    </button>
                </td>
                <td>
                    <button type="button" class="btn btn-danger" onclick="myDelete('${s.id}','${s.name}')"
                            data-bs-toggle="modal" data-bs-target="#exampleModalll">
                        xóa
                    </button>
                </td>
            </tr>
        </c:forEach>


    </table>
</fieldset>
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">Modal title</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form action="/user_servlet">
                <div class="modal-body">
                    <input type="hidden" name="id" id="id"> Bạn có chắc muốn Thêm phần tử chứ <span id="name"></span>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                    <button type="submit" name="action" value="add" class="btn btn-primary">đồng ý</button>
                </div>
            </form>

        </div>
    </div>
</div>
<div class="modal fade" id="exampleModall" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabell">Modal title</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form action="/user_servlet">
                <div class="modal-body">
                    <input type="hidden" name="idFix" id="idFix"> Bạn có muốn sửa phần tử này chứ <span id="nameFix"></span>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                    <button type="submit" name="action" value="update" class="btn btn-primary">Đồng ý</button>
                </div>
            </form>
        </div>
    </div>
</div>
<div class="modal fade" id="exampleModalll" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabelll">Modal title</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form action="/user_servlet">
                <div class="modal-body">
                    <input type="hidden" id="idDelete" name="idDelete">Bạn có muốn xóa phần tử này chứ <span id="nameDelete"></span>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                    <button type="submit" name="action" value="delete" class="btn btn-primary">Đồng ý</button>
                </div>
            </form>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"></script>
<script>
    function myAdd(id, name) {
        document.getElementById("id").value = id;
        document.getElementById("name").innerText = name;
    }
</script>
<script>
    function myFix(id, name) {
        document.getElementById("idFix").value = id;
        document.getElementById("nameFix").innerText = name;
    }
</script>
<script>
    function myDelete(id ,name){
        document.getElementById("idDelete").value=id;
        document.getElementById("nameDelete").innerText=name;
    }
</script>


</body>

</html>
