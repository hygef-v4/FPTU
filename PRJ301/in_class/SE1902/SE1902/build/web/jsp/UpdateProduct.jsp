<%-- 
    Document   : UpdateProduct
    Created on : Feb 21, 2025, 10:36:25 AM
    Author     : hungs
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Vector, models.Category, models.Products" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
    <%--
    <% //get data from contrller
    Vector<Category> vector=(Vector<Category>)request.getAttribute("vector");
    Products p = (Products)request.getAttribute("p");
    %>
    --%>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="ServletProduct_JSP" method="POST">
            <table>
                <tr>     

                    <td>productID</td>
                    <td><input type="text" name="productID" value="${p.productID}" readonly></td>
                </tr>
                <tr>     
                    <td>productName</td>
                    <td><input type="text" name="productName" value="${p.productName}"> </td>
                </tr>
                <tr>
                    <td>image</td>
                    <td><input type="text" name="image" value="${p.image}"></td>
                </tr>
                <tr>
                    <td> price</td>
                    <td><input type="text" name="price" value="${p.price}"></td>
                </tr>
                <tr>
                    <td>quantity</td>
                    <td><input type="text" name="quantity" value="${p.quantity}"></td>
                </tr>
                <tr>
                    <td>categoryID</td>
                    <td>
                        <select name="categoryID" >
                            <c:forEach var="c" items="${vector}">
                                <option value="${c.categoryID}"
                                        ${c.categoryID eq p.categoryID ? 'selected' : ''}>
                                    ${c.categoryName}
                                </option>

                            </c:forEach>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>importDate </td>
                    <td><input type="date" name="importDate" value="${p.importDate}"></td>
                </tr>
                <tr>
                    <td>usingDate</td>
                    <td><input type="date" name="usingDate" value="${p.usingDate}"></td>
                </tr>
                <tr>
                    <td>status</td>
                    <td>
                        <input type="radio" name="status" value="1" ${p.status == 1 ? 'checked' : ''}  >Active
                        <input type="radio" name="status" value="0" ${p.status == 0 ? 'checked' : ''} >DeActive
                    </td>
                </tr>
                <tr>
                    <td><input type="submit" name="submit" value="Update Product"></td>
                    <td><input type="reset" value="Cancel">
                        <input type="hidden" name="service" value="updateProduct"></td>
                </tr>
            </table>
        </form>
    </body>
</html>
