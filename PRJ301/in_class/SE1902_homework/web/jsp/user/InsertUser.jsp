<%-- 
    Document   : InsertUser
    Created on : Feb 26, 2025, 12:45:41 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Vector, models.Roles" %>
<!DOCTYPE html>
<html>
    <%-- <%
        Vector<Roles> vector = (Vector<Roles>)request.getAttribute("vector");
        String errorMessage = (String) request.getAttribute("errorMessage");
    %>
    <% if (errorMessage != null) { %>
<!--    <script>alert("<%= errorMessage %>");</script>-->
    <p style="color: red;"><%= error %></p>
    <% } %> --%>
    <%
    Vector<Roles> vector = (Vector<Roles>) request.getAttribute("vector");
    String errorMessage = (String) request.getAttribute("errorMessage");
    %>
    <% if (errorMessage != null) { %>
        <!-- <script>alert("<%= errorMessage %>");</script> -->
    <p style="color: red;"><%= errorMessage %></p>
    <% } %>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="ServletUser_JSP" method="POST">
            <table>
                <tbody>
                    <tr>
                        <td>User ID</td>
                        <td><input type="text" name="userID" required="" ><br/></td>
                    </tr>
                    <tr>
                        <td>Full Name</td>
                        <td><input type="text" name="fullName" required=""><br/></td>
                    </tr>
                    <tr>
                        <td>Password</td>
                        <td><input type="password" name="password" required=""><br/></td>
                    </tr>
                    <tr>
                        <td>Role ID</td>
                        <td>
                            <select name="roleID">
                                <%for (Roles r : vector) {%>
                                <option value="<%=r.getRoleID()%>"><%=r.getRoleName()%></option>
                                <%}%>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>Address</td>
                        <td><input type="text" name="address"><br/></td>
                    </tr>
                    <tr>
                        <td>Phone</td>
                        <td><input type="text" name="phone"><br/></td>
                    </tr>
                    <tr>
                        <td>Email</td>
                        <td><input type="email" name="email"><br/></td>
                    </tr>
                    <tr>
                        <td>Activate</td>
                        <td>
                            <input type="radio" name="activate" value="true" checked>Active
                            <input type="radio" name="activate" value="false">DeActive
                        </td>
                    </tr>
                    <tr>
                        <td><input type="submit" name="submit" value="Add User"></td>
                        <td><input type="reset" value="Reset">
                            <input type="hidden" name="service" value="addUser"> </td>
                    </tr>
                </tbody>
            </table>

        </form>
    </body>
</html>
