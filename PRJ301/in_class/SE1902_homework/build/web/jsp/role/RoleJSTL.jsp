
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Vector, models.Roles" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>${pageTitle}</title>
    </head>
    <body>
        <form action="ServletRole_JSP" method="get">
            <p>Search role by name:
                <input type="text" name="roleName" value="${roleName}">
                <input type="submit" name="submit" value="Search">
                <input type="reset" value="Reset">
                <input type="hidden" name="service" value="listRole">
        </form>
        <p> <a href="ServletRole_JSP?service=addRole">Insert new role</a> </p>
        <table border="1">
            <caption>List of Roles</caption>
            <tr>
                <th>roleID</th>
                <th>roleName</th>
                <th>status</th>
                <th>Update</th>
                <th>Delete</th>
            </tr>
            <c:forEach var="role" items="${data}">
            <tr>
                <td>${role.roleID}</td>
                <td>${role.roleName}</td>
                <td>${role.status}</td>
                <td><a href="ServletRole_JSP?service=updateRole&roleID=${role.roleID}">Update</a></td>
                <td><a href="ServletRole_JSP?service=deleteRole&roleID=${role.roleID}" onclick="return confirm('Are you sure to delete?');">Delete</a></td>
            </tr>
            </c:forEach>
        </table>
    </body>
</html>
