

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Vector, models.Users" %>
<!DOCTYPE html>
<html>
    <%//Get data from servlet (controller)
        Vector<Users> list = (Vector<Users>)request.getAttribute("data");
        String pageTitle = (String)request.getAttribute("pageTitle");
        String tableTitle = (String)request.getAttribute("tableTitle");
        String fullName = request.getParameter("fullName");
        if(fullName == null) {
            fullName = "";
        }
    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%=pageTitle%></title>
    </head>
    <body>
        <form action="ServletUser_JSP" method="get">
            <p>Search by User Name: 
                <input type="text" name="fullName" value="<%=fullName%>">
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
            <% for (Users users : list) {%>
            <tr>
                <td><%=users.getUserID()%></td>
                <td><%=users.getFullName()%></td>
                <td><%=users.getPassword()%></td>
                <td><%=users.getRoleID()%></td>
                <td><%=users.getAddress()%></td>
                <td><%=users.getPhone()%></td>
                <td><%=users.getEmail()%></td>
                <td><%=users.isActivate()%></td>
                <td><a href="ServletUser_JSP?service=updateUser&userID=<%=users.getUserID()%>">Update</a></td>
                <td><a href="ServletUser_JSP?service=deleteUser&userID=<%=users.getUserID()%>" onclick="return confirm('Are you sure to delete?');">Delete</a></td>
            </tr>
            <%}%>
        </table>
    </body>
</html>
