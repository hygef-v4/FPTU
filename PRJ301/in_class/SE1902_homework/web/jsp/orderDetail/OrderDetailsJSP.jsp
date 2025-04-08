<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Vector, models.OrderDetails" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title><%= request.getAttribute("pageTitle") %></title>
</head>
<body>
    <form action="ServletOrderDetails_JSP" method="get">
        <p>Search order details by Order ID:
            <input type="number" name="orderID" value="<%= request.getParameter("orderID") != null ? request.getParameter("orderID") : "" %>">
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
        <%
            Vector<OrderDetails> data = (Vector<OrderDetails>) request.getAttribute("data");
            if (data != null) {
                for (OrderDetails od : data) {
        %>
        <tr>
            <td><%= od.getDetailID() %></td>
            <td><%= od.getPrice() %></td>
            <td><%= od.getQuantity() %></td>
            <td><%= od.getOrderID() %></td>
            <td><%= od.getProductID() %></td>
            <td>
                <a href="ServletOrderDetails_JSP?service=updateOrderDetail&detailID=<%= od.getDetailID() %>">Update</a>
            </td>
            <td>
                <a href="ServletOrderDetails_JSP?service=deleteOrderDetail&detailID=<%= od.getDetailID() %>"
                   onclick="return confirm('Are you sure to delete?');">Delete</a>
            </td>
        </tr>
        <%
                }
            }
        %>
    </table>
</body>
</html>
