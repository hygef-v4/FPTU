<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Vector, models.Category" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title><%= request.getAttribute("pageTitle") %></title>
</head>
<body>
    <form action="ServletCategory_JSP" method="get">
        <p>Search category by name:
            <input type="text" name="categoryName" value="<%= request.getParameter("categoryName") != null ? request.getParameter("categoryName") : "" %>">
            <input type="submit" name="submit" value="search">
            <input type="reset" value="Reset" />
            <input type="hidden" name="service" value="listCategory">
        </p>
    </form>

    <p><a href="ServletCategory_JSP?service=addCategory">Insert new category</a></p>
    <table border="1">
        <caption>List of Categories</caption>
        <tr>
            <th>Category ID</th>
            <th>Category Name</th>
            <th>Description</th>
            <th>Status</th>
            <th>Update</th>
            <th>Delete</th>
        </tr>
        <%
            Vector<Category> categories = (Vector<Category>) request.getAttribute("data");
            if (categories != null) {
                for (Category category : categories) {
        %>
        <tr>
            <td><%= category.getCategoryID() %></td>
            <td><%= category.getCategoryName() %></td>
            <td><%= category.getDescribe() %></td>
            <td><%= category.getStatus() %></td>
            <td><a href="ServletCategory_JSP?service=updateCategory&categoryID=<%= category.getCategoryID() %>">update</a></td>
            <td><a href="ServletCategory_JSP?service=deleteCategory&categoryID=<%= category.getCategoryID() %>" onclick="return confirm('Are you sure to delete?');">delete</a></td>
        </tr>
        <%
                }
            }
        %>
    </table>
</body>
</html>
