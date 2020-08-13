<%--
  Created by IntelliJ IDEA.
  User: Minh Nguyen
  Date: 12/8/2020
  Time: 1:49 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create</title>
</head>
<body>
<a href="/furama?action=customer">Back</a>
<form method="post">
    <h3>
        Thêm mới Khách hàng!!!
    </h3>
    <table>
        <tr>
            <td>STT</td>
            <td><input type="text" name="id"></td>
        </tr>
        <tr>
            <td>Hạng khách: </td>
            <td><input type="text" name="typeId"></td>
        </tr>
        <tr>
            <td>Họ tên: </td>
            <td><input type="text" name="name"></td>
        </tr>
        <tr>
            <td>Ngày sinh (YYYY-MM-DD): </td>
            <td><input type="text" name="birthday"></td>
        </tr>
        <tr>
            <td>Giới tính: </td>
            <td><input type="text" name="gender"></td>
        </tr>
        <tr>
            <td>CMND: </td>
            <td><input type="text" name="idCard"></td>
        </tr>
        <tr>
            <td>Số điện thoại: </td>
            <td><input type="text" name="phone"></td>
        </tr>
        <tr>
            <td>Email: </td>
            <td><input type="text" name="email"></td>
        </tr>
        <tr>
            <td>Địa chỉ: </td>
            <td><input type="text" name="address"></td>
        </tr>
        <tr>
            <td align="center" colspan="2">
                <a href="/furama?action=create"><input type="button" value="Xoá"></a>
                <input type="submit" name="submit" value="Lưu">
            </td>
        </tr>
    </table>
</form>
</body>
</html>
