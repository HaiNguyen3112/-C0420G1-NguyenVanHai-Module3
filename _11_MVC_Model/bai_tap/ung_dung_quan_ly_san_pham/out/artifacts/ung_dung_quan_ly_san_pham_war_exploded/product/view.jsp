<%--
  Created by IntelliJ IDEA.
  User: Minh Nguyen
  Date: 3/8/2020
  Time: 4:03 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>View Product</title>
</head>
<body>
<h1>Product details</h1>
<p>
    <a href="/product">Back to product list</a>
</p>
<table>
    <tr>
        <td>Name: </td>
        <td>${requestScope["product"].productName}</td>
    </tr>
    <tr>
        <td>Price: </td>
        <td>${requestScope["product"].productPrice}</td>
    </tr>
    <tr>
        <td>Describe: </td>
        <td>${requestScope["product"].productDescribe}</td>
    </tr>
    <tr>
        <td>Made by: </td>
        <td>${requestScope["product"].productBy}</td>
    </tr>
</table>
</body>
</html>
