<%-- 
    Document   : InsertOrder
    Created on : Feb 24, 2025, 6:52:41 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="ServletOrder_JSP" method="POST">
            <table>
                <tbody>
                    <tr>
                        <td>Order Date</td>
                        <td><input type="date" name="orderDate"><br/></td>
                    </tr>
                    <tr>
                        <td>Total</td>
                        <td><input type="text" name="total"><br/></td>
                    </tr>
                    <tr>
                        <td>User ID</td>
                        <td><input type="text" name="userID"><br/></td>
                    </tr>
                    <tr>
                        <td>Status</td>
                        <td>
                            <input type="radio" name="status" value="1" checked>Active
                            <input type="radio" name="status" value="0">DeActive
                        </td>
                    </tr>
                    <tr>
                        <td><input type="submit" name="submit" value="Add Order"></td>
                        <td><input type="reset" value="Reset">
                            <input type="hidden" name="service" value="addOrder"> </td>
                    </tr>
                </tbody>
            </table>

        </form>
    </body>
</html>
