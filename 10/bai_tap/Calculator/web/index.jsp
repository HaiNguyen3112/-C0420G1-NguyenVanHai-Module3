<%--
  Created by IntelliJ IDEA.
  User: Minh Nguyen
  Date: 6/8/2020
  Time: 3:21 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Simple Calculator</title>
  </head>
  <body>
<h1>Calculator</h1>
  <form method="post", action="/calculator">
    <table>
      <tr>
        <td>First operand: </td>
        <td><input name="first-operand", type="text"></td>
      </tr>

      <tr>
        <td>Operator: </td>
        <td>
          <select name="operator">
            <option value="+">Add</option>
            <option value="-">Sub</option>
            <option value="*">Multi</option>
            <option value="/">Div</option>
          </select>
        </td>
      </tr>

      <tr>
        <td>Second operand: </td>
        <td><input name="second-operand", type="text"></td>
      </tr>

      <tr>
        <td></td>
        <td><input type="submit" value="Calculator"></td>
      </tr>

    </table>

  </form>

  </body>
</html>
