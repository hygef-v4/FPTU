<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Vector, models.Users" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>${pageTitle}</title>
    </head>
    <body>
        <form action="ServletUser_JSP" method="get">
            <p>Search by User Name: 
                <input type="text" name="fullName" value="${fullName}">
                <input type="submit" name="submit" value="Search">
                <input type="reset" value="Reset">
                <input type="hidden" name="service" value="listUser">
        </form>
        <p> <a href="ServletUser_JSP?service=addUser">Insert new User</a> </p>
        <table border="1">
            <caption>List of Users</caption>
            <tr>
                <th>userID</th>
                <th>fullName</th>
                <th>password</th>
                <th>roleID</th>
                <th>address</th>
                <th>phone</th>
                <th>email</th>
                <th>activate</th>
                <th>Update</th>
                <th>Delete</th>
            </tr>
            <c:forEach var="user" items="${data}">
            <tr>
                <td>${user.userID}</td>
                <td>${user.fullName}</td>
                <td>${user.password}</td>
                <td>${user.roleID}</td>
                <td>${user.address}</td>
                <td>${user.phone}</td>
                <td>${user.email}</td>
                <td>${user.activate}</td>
                <td><a href="ServletUser_JSP?service=updateUser&userID=${user.userID}">Update</a></td>
                <td><a href="ServletUser_JSP?service=deleteUser&userID=${user.userID}" onclick="return confirm('Are you sure to delete?');">Delete</a></td>
            </tr>
            </c:forEach>
        </table>
    </body>
</html>
