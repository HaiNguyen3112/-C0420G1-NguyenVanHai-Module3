<%--
  Created by IntelliJ IDEA.
  User: Minh Nguyen
  Date: 17/8/2020
  Time: 3:05 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add New Product</title>
</head>
<body>
<div><a href="/product?action=product">Back</a>
    <form method="post">
        <h3>
            Thêm mới Sản Phẩm!!!
        </h3>
        <table>
            <tr>
                <td>STT</td>
                <td><input type="text" name="id"></td>
            </tr>
            <tr>
                <td>Tên sản phẩm: </td>
                <td><input type="text" name="name"></td>
            </tr>
            <tr>
                <td>Giá: </td>
                <td><input type="text" name="price"></td>
            </tr>
            <tr>
                <td>Số lượng: </td>
                <td><input type="text" name="quantity"></td>
            </tr>
            <tr>
                <td>Màu sắc: </td>
                <td><input type="text" name="color"></td>
            </tr>
            <tr>
                <td>Mô tả: </td>
                <td><input type="text" name="descriptions"></td>
            </tr>
            <tr>
                <td>Danh mục: </td>
                <td>
                    <select  name="category" >
                        <option value="Computer">Computer</option>
                        <option value="Phone">Phone</option>
                        <option value="Television">Television</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td align="center" colspan="2">
                    <a href="/product?action=create"><input type="button" value="Delete"></a>
                    <input type="submit" name="submit" value="Save">
                </td>
            </tr>
        </table>
    </form>

</div>
</body>
</html>
