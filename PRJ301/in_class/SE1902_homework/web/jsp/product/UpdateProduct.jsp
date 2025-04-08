<%-- 
    Document   : UpdateProduct
    Created on : Feb 21, 2025, 10:36:25 AM
    Author     : hungs
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Vector, models.Category, models.Products" %>

<!DOCTYPE html>
<html>
    <% //get data from contrller
    Vector<Category> vector=(Vector<Category>)request.getAttribute("vector");
    Products p = (Products)request.getAttribute("p");
    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="ServletProduct_JSP" method="POST">
            <table>
                <tr>     

                    <td>productID</td>
                    <td><input type="text" name="productID" value="<%=p.getProductID()%>" readonly></td>
                </tr>
                <tr>     
                    <td>productName</td>
                    <td><input type="text" name="productName" value="<%=p.getProductName()%>"></td>
                </tr>
                <tr>
                    <td>image</td>
                    <td><input type="text" name="image" value="<%=p.getImage()%>"></td>
                </tr>
                <tr>
                    <td> price</td>
                    <td><input type="text" name="price" value="<%=p.getPrice()%>"></td>
                </tr>
                <tr>
                    <td>quantity</td>
                    <td><input type="text" name="quantity" value="<%=p.getQuantity()%>"></td>
                </tr>
                <tr>
                    <td>categoryID</td>
                    <td>
                        <select name="categoryID" >
                            <% for (Category c : vector) {%>
                            <option value="<%=c.getCategoryID()%>"<%=c.getCategoryID().equals(p.getCategoryID())?"selected":""%>><%=c.getCategoryName()%></option>
                            <%}%> 
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>importDate </td>
                    <td><input type="date" name="importDate" value="<%=p.getImportDate()%>"></td>
                </tr>
                <tr>
                    <td>usingDate</td>
                    <td><input type="date" name="usingDate" value="<%=p.getUsingDate()%>"></td>
                </tr>
                <tr>
                    <td>status</td>
                    <td>
                        <input type="radio" name="status" value="1" <%=p.getStatus()==1?"checked" :""%>>Active
                        <input type="radio" name="status" value="0" <%=p.getStatus()==0?"checked" :""%>>DeActive
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
