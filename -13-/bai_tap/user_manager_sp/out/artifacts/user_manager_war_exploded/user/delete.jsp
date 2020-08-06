<%--
  Created by IntelliJ IDEA.
  User: Minh Nguyen
  Date: 4/8/2020
  Time: 9:52 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Deleting User</title>
</head>
<body>
<h1>Delete customer</h1>
<p>
    <a href="/users">Back to customer list</a>
</p>
<form method="post">
    <h3>Are you sure?</h3>
    <fieldset>
        <legend>Customer information</legend>
        <table>
            <tr>
                <td>Name: </td>
                <td>${user.name}</td>
            </tr>
            <tr>
                <td>Email: </td>
                <td>${user.mail}</td>
            </tr>
            <tr>
                <td>Address: </td>
                <td>${user.country}</td>
            </tr>
            <tr>
                <td><input type="submit" value="Delete user"></td>
                <td><a href="/users">Back to user list</a></td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>
