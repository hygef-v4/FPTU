<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Vector, models.Products" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>${pageTitle}</title>
    </head>
    <body>
        <form action="ServletProduct_JSP" method="get">
            <%--            <P> Search by name: 
                <input type ="text" name ="productName" value ="${param.productName}">
            <c:set  var="productName" value="${requestScope.productName}" ></c:set>
            <c:if test="${productName == null}">
                <c:out value =" "></c:out>
            </c:if>
                <input type ="submit" name = "submit" value ="search">
                <input type ="reset" value ="Reset"> 
                <input type = "hidden" name ="service" value ="listProduct">
</p> --%>
            <p>Search product by name:
                <input type="text" name="productName" value="${empty param.productName ? '' : param.productName}">
                <input type="submit" name="submit" value="search">
                <input type="reset" value="Reset">
                <input type="hidden" name="service" value="listProduct">
            </p>
        </form>

        <p><a href="ServletProduct_JSP?service=addProduct">Insert new product</a></p>
        <table border="1">
            <caption>${tableTitle}</caption>

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
            </tr>
            <%-- <c:if test="${empty list}">
                <p>No products found.</p>
            </c:if>       --%>

            <c:forEach var="product" items="${data}">         
                <tr>
                    <td>${product.productID}</td>
                    <td>${product.productName}</td>
                    <td>${product.image}</td>
                    <td>${product.price}</td>
                    <td>${product.quantity}</td>
                    <td>${product.categoryID}</td>
                    <td>${product.importDate}</td>
                    <td>${product.usingDate}</td>                    
                    <td>${product.status} </td>
                    <td><a href="ServletProduct_JSP?service=updateProduct&productID=${product.productID}">update</a></td>
                    <td><a href="ServletProduct_JSP?service=deleteProduct&productID=${product.productID}" onclick="
                            return confirm('Are you sure to delete');">delete</a></td>
                </tr>
            </c:forEach>  
        </table>

    </body>
</html>
