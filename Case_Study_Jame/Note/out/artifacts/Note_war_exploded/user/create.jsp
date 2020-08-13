<%--
  Created by IntelliJ IDEA.
  User: Minh Nguyen
  Date: 10/8/2020
  Time: 9:10 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create new Note</title>
</head>
<body>
    <a href="/notes"> List Note</a>
    <form method="post">
        <h3>
            Thêm mới ghi chú!
        </h3>
        <table>
            <tr>
                <td>STT</td>
                <td><input type="text" name="id"></td>
            </tr>
            <tr>
                <td>Tiêu đề: </td>
                <td><input type="text" name="title"></td>
            </tr>
            <tr>
                <td>Nội dung: </td>
                <td><input type="text" name="content"></td>
            </tr>
            <tr>
                <td>Phân loại</td>
                <td><input type="text" name="typeId"></td>
            </tr>
            <tr>
                <td align="center" colspan="2">
                    <a href="/notes?action=create"><input type="button" value="Xoá"></a>
                    <input type="submit" name="submit" value="Lưu">
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
