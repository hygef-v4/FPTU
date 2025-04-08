<%-- 
    Document   : RoleJSP
    Created on : Feb 23, 2025, 7:41:17 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Vector, models.Roles" %>
<!DOCTYPE html>
<html>
    <%//Get data from servlet (controller)
        Vector<Roles> list = (Vector<Roles>)request.getAttribute("data");
        String pageTitle = (String)request.getAttribute("pageTitle");
        String tableTitle = (String)request.getAttribute("tableTitle");
        String roleName = request.getParameter("roleName");
        if(roleName == null) {
            roleName="";
        }
    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="ServletRole_JSP" method="get">
            <p>Search role by name:
                <input type="text" name="roleName" value="<%=roleName%>">
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
            <% for (Roles roles : list) {%>
            <tr>
                <td><%=roles.getRoleID()%></td>
                <td><%=roles.getRoleName()%></td>
                <td><%=roles.getStatus()%></td>
                <td><a href="ServletRole_JSP?service=updateRole&roleID=<%=roles.getRoleID()%>">Update</a></td>
                <td><a href="ServletRole_JSP?service=deleteRole&roleID=<%=roles.getRoleID()%>" onclick="return confirm('Are you sure to delete?');">Delete</a></td>
            </tr>
            <%}%>
        </table>
    </body>
</html>
