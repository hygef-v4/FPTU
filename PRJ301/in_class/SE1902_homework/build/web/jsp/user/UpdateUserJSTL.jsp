
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update User</title>
    </head>
    <body>
        <form action="ServletUser_JSP" method="POST">
            <table>
                <tbody>
                    <tr>
                        <td>User ID</td>
                        <td><input type="text" name="userID" value="${u.userID}" readonly><br/></td>
                    </tr>
                    <tr>
                        <td>Fullname</td>
                        <td><input type="text" name="fullName" value="${u.fullName}"><br/></td>
                    </tr>
                    <tr>
                        <td>Password</td>
                        <td><input type="password" name="password" value="${u.password}"><br/></td>
                    </tr>
                    <tr>
                        <td>Role ID</td>
                        <td>
                            <select name="roleID">
                                <c:forEach var="role" items="${vector}">
                                <option value="${role.roleID}" ${role.roleID == u.roleID ?"selected":""}>${role.roleName}</option>
                                </c:forEach>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>Address</td>
                        <td><input type="text" name="address" value="${u.address}"><br/></td>
                    </tr>
                    <tr>
                        <td>Phone</td>
                        <td><input type="text" name="phone" value="${u.phone}"><br/></td>
                    </tr>
                    <tr>
                        <td>Email</td>
                        <td><input type="email" name="email" value="${u.email}"><br/></td>
                    </tr>
                    <tr>
                        <td>Activate</td>
                        <td>
                            <input type="radio" name="activate" value="true" ${u.activate == true ? "checked":""}>Active
                            <input type="radio" name="activate" value="false" ${u.activate == false ? "checked":""}>DeActive
                        </td>
                    </tr>
                    <tr>
                        <td><input type="submit" name="submit" value="Update User"></td>
                        <td><input type="reset" value="Reset">
                            <input type="hidden" name="service" value="updateUser"> </td>
                    </tr>
                </tbody>
            </table>

        </form>
    </body>
</html>
