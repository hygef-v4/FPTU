<%-- 
    Document   : InsertProduct
    Created on : Feb 19, 2025, 8:03:40 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Vector, models.Category" %>
<!DOCTYPE html>
<html>
    <% //get data from contrller
        Vector<Category> vector=(Vector<Category>)request.getAttribute("vector");
    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="ServletProduct_JSP" method="POST">
            <table>
                <tr>     
                    <td>productName</td>
                    <td><input type="text" name="productName"></td>
                </tr>
                <tr>
                    <td>image</td>
                    <td><input type="text" name="image"></td>
                </tr>
                <tr>
                    <td> price</td>
                    <td><input type="text" name="price"></td>
                </tr>
                <tr>
                    <td>quantity</td>
                    <td><input type="text" name="quantity"></td>
                </tr>
                <tr>
                    <td>categoryID</td>
                    <td>
                        <select name="categoryID">
                            <% for (Category c : vector) {%>
                            <option value="<%=c.getCategoryID()%>"><%=c.getCategoryName()%></option>
                            <%}%> 
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>importDate</td>
                    <td><input type="date" name="importDate"></td>
                </tr>
                <tr>
                    <td>usingDate</td>
                    <td><input type="date" name="usingDate"></td>
                </tr>
                <tr>
                    <td>status</td>
                    <td>
                        <input type="radio" name="status" value="1" checked>Active
                        <input type="radio" name="status" value="0">DeActive
                    </td>
                </tr>
                <tr>
                    <td><input type="submit" name="submit" value="Insert Product"></td>
                    <td><input type="reset" value="Reset">
                        <input type="hidden" name="service" value="addProduct"></td>
                </tr>
            </table>
        </form>
    </body>
</html>
