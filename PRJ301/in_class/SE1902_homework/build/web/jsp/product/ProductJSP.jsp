<%-- 
    Document   : ProductJSP
    Created on : Feb 14, 2025, 11:31:01 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Vector, models.Products" %>
<!DOCTYPE html>
<html>
    <%//get data from servlet (controller)
       Vector<Products> list = (Vector<Products>)request.getAttribute("data");
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
                <th>image</th>
                <th>price</th>
                <th>quantity</th>
                <th>categoryID</th>
                <th>importDate</th>
                <th>usingDate</th>
                <th>status</th>
                <th>update</th>
                <th>delete</th>
                <th>add to cart</th>
            </tr>
            <%for (Products products : list) {%>                
            <tr>
                <td><%=products.getProductID()%></td>
                <td><%=products.getProductName()%></td>
                <td><%=products.getPrice()%></td>
                <td><%=products.getImage()%></td>
                <td><%=products.getQuantity()%></td>
                <td><%=products.getCategoryID()%></td>
                <td><%=products.getImportDate()%></td>
                <td><%=products.getUsingDate()%></td>                    
                <td><%=products.getStatus()%></td>
                <td><a href="ServletProduct_JSP?service=updateProduct&productID=<%=products.getProductID()%>">update</a></td>
                <td><a href="ServletProduct_JSP?service=deleteProduct&productID=<%=products.getProductID()%>" onclick="
                    return confirm('Are you sure to delete');">delete</a></td>
                <td><a href="CartURL?service=add2Cart&productID=<%=products.getProductID()%>">add to cart</a></td>
            </tr>
            
            <%}%>
        </table>

    </body>
</html>
