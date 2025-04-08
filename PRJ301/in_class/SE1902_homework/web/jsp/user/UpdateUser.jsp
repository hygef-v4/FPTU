<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Vector, models.Users , models.Roles" %>
<!DOCTYPE html>
<html>
    <%
        Vector<Users> list = (Vector<Users>)request.getAttribute("data");
        Vector<Roles> vector = (Vector<Roles>)request.getAttribute("vector");
        Users u = (Users)request.getAttribute("u");
    %>
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
                        <td><input type="text" name="userID" value="<%=u.getUserID()%>" readonly><br/></td>
                    </tr>
                    <tr>
                        <td>Fullname</td>
                        <td><input type="text" name="fullName" value="<%=u.getFullName()%>"><br/></td>
                    </tr>
                    <tr>
                        <td>Password</td>
                        <td><input type="password" name="password" value="<%=u.getPassword()%>"><br/></td>
                    </tr>
                    <tr>
                        <td>Role ID</td>
                        <td>
                            <select name="roleID">
                                <%for (Roles r : vector) {%>
                                <option value="<%=r.getRoleID()%>" <%=r.getRoleID() == u.getRoleID()?"selected":""%>><%=r.getRoleName()%></option>
                                <%}%>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>Address</td>
                        <td><input type="text" name="address" value="<%=u.getAddress()%>"><br/></td>
                    </tr>
                    <tr>
                        <td>Phone</td>
                        <td><input type="text" name="phone" value="<%=u.getPhone()%>"><br/></td>
                    </tr>
                    <tr>
                        <td>Email</td>
                        <td><input type="email" name="email" value="<%=u.getEmail()%>"><br/></td>
                    </tr>
                    <tr>
                        <td>Activate</td>
                        <td>
                            <input type="radio" name="activate" value="true" <%=u.isActivate() == true?"checked":""%>>Active
                            <input type="radio" name="activate" value="false" <%=u.isActivate() == false?"checked":""%>>DeActive
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
