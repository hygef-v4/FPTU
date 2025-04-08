
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Vector, models.Orders" %>
<!DOCTYPE html>
<html>
    <%//Get data from servlet (controller)
        Vector<Orders> list = (Vector<Orders>)request.getAttribute("data");
        String pageTitle = (String)request.getAttribute("pageTitle");
        String tableTitle = (String)request.getAttribute("tableTitle");
        String userID = request.getParameter("userID");
        if(userID == null) {
            userID="";
        }
    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%=pageTitle%></title>
    </head>
    <body>
        <form action="ServletOrder_JSP" method="get">
            <p>Search Order by User ID: 
                <input type="text" name="userID" value="<%=userID%>">
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
            <% for (Orders orders : list) {%>
            <tr>
                <td><%=orders.getOrderID()%></td>
                <td><%=orders.getOrderDate()%></td>
                <td><%=orders.getTotal()%></td>
                <td><%=orders.getUserID()%></td>
                <td><%=orders.getStatus()%></td>
                <td><a href="ServletOrder_JSP?service=updateOrder&orderID=<%=orders.getOrderID()%>">Update</a></td>
                <td><a href="ServletOrder_JSP?service=deleteOrder&orderID=<%=orders.getOrderID()%>" onclick="return confirm('Are you sure to delete?');">Delete</a></td>
            </tr>
            <%}%>
        </table>
    </body>
</html>
