/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers;

import dal.OrderDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;
import java.util.Vector;
import models.Orders;
import models.Users;

@WebServlet(name = "ServletOrder", urlPatterns = {"/ServletOrderURL"})
public class ServletOrder extends HttpServlet {

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
            int oId = Integer.parseInt(request.getParameter("oId"));
            int n = dao.deleteOrder(oId);
            response.sendRedirect("ServletOrderURL");
        }
        if (service.equals("addOrder")) {
            Date orderDate = Date.valueOf(request.getParameter("orderDate"));
            double total = Double.parseDouble(request.getParameter("total"));
            String userID = request.getParameter("userID");
            int status = Integer.parseInt(request.getParameter("status"));
            Orders o = new Orders(orderDate, total, userID, status);

            dao.insertOrder(o);
            response.sendRedirect("ServletOrderURL");
        }
        if (service.equals("listOrder")) {
            try (PrintWriter out = response.getWriter()) {
                /* TODO output your page here. You may use following sample code. */
                out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("<head>");
                out.println("<title>Servlet ServletOrder</title>");
                out.println("</head>");
                out.println("<body>");
                out.println("<form action=\"ServletOrderURL\" method=\"get\">\n"
                        + "            <p>Search by User ID:\n"
                        + "                <input type=\"text\" name=\"userID\">\n"
                        + "                <input type=\"submit\" name=\"submit\" value=\"Search\">\n"
                        + "                <input type=\"reset\" value=\"Reset\">\n"
                        + "                <input type=\"hidden\" name=\"service\" value=\"listOrder\">\n"
                        + "        </form>");
                out.print(" <p><a href=\"addOrder.html\">Add new Order</a></p>");

                out.println("<table border='1'>");
                out.println("<thead>");
                out.println("<tr>");
                out.println("<th>orderID</th>");
                out.println("<th>orderDate</th>");
                out.println("<th>total</th>");
                out.println("<th>userID</th>");
                out.println("<th>status</th>");
                out.println("<th>Update</th>");
                out.println("<th>Delete</th>");
                out.println("</tr>");
                out.println("</thead>");
                String submit = request.getParameter("submit");
                String userID = request.getParameter("userID");
                Vector<Orders> list;
                if (submit == null) {
                    list = dao.getAllOrder(SQL);
                } else {
                    list = dao.getAllOrder("SELECT *\n"
                            + "FROM [dbo].[tblOrders]\n"
                            + "WHERE userID like '%" + userID + "%'");
                }

                for (Orders orders : list) {
                    out.println("<tr>\n"
                            + "                    <td>" + orders.getOrderID() + "</td>\n"
                            + "                    <td>" + orders.getOrderDate() + "</td>\n"
                            + "                    <td>" + orders.getTotal() + "</td>\n"
                            + "                    <td>" + orders.getUserID() + "</td>\n"
                            + "                    <td>" + orders.getStatus() + "</td>\n"
                            + "                    <td><a href=\"ServletOrderURL?service=updateOrder&oId=" + orders.getOrderID() + "\">Update</a></td>\n"
                            + "                    <td><a href=\"ServletOrderURL?service=deleteOrder&oId=" + orders.getOrderID() + "\">Delete</a></td>\n"
                            + "                </tr>");
                }
                out.println("</table>");
                out.println("</body>");
                out.println("</html>");
            }
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
