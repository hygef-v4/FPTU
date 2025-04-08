
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Vector, models.Orders" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>${pageTitle}</title>
    </head>
    <body>
        <form action="ServletOrder_JSP" method="get">
            <p>Search Order by User ID: 
                <input type="text" name="userID" value="${userID}">
                <input type="submit" name="submit" value="Search">
                <input type="reset" value="Reset">
                <input type="hidden" name="service" value="listOrder">
        </form>
        <p> <a href="ServletOrder_JSP?service=addOrder">Insert new Order</a> </p>
        <table border="1">
            <caption>List of Orders</caption>
            <tr>
                <th>orderID</th>
                <th>orderDate</th>
                <th>total</th>
                <th>userID</th>
                <th>status</th>
                <th>Update</th>
                <th>Delete</th>
            </tr>
            <c:forEach var="orders" items="${data}">
            <tr>
                <td>${orders.orderID}</td>
                <td>${orders.orderDate}</td>
                <td>${orders.total}</td>
                <td>${orders.userID}</td>
                <td>${orders.status}</td>
                <td><a href="ServletOrder_JSP?service=updateOrder&orderID=${orders.orderID}">Update</a></td>
                <td><a href="ServletOrder_JSP?service=deleteOrder&orderID=${orders.orderID}" onclick="return confirm('Are you sure to delete?');">Delete</a></td>
            </tr>
            </c:forEach>
        </table>
    </body>
</html>
