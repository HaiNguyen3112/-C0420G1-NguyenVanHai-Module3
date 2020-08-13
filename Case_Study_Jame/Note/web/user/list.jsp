
<%--
  Created by IntelliJ IDEA.
  User: Minh Nguyen
  Date: 10/8/2020
  Time: 9:26 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>List Note</title>
</head>
<body>

<h3>
    <a href="/notes?action=create">Add New Note</a>
</h3>

    <div>


    <h2>Các Ghi Chú!</h2>
    <table border="1", cellpadding="5">
        <tr>
            <td>
            <select name="select">
                <option>
                    aaa
                </option>
                <option>
                    bbb
                </option>
            </select>
            </td>
            <td>
                <input name="titleFind" placeholder="Tiêu đề">
            </td>
            <td>
                <input type="submit" name="submit" value="Tìm">
            </td>
        </tr>
    </table>
    <table border="1", cellpadding="5">
        <tr>
            <th>STT</th>
            <th>Tiêu đề</th>
            <th>Nội dung</th>
            <th>Phân loại</th>
        </tr>
        <c:forEach var="note" items="${listNote}">
            <tr>
                <td>  <c:out value="${note.id}"/> </td>
                <td>  <c:out value="${note.title}"/> </td>
                <td>  <c:out value="${note.content}"/> </td>
                <td>  <c:out value="${note.typeId}"/> </td>
                <td>
                    <a href="/notes?action=edit&id=${note.id}">Edit</a>
                    <a href="/notes?action=delete&id=${note.id}">Delete</a>
                </td>
            </tr>
        </c:forEach>
    </table>
    </div>
</body>
</html>
