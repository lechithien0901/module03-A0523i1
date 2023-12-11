<%@ taglib prefix="for" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
</head>
<body>
<a role="button" class="btn btn-outline-primary mb-5" href="?action=create">Add new product</a>
<table class="table talbe-hower">
    <tr>
        <th>STT</th>
        <th>Name</th>
        <th>Category</th>
        <th>Delete</th>
        <th>Update</th>

    </tr>
    <c:forEach items="${list}" var="s">
        <tr>
            <td>${s.id}</td>
            <td>${s.name}</td>
            <td>${s.category.name}</td>
            <td>
                <button type="button" class="btn btn-primary" onclick="myDelete('${s.id}','${s.name}')" data-bs-toggle="modal" data-bs-target="#exampleModal">
                    Delete
                </button>
            </td>
            <td><button type="button" class="btn btn-primary" onclick="myUpdate('${s.id}','${s.name}','${s.category.id}')" data-bs-toggle="modal" data-bs-target="#exampleModall">
                Update
            </button></td>


        </tr>
    </c:forEach>


</table>




<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">Modal title</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form action="/servlet">
                <div class="modal-body">
                    <input type="hidden" id="id" name="id">Bạn có chắc muốn xóa chứ<span id="name"></span>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                    <button type="submit" name="action" value="delete" class="btn btn-primary">Đồng ý</button>
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
            <form action="/servlet">
                <div class="modal-body">
                    <input type="hidden" id="idUpdate" name="idUpdate"> bạn có chắc muốn sửa chứ <span id="nameUpdate"></span>
                    <input type="hidden" id="idCate" name="idCate">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                    <button type="submit" name="action" value="update" class="btn btn-primary">Đồng ý</button>
                </div>
            </form>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"></script>
<script>
  function  myDelete(id,name ) {
        document.getElementById("id").value=id;
        document.getElementById("name").innerText=name;
    }
</script>
<script>
    function  myUpdate(id,name, cateId){
        document.getElementById("idUpdate").value=id;
        document.getElementById("nameUpdate").innerText=name;
        document.getElementById("idCate").innerText=cateId;
    }
</script>

</body>
</html>