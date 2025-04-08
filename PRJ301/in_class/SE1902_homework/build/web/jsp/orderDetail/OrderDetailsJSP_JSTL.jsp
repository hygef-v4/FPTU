<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Vector, models.OrderDetails" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>${pageTitle}</title>
</head>
<body>
    <form action="ServletOrderDetails_JSP" method="get">
        <p>Search order details by Order ID:
            <input type="number" name="orderID" value="${param.orderID}">
            <input type="submit" name="submit" value="search">
            <input type="reset" value="Reset">
            <input type="hidden" name="service" value="listOrderDetails">
        </p>
    </form>

    <p><a href="ServletOrderDetails_JSP?service=addOrderDetail">Insert new Order Detail</a></p>
    <table border="1">
        <caption>List of Order Details</caption>
        <tr>
            <th>Detail ID</th>
            <th>Price</th>
            <th>Quantity</th>
            <th>Order ID</th>
            <th>Product ID</th>
            <th>Update</th>
            <th>Delete</th>
        </tr>
        <c:forEach var="od" items="${data}">
            <tr>
                <td>${od.detailID}</td>
                <td>${od.price}</td>
                <td>${od.quantity}</td>
                <td>${od.orderID}</td>
                <td>${od.productID}</td>
                <td>
                    <a href="ServletOrderDetails_JSP?service=updateOrderDetail&detailID=${od.detailID}">Update</a>
                </td>
                <td>
                    <a href="ServletOrderDetails_JSP?service=deleteOrderDetail&detailID=${od.detailID}"
                       onclick="return confirm('Are you sure to delete?');">Delete</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
