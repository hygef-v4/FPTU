<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="models.Category" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Category</title>
    </head>
    <body>
        <form action="ServletCategory_JSP" method="POST">
            <table>
                <tr>
                    <td>Category ID</td>
                    <td><input type="text" name="categoryID" value="${c.categoryID}" readonly></td>
                </tr>
                <tr>
                    <td>Category Name</td>
                    <td><input type="text" name="categoryName" value="${c.categoryName}"></td>
                </tr>
                <tr>
                    <td>Description</td>
                    <td><textarea name="describe">${c.describe}</textarea></td>
                </tr>
                <tr>
                    <td>Status</td>
                    <td>
                        <input type="radio" name="status" value="1" ${c.status == 1 ? "checked" : ""}>Active
                        <input type="radio" name="status" value="0" ${c.status == 1 ? "checked" : ""}>DeActive
                    </td>
                </tr>
                <tr>
                    <td><input type="submit" name="submit" value="Update Category"></td>
                    <td><input type="reset" value="Cancel">
                        <input type="hidden" name="service" value="updateCategory"></td>
                </tr>
            </table>
        </form>
    </body>
</html>
