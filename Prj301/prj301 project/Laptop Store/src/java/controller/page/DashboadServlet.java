/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.page;

import dal.implement.OrderDAO;
import dal.implement.OrderDetailDAO;
import dal.implement.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import java.util.Vector;
import model.Order;
import model.OrderDetails;
import model.User;

/**
 *
 * @author hungs
 */
public class DashboadServlet extends HttpServlet {

    ProductDAO productDAO = new ProductDAO();
    private static final String ORDER_LIST_SQL = "SELECT * FROM tblOrders WHERE userID = ?";
    // Declare DAO for orders and order details
    OrderDAO orderDAO = new OrderDAO();
    OrderDetailDAO orderDetailsDAO = new OrderDetailDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        // Check if user is logged in
        if (user == null) {
            response.sendRedirect("authen"); // Redirect to login if not authenticated
            return;
        }

        int userId = user.getUserID(); // Get user ID from session

        // Fetch list of orders for the user
        List<Order> orderListUser = orderDAO.getOrdersByUserId(userId);

        // Populate order details for each order
        for (Order order : orderListUser) {
            Vector<OrderDetails> orderDetails = orderDetailsDAO.getOrderDetailsByOrderId(order.getOrderID());
            order.setListOrderDetails(orderDetails); // Set order details
        }

        // Set attributes for JSP
        request.setAttribute("productDAO", productDAO);
        request.setAttribute("orderListUser", orderListUser);

        // Forward to account page
        request.getRequestDispatcher("view/page/account.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
