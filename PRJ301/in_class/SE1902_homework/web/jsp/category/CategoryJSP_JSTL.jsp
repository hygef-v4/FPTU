<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Vector, models.Category" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>${pageTitle}</title>
    </head>
    <body>
        <form action="ServletCategory_JSP" method="get">
            <p>Search category by name:
                <input type="text" name="categoryName" value="${param.categoryName}">
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
            <c:forEach var="category" items="${data}">
                <tr>
                    <td>${category.categoryID}</td>
                    <td>${category.categoryName}</td>
                    <td>${category.describe}</td>
                    <td>${category.status}</td>
                    <td><a href="ServletCategory_JSP?service=updateCategory&categoryID=${category.categoryID}">update</a></td>
                    <td><a href="ServletCategory_JSP?service=deleteCategory&categoryID=${category.categoryID}" onclick="return confirm('Are you sure to delete?');">delete</a></td>
                </tr>
            </c:forEach>

        </table>
<p style="text-align: center">last category: ${lastCat.categoryName}</p>
<!--        <table border="1">
            <caption>Last Category</caption>
            <tr>
                <th>Category ID</th>
                <th>Category Name</th>
                <th>Description</th>
                <th>Status</th>
                
            </tr>

            <td>${lastCat.categoryID}</td>
            <td>${lastCat.categoryName}</td>
            <td>${lastCat.describe}</td>
            <td>${lastCat.status}</td>
        </table>-->

    </body>
</html>
