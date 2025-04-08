
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Vector, models.Orders" %>
<!DOCTYPE html>
<html>
    <%
        Orders o = (Orders)request.getAttribute("o");
    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="ServletOrder_JSP" method="POST">
            <table>
                <tbody>
                    <tr>
                        <td>Order ID</td>
                        <td><input type="text" name="orderID" value="<%=o.getOrderID()%>" readonly><br/></td>
                    </tr>
                    <tr>
                        <td>Order Date</td>
                        <td><input type="date" name="orderDate" value="<%=o.getOrderDate()%>"><br/></td>
                    </tr>
                    <tr>
                        <td>Total</td>
                        <td><input type="text" name="total" value="<%=o.getTotal()%>"><br/></td>
                    </tr>
                    <tr>
                        <td>User ID</td>
                        <td><input type="text" name="userID" value="<%=o.getUserID()%>"><br/></td>
                    </tr>
                    <tr>
                        <td>Status</td>
                        <td>
                            <input type="radio" name="status" value="1" <%=o.getStatus()==1?"checked":""%>>Active
                            <input type="radio" name="status" value="0" <%=o.getStatus()==0?"checked":""%>>DeActive
                        </td>
                    </tr>
                    <tr>
                        <td><input type="submit" name="submit" value="Update Order"></td>
                        <td><input type="reset" value="Cancel">
                            <input type="hidden" name="service" value="updateOrder"> </td>
                    </tr>
                </tbody>
            </table>

        </form>
    </body>
</html>
