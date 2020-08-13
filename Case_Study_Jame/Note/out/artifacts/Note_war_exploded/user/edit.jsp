<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Minh Nguyen
  Date: 11/8/2020
  Time: 11:34 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit</title>
</head>
<body>
<center>
    <h1>Note Management</h1>
    <h2>
        <a href="notes?action=notes">List All Note</a>
    </h2>
</center>
<div align="center">
    <form method="post">
        <table border="1" cellpadding="5">
            <caption>
                <h2>
                    Edit Note
                </h2>
            </caption>
            <c:if test="${note != null}">
                <input type="hidden" name="id" value="<c:out value='${note.id}' />"/>
            </c:if>
            <tr>
                <th>Tiêu đề:</th>
                <td>
                    <input type="text" name="title" size="45"
                           value="<c:out value='${note.title}' />"
                    />
                </td>
            </tr>
            <tr>
                <th>Nội dung:</th>
                <td>
                    <input type="text" name="content" size="45"
                           value="<c:out value='${note.content}' />"
                    />
                </td>
            </tr>
            <tr>
                <th>Phân loại:</th>
                <td>
                    <input type="text" name="typeId" size="15"
                           value="<c:out value='${note.typeId}' />"
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
</body>
</html>
