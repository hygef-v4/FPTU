<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insert Category</title>


        <c:if test="${not empty error}">
        <p style="color: red;">${error}</p>
    </c:if>


</head>
<body>
    <form action="ServletCategory_JSP" method="POST">
        <table>
            <tr>     
                <td>Category ID:</td>
                <td><input type="text" name="categoryID" required></td>
            </tr>
            <tr>
                <td>Category Name:</td>
                <td><input type="text" name="categoryName" required></td>
            </tr>
            <tr>
                <td>Description:</td>
                <td><textarea name="describe" rows="3" cols="30" required></textarea></td>
            </tr>
            <tr>
                <td>status</td>
                <td>
                    <input type="radio" name="status" value="1" checked>Active
                    <input type="radio" name="status" value="0">DeActive
                </td>
            </tr>
            <tr>
                <td>
                    <input type="submit" name="submit" value="Add Category">
                </td>
                <td>
                    <input type="reset" value="Reset">
                    <input type="hidden" name="service" value="addCategory">
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
