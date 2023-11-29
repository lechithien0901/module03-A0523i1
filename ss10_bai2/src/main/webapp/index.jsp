<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<h1><%= "Hello World!" %>
</h1>
<br/>
<h1>Simple Calculator</h1>
<form method="post">
    <fieldset>
        <legend>Calculator:</legend>
        <table>
            <tr>
                <td>First operand:</td>
                <td>
                    <input type="text" name="sothunhat" id="sothunhat">
                </td>
            </tr>
            <tr>
                <td>Operator:</td>
                <td><select name="operation" id="operation">
                    <option value="add">Add</option>
                    <option value="subtract">Subtract</option>
                    <option value="multiply">Multiply</option>
                    <option value="divide">Divide</option>

                </select></td>

            </tr>
            <tr>
                <td>Second operand:</td>
                <td><input type="text" name="sothu2" id="sothu2"></td>
            </tr>
            <tr>
                <td><input type="submit" value="Caculator"></td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>