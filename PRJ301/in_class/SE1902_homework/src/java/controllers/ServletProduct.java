/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers;

import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;
import java.util.Vector;
import models.Products;

/**
 *
 * @author Admin
 */
@WebServlet(name = "ServletProduct", urlPatterns = {"/ServletProductURL"})
public class ServletProduct extends HttpServlet {

    private static final String SQL = "SELECT * FROM [dbo].[tblProducts]";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        ProductDAO dao = new ProductDAO();
        String service = request.getParameter("service");
        if (service == null) {
            service = "listProduct";
        }
       
        if(service.equals("deleteProduct")){
            int pId = Integer.parseInt(request.getParameter("pId"));
            int n = dao.delelteProducts(pId);
            response.sendRedirect("ServletProductURL");
        }
        if (service.equals("addProduct")) {
            String productName = request.getParameter("productName"),
                    image = request.getParameter("image");
            double price = Double.parseDouble(request.getParameter("price"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            String categoryID = request.getParameter("categoryID");
            Date importDate = Date.valueOf(request.getParameter("importDate")),
                    usingDate = Date.valueOf(request.getParameter("usingDate"));
            int status = Integer.parseInt(request.getParameter("status"));
            Products p = new Products(productName, image, price, quantity, categoryID, importDate, usingDate, status);

            dao.insertProduct(p);
            response.sendRedirect("ServletProductURL");
        }
        if (service.equals("listProduct")) {

            try (PrintWriter out = response.getWriter()) {
                /* TODO output your page here. You may use following sample code. */
                out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("<head>");
                out.println("<title>Servlet ServletProduct</title>");
                out.println("</head>");
                out.println("<body>");
                out.print("<form action=\"ServletProductURL\" method=\"get\">\n"
                        + "            <p>Search by name:\n"
                        + "                <input type=\"text\" name=\"productName\">\n"
                        + "                <input type=\"submit\" name=\"submit\" value=\"search\">\n"
                        + "                <input type=\"reset\" value=\"Reset\">\n"
                        + "                <input type=\"hidden\" name=\"service\" value=\"listProduct\">\n"
                        + "            </p>\n"
                        + "        </form>");
                
                out.print(" <p><a href=\"addProduct.html\">add Product</a></p>");
                out.println("<table border='1'>");
                out.println("<tr>");
                out.println("<th>productID</th>");
                out.println("<th>productName</th>");
                out.println("<th>image</th>");
                out.println("<th>price</th>");
                out.println("<th>quantity</th>");
                out.println("<th>categoryID</th>");
                out.println("<th>importDate</th>");
                out.println("<th>usingDate</th>");
                out.println("<th>status</th>");
                out.println("<th>Update</th>");
                out.println("<th>Delete</th>");
                out.println("</tr>");
                String submit = request.getParameter("submit");
                String productName=request.getParameter("productName");
                Vector<Products> list;
                if (submit == null) {
                    list = dao.getAllProduct(SQL);
                } else {
                    list = dao.getAllProduct("SELECT *\n"
                            + "FROM tblProducts\n"
                            + "WHERE productName like '%"+productName+"%'");
                }

                for (Products products : list) {
                    out.print("<tr>\n"
                            + "                    <td>" + products.getProductID() + "</td>\n"
                            + "                    <td>" + products.getProductName() + "</td>\n"
                            + "                    <td>" + products.getImage() + "</td>\n"
                            + "                    <td>" + products.getPrice() + "</td>\n"
                            + "                    <td>" + products.getQuantity() + "</td>\n"
                            + "                    <td>" + products.getCategoryID() + "</td>\n"
                            + "                    <td>" + products.getImportDate() + "</td>\n"
                            + "                    <td>" + products.getUsingDate() + "</td>\n"
                            + "                    <td>" + products.getStatus() + "</td>\n"
                            + "                    <td><a href=\"ServletProductURL?service=updateProduct&pId=" + products.getProductID() + "\">update</a></td>\n"
                            + "                    <td><a href=\"ServletProductURL?service=deleteProduct&pId=" + products.getProductID() + "\">delete</a></td>\n"
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
