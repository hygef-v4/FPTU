<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Vector, models.Roles" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="ServletRole_JSP" method="POST">
            <table>
                <tbody>
                    <tr>
                        <td>Role Name</td>
                        <td><input type="text" name="roleName" required=""><br/></td>
                    </tr>
                    <tr>
                        <td>Status</td>
                        <td>
                            <input type="radio" name="status" value="1" checked>Active
                            <input type="radio" name="status" value="0">DeActive
                        </td>
                    </tr>
                    <tr>
                        <td><input type="submit" name="submit" value="Add Role"></td>
                        <td><input type="reset" value="Reset">
                            <input type="hidden" name="service" value="addRole"> </td>
                    </tr>
                </tbody>
            </table>

        </form>
    </body>
</html>
