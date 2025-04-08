
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Vector, models.Roles" %>
<!DOCTYPE html>
<html>
    <%
        Roles r = (Roles)request.getAttribute("r");
    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="ServletRole_JSP" method="POST">
            <table>
                <tbody>
                    <tr>
                        <td>Role ID</td>
                        <td><input type="text" name="roleID" value="<%=r.getRoleID()%>" readonly><br/></td>
                    </tr>
                    <tr>
                        <td>Role Name</td>
                        <td><input type="text" name="roleName" value="<%=r.getRoleName()%>"><br/></td>
                    </tr>
                    <tr>
                        <td>Status</td>
                        <td>
                            <input type="radio" name="status" value="1" <%=r.getStatus()==1?"checked":""%>>Active
                            <input type="radio" name="status" value="0" <%=r.getStatus()==0?"checked":""%>>DeActive
                        </td>
                    </tr>
                    <tr>
                        <td><input type="submit" name="submit" value="Update Role"></td>
                        <td><input type="reset" value="Cancel">
                            <input type="hidden" name="service" value="updateRole"> </td>
                    </tr>
                </tbody>
            </table>

        </form>
    </body>
</html>
