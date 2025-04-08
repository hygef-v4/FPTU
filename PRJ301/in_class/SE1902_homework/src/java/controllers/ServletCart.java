/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers;

import dal.CartDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.Enumeration;
import java.util.Vector;
import models.Cart;

/**
 *
 * @author hungs
 */
@WebServlet(name = "ServletCart", urlPatterns = {"/CartURL"})
public class ServletCart extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession(true);
        String service = request.getParameter("service");
        CartDAO cartDAO = new CartDAO();
        Vector<Cart> vector = new Vector<>();
        if (service == null) {
            service = "showCart";
        }
        if (service.equals("showCart")) {
            Enumeration enu = session.getAttributeNames();  // lay key cua session map
            while (enu.hasMoreElements()) {
                String key = (String) enu.nextElement();
                session.getAttribute(key);
                Cart cart = (Cart) session.getAttribute(key);
                vector.add(cart);
            }
            request.setAttribute("data", vector);
            request.setAttribute("pageTitle", "Product Manager");
            request.setAttribute("tableTitle", "List of Product");

            //Select view
            request.getRequestDispatcher("jsp/showCart.jsp").forward(request, response);
        }
        if (service.equals("add2Cart")) {
            int pid = Integer.parseInt(request.getParameter("productID"));
            Cart cart = cartDAO.getCart(pid);
            if (session.getAttribute(pid + "") == null) {  // first time quantity = 1
                cart.setQuantity(1);
                session.setAttribute(pid + "", cart);
            }else{ // second time (quantity +=1) 
                Cart oldCart = (Cart) session.getAttribute(pid+"");
                oldCart.setQuantity(oldCart.getQuantity()+1);
            }
            response.sendRedirect("ServletProduct_JSP");
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
