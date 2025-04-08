package controllers;

import dal.OrderDetailsDAO;
import models.OrderDetails;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Vector;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "ServletOrderDetails", urlPatterns = {"/ServletOrderDetailsURL"})
public class ServletOrderDetails extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        OrderDetailsDAO dao = new OrderDetailsDAO();
        String service = request.getParameter("service");
        if (service == null) {
            service = "listOrderDetails";
        }

        // 1. ADD ORDER DETAIL (from addOrderDetail.html)
        if (service.equals("addOrderDetail")) {
            double price = Double.parseDouble(request.getParameter("price"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            int orderID = Integer.parseInt(request.getParameter("orderID"));
            int productID = Integer.parseInt(request.getParameter("productID"));

            // Create the OrderDetails object without setting detailID (it will be auto-generated)
            OrderDetails od = new OrderDetails(0, price, quantity, orderID, productID);
            dao.insertOrderDetail(od);

            response.sendRedirect("ServletOrderDetailsURL");
        }

        // 2. DELETE ORDER DETAIL
        if (service.equals("deleteOrderDetail")) {
            int detailID = Integer.parseInt(request.getParameter("detailID"));
            dao.deleteOrderDetail(detailID);
            response.sendRedirect("ServletOrderDetailsURL");
        }

        // 3. UPDATE ORDER DETAIL (Only price & quantity)
        if (service.equals("updateOrderDetail")) {
            String submit = request.getParameter("submit");
            if (submit == null) {
                // Show an HTML form to update only price & quantity
                int detailID = Integer.parseInt(request.getParameter("detailID"));
                OrderDetails od = dao.searchOrderDetail(detailID);

                try (PrintWriter out = response.getWriter()) {
                    out.println("<!DOCTYPE html>");
                    out.println("<html>");
                    out.println("<head>");
                    out.println("<title>Update Order Detail</title>");
                    out.println("</head>");
                    out.println("<body>");
                    out.println("<h2>Update Order Detail (Detail ID: " + detailID + ")</h2>");
                    out.println("<form action='ServletOrderDetailsURL' method='POST'>");
                    out.println("<table>");
                    out.println("<tr><td>Detail ID:</td><td>"
                            + "<input type='number' name='detailID' value='" + od.getDetailID() + "' readonly></td></tr>");
                    out.println("<tr><td>Price:</td><td>"
                            + "<input type='number' step='0.01' name='price' value='" + od.getPrice() + "' required></td></tr>");
                    out.println("<tr><td>Quantity:</td><td>"
                            + "<input type='number' name='quantity' value='" + od.getQuantity() + "' required></td></tr>");
                    out.println("</table>");
                    out.println("<input type='hidden' name='service' value='updateOrderDetail'>");
                    out.println("<input type='submit' name='submit' value='Update'>");
                    out.println("</form>");
                    out.println("</body>");
                    out.println("</html>");
                }
            } else {
                // Update the record in the DB
                int detailID = Integer.parseInt(request.getParameter("detailID"));
                double price = Double.parseDouble(request.getParameter("price"));
                int quantity = Integer.parseInt(request.getParameter("quantity"));

                // Keep the same orderID & productID as the old record
                OrderDetails oldOD = dao.searchOrderDetail(detailID);
                int orderID = oldOD.getOrderID();
                int productID = oldOD.getProductID();

                OrderDetails od = new OrderDetails(detailID, price, quantity, orderID, productID);
                dao.updateOrderDetail(od);

                response.sendRedirect("ServletOrderDetailsURL");
            }
        }

        // 4. LIST ORDER DETAILS (also includes search by orderID)
        if (service.equals("listOrderDetails")) {
            try (PrintWriter out = response.getWriter()) {
                // Get search param
                String orderIDParam = request.getParameter("orderID");
                Vector<OrderDetails> list;
                if (orderIDParam == null || orderIDParam.trim().isEmpty()) {
                    list = dao.getAllOrderDetails();
                } else {
                    list = dao.searchOrderDetailsByOrderID(Integer.parseInt(orderIDParam));
                }

                out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("<head>");
                out.println("<title>Order Details List</title>");
                out.println("</head>");
                out.println("<body>");
                out.println("<h1>Order Details List</h1>");

                // Search Form
                out.print("<form action='ServletOrderDetailsURL' method='GET'>\n"
                        + "    <p>Search by Order ID:\n"
                        + "        <input type='number' name='orderID'>\n"
                        + "        <input type='submit' value='Search'>\n"
                        + "        <input type='hidden' name='service' value='listOrderDetails'>\n"
                        + "    </p>\n"
                        + "</form>");

                out.print("<p><a href='addOrderDetail.html'>Add Order Detail</a></p>");

                // Table
                out.println("<table border='1'>");
                out.println("<tr>");
                out.println("<th>Detail ID</th>");
                out.println("<th>Price</th>");
                out.println("<th>Quantity</th>");
                out.println("<th>Order ID</th>");
                out.println("<th>Product ID</th>");
                out.println("<th>Update</th>");
                out.println("<th>Delete</th>");
                out.println("</tr>");

                for (OrderDetails od : list) {
                    out.println("<tr>");
                    out.println("<td>" + od.getDetailID() + "</td>");
                    out.println("<td>" + od.getPrice() + "</td>");
                    out.println("<td>" + od.getQuantity() + "</td>");
                    out.println("<td>" + od.getOrderID() + "</td>");
                    out.println("<td>" + od.getProductID() + "</td>");

                    // Update Link
                    out.println("<td><a href='ServletOrderDetailsURL?service=updateOrderDetail&detailID="
                            + od.getDetailID() + "'>Update</a></td>");

                    // Delete Link
                    out.println("<td><a href='ServletOrderDetailsURL?service=deleteOrderDetail&detailID="
                            + od.getDetailID() + "' onclick='return confirm(\"Are you sure?\");'>Delete</a></td>");

                    out.println("</tr>");
                }
                out.println("</table>");

                out.println("</body>");
                out.println("</html>");
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}
