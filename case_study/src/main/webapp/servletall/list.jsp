<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <style>
        .head {
            border: 1px solid black;
            width: 100%;
            height: 100px;
        }
        .headlink {
            border: 1px solid black;
            width: 100%;
            height: 50px;
            display: flex;
            justify-content: space-around;
            align-items: center;
        }
        .headleft {
            height: 400px;
            width: 15%;
            border: 1px solid black;
        }
        .body{
            height: 400px;
            width: 85%;
            border: 1px solid black;
        }
        .container {
            display: flex;
            align-items: center;
        }
        .end{
            height: 75px;
            width: 100%;
            border: 1px solid black;
        }
    </style>
    <title>Title</title>
</head>
<body>

<div class="head"></div>
<div class="headlink">
    <a href="/servletall">Home</a>
    <a href="/employee">Employee</a>
    <a href="/customer">Customer</a>
    <a href="">Service</a>
    <a href="">Contract</a>
</div>
<div class="container">
    <div class="headleft"></div>
    <div class="body"></div>
</div>
<div class="end"></div>


</body>
</html>