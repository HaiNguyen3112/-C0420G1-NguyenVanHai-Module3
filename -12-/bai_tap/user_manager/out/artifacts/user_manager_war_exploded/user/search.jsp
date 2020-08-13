<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Minh Nguyen
  Date: 7/8/2020
  Time: 1:44 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User Management</title>
</head>
<body>

<form>
    <h1>Search</h1>
    <h3>
        <a href="/users">List All Users</a>
    </h3>
    <table border="1">
        <tr>
            <td>
                <input type="text" name="country"/>
            </td>
            <td ><input type="submit" value="Search"></td>
        </tr>
    </table>
</form>
</body>
</html>
