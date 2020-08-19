<%--
  Created by IntelliJ IDEA.
  User: Minh Nguyen
  Date: 17/8/2020
  Time: 3:22 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Edit Product</title>
</head>
<body>
<div>
    <center>
        <h1>Product Management</h1>
        <h2>
            <a href="/product?action=product">List All Product</a>
        </h2>
    </center>
    <div align="center">
        <form method="post">
            <table border="1" cellpadding="5">
                <caption>
                    <h2>
                        Edit Product
                    </h2>
                </caption>
                <c:if test="${product != null}">
                    <input type="hidden" name="id" value="<c:out value='${product.id}' />"/>
                </c:if>
                <tr>
                    <th>Tên sản phẩm:</th>
                    <td>
                        <input type="text" name="name" size="45"
                               value="<c:out value='${product.name}' />"
                        />
                    </td>
                </tr>
                <tr>
                    <th>Giá:</th>
                    <td>
                        <input type="text" name="price" size="45"
                               value="<c:out value='${product.price}' />"
                        />
                    </td>
                </tr>
                <tr>
                    <th>Số lượng:</th>
                    <td>
                        <input type="text" name="quantity" size="15"
                               value="<c:out value='${product.quantity}' />"
                        />
                    </td>
                </tr>
                <tr>
                    <th>Màu sắc:</th>
                    <td>
                        <input type="text" name="color" size="15"
                               value="<c:out value='${product.color}' />"
                        />
                    </td>
                </tr>
                <tr>
                    <th>Mô tả:</th>
                    <td>
                        <input type="text" name="descriptions" size="15"
                               value="<c:out value='${product.descriptions}' />"
                        />
                    </td>
                </tr>
                <tr>
                    <th>Danh mục:</th>
                    <td>
                        <input type="text" name="category" size="15"
                               value="<c:out value='${product.category}' />"
                        />
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" value="Save"/>
                    </td>
                </tr>
            </table>
        </form>
    </div>
</div>
</body>
</html>
