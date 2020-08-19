<%--
  Created by IntelliJ IDEA.
  User: Minh Nguyen
  Date: 17/8/2020
  Time: 2:25 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Products List</title>
</head>
<body>
<h3>
    <a href="/product?action=createproduct" style="color: dimgray"><input type="button" value="Add New Product"></a>
</h3>

<div>
    <h2>Danh sách Sản Phẩm!</h2>
    <table border="1", cellpadding="5">
        <tr>
            <form action="/product?action=findproduct" method="post">
                <td>
                    <input name="nameFind" placeholder="Name here">
                </td>
                <td>
                    <input type="submit" name="submit" value="Search">
                </td>
            </form>
        </tr>
    </table>
    <table border="1", cellpadding="5">
        <tr>
            <th>#</th>
            <th>Product Name</th>
            <th>Price</th>
            <th>Quantity</th>
            <th>Color</th>
            <th>Descriptions</th>
            <th>Category</th>
            <th>Action</th>

        </tr>
        <c:forEach var="product" items="${listProduct}">
            <tr>
                <td>  <c:out value="${product.id}"/> </td>
                <td>  <c:out value="${product.name}"/> </td>
                <td>  <c:out value="${product.price}"/> </td>
                <td>  <c:out value="${product.quantity}"/> </td>
                <td>  <c:out value="${product.color}"/> </td>
                <td>  <c:out value="${product.descriptions}"/> </td>
                <td>  <c:out value="${product.category}"/> </td>
                <td>
                    <a href="/product?action=editproduct&id=${product.id}">Edit</a>
                    <a href="/product?action=deleteproduct&id=${product.id}">Delete</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>
