<%-- 
    Document   : ProductJSP
    Created on : Feb 14, 2025, 11:31:01 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Vector, models.Cart, models.Products" %>
<!DOCTYPE html>
<html>
    <%//get data from servlet (controller)
       Vector<Cart> list = (Vector<Cart>)request.getAttribute("data");
       String pageTitle = (String)request.getAttribute("pageTitle");
       String tableTitle = (String)request.getAttribute("tableTitle");
       String productName = request.getParameter("productName");
       if(productName==null){
        productName="";
        }
    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%=pageTitle%></title>
    </head>
    <body>
        <form action="ServletProduct_JSP" method="get">
            <p>Search product by name:
                <input type="text" name="productName" value="<%=productName%>">
                <input type="submit" name="submit" value="search">
                <input type="reset" value="Reset">
                <input type="hidden" name="service" value="listProduct">
            </p>
        </form>

        <p><a href="ServletProduct_JSP?service=addProduct">Insert new product</a></p>
        <p align="right"><a href="CartURL?service=showCart">Show cart</a></p>
        <table border="1">
            <caption>List of Product</caption>

            <tr>
                <th>productID</th>
                <th>productName</th>
                <th>price</th>
                <th>quantity</th>
                <th>subTotal</th>

            </tr>
            <%for (Cart cart : list) {%>                
            <tr>
                <td><%=cart.getProductID()%></td>
                <td><%=cart.getProductName()%></td>
                <td><%=cart.getPrice()%></td>              
                <td><%=cart.getQuantity()%></td>
            </tr>

            <%}%>
        </table>

    </body>
</html>
