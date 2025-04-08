<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert Order Detail</title>
</head>
<body>
    <h2>Insert New Order Detail</h2>
    <form action="ServletOrderDetails_JSP" method="POST">
        <table>
            <tr>
                <td>Price:</td>
                <td><input type="number" step="0.01" name="price" required></td>
            </tr>
            <tr>
                <td>Quantity:</td>
                <td><input type="number" name="quantity" required></td>
            </tr>
            <tr>
                <td>Order ID:</td>
                <td><input type="number" name="orderID" required></td>
            </tr>
            <tr>
                <td>Product ID:</td>
                <td><input type="number" name="productID" required></td>
            </tr>
            <tr>
                <td>
                    <input type="submit" name="submit" value="Add Order Detail">
                </td>
                <td>
                    <input type="reset" value="Reset">
                    <input type="hidden" name="service" value="addOrderDetail">
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
