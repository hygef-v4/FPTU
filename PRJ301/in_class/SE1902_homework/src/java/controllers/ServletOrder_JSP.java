/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers;

import dal.OrderDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.annotation.WebInitParam;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;
import java.util.Vector;
import models.Orders;

@WebServlet(name = "ServletOrder_JSP", urlPatterns = {"/ServletOrder_JSP"}, initParams = {
    @WebInitParam(name = "URL", value = "URLDemo"),
    @WebInitParam(name = "userName", value = "sa"),
    @WebInitParam(name = "pass", value = "123")})
public class ServletOrder_JSP extends HttpServlet {

    private static final String SQL = "SELECT * FROM [dbo].[tblOrders]";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        OrderDAO dao = new OrderDAO();

        String service = request.getParameter("service");
        if (service == null) {
            service = "listOrder";
        }

        if (service.equals("deleteOrder")) {
            int orderID = Integer.parseInt(request.getParameter("orderID"));
            int n = dao.deleteOrder(orderID);
            response.sendRedirect("ServletOrder_JSP");
        }

        if (service.equals("updateOrder")) {
            String submit = request.getParameter("submit");
            if (submit == null) {//show UpdateOrder.jsp
                int orderID = Integer.parseInt(request.getParameter("orderID"));
                Orders o = dao.searchOrder(orderID);

                request.setAttribute("o", o);
                request.getRequestDispatcher("jsp/order/UpdateOrder.jsp").forward(request, response);
            } else {
                int orderID = Integer.parseInt(request.getParameter("orderID"));
                Date orderDate = Date.valueOf(request.getParameter("orderDate"));
                double total = Double.parseDouble(request.getParameter("total"));
                String userID = request.getParameter("userID");
                int status = Integer.parseInt(request.getParameter("status"));
                Orders o = new Orders(orderID, orderDate, total, userID, status);

                dao.updateOrder(o);
                response.sendRedirect("ServletOrder_JSP");
            }
        }

        if (service.equals("addOrder")) {
            String submit = request.getParameter("submit");
            if (submit == null) {//show form InsertProduct.jsp
                //select view 
                request.getRequestDispatcher("jsp/order/InsertOrder.jsp").forward(request, response);
            } else {
                Date orderDate = Date.valueOf(request.getParameter("orderDate"));
                double total = Double.parseDouble(request.getParameter("total"));
                String userID = request.getParameter("userID");
                int status = Integer.parseInt(request.getParameter("status"));
                Orders o = new Orders(orderDate, total, userID, status);

                dao.insertOrder(o);
                Vector<Orders> list = dao.getAllOrder(SQL);
                request.setAttribute("data", list);
                request.setAttribute("pageTitle", "Product Manager");
                request.setAttribute("tableTitle", "List of Products");

                request.getRequestDispatcher("jsp/order/OrderJSP.jsp").forward(request, response);

//                response.sendRedirect("ServletProduct_JSP");
            }
        }
        if (service.equals("listOrder")) {
            String submit = request.getParameter("submit");
            String userID = request.getParameter("userID");
            Vector<Orders> list;
            if (submit == null) {
                list = dao.getAllOrder(SQL);
            } else {
                list = dao.getAllOrder("SELECT *\n"
                        + "FROM [dbo].[tblOrders]\n"
                        + "WHERE userID like N'%" + userID + "%'");
            }

            //set data for view
            request.setAttribute("data", list);
            request.setAttribute("pageTitle", "Orders Manager");
            request.setAttribute("tableTitle", "List of Orders");

            //Select view
            request.getRequestDispatcher("jsp/order/OrderJSP.jsp").forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
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
