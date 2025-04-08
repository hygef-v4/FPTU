<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="models.OrderDetails" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Update Order Detail</title>
</head>
<body>
    <h2>Update Order Detail</h2>
    <%
        OrderDetails orderDetail = (OrderDetails) request.getAttribute("orderDetail");
        if (orderDetail != null) {
    %>
    <form action="ServletOrderDetails_JSP" method="POST">
        <table>
            <tr>
                <td>Detail ID:</td>
                <td><input type="number" name="detailID" value="<%= orderDetail.getDetailID() %>" readonly></td>
            </tr>
            <tr>
                <td>Price:</td>
                <td><input type="number" step="0.01" name="price" value="<%= orderDetail.getPrice() %>" required></td>
            </tr>
            <tr>
                <td>Quantity:</td>
                <td><input type="number" name="quantity" value="<%= orderDetail.getQuantity() %>" required></td>
            </tr>
            <tr>
                <td>Order ID:</td>
                <td><input type="number" name="orderID" value="<%= orderDetail.getOrderID() %>" readonly></td>
            </tr>
            <tr>
                <td>Product ID:</td>
                <td><input type="number" name="productID" value="<%= orderDetail.getProductID() %>" readonly></td>
            </tr>
            <tr>
                <td>
                    <input type="submit" name="submit" value="Update Order Detail">
                </td>
                <td>
                    <input type="reset" value="Cancel">
                    <input type="hidden" name="service" value="updateOrderDetail">
                </td>
            </tr>
        </table>
    </form>
    <%
        } else {
    %>
    <p>Order detail not found.</p>
    <%
        }
    %>
</body>
</html>
