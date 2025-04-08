/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers;

import dal.CategoryDAO;
import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.annotation.WebInitParam;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;
import java.util.Vector;
import models.Category;
import models.Products;

/**
 *
 * @author Admin
 */
@WebServlet(name = "ServletProduct_JSP", urlPatterns = {"/ServletProduct_JSP"}, initParams = {
    @WebInitParam(name = "URL", value = "URLDemo"),
    @WebInitParam(name = "userName", value = "sa"),
    @WebInitParam(name = "pass", value = "123")})
public class ServletProduct_JSP extends HttpServlet {

    private static final String SQL = "SELECT * FROM [dbo].[tblProducts]";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        ProductDAO dao = new ProductDAO();
        CategoryDAO cateDao = new CategoryDAO();
        Vector<Category> vector = cateDao.getAllCategory("SELECT *  FROM tblCategories");

        String service = request.getParameter("service");
        if (service == null) {
            service = "listProduct";
        }
        if (service.equals("updateProduct")) {
            String submit = request.getParameter("submit");
            if (submit == null) { // show ra UpdateProduct.jsp
                int productID = Integer.parseInt(request.getParameter("productID"));
                Products p = dao.searchProduct(productID);

                request.setAttribute("p", p);
                request.setAttribute("vector", vector);
                request.getRequestDispatcher("jsp/product/UpdateProduct.jsp").forward(request, response);

            } else {
                int productID = Integer.parseInt(request.getParameter("productID"));

                String productName = request.getParameter("productName"),
                image = request.getParameter("image");
                double price = Double.parseDouble(request.getParameter("price"));
                int quantity = Integer.parseInt(request.getParameter("quantity"));
                String categoryID = request.getParameter("categoryID");
                Date importDate = Date.valueOf(request.getParameter("importDate")),
                usingDate = Date.valueOf(request.getParameter("usingDate"));
                int status = Integer.parseInt(request.getParameter("status"));
                Products p = new Products(productID, productName, image, price, quantity, categoryID, importDate, usingDate, status);

                dao.updateProduct(p);
                response.sendRedirect("ServletProduct_JSP");
            }
        }
        if (service.equals("deleteProduct")) {
            int pId = Integer.parseInt(request.getParameter("productID"));
            int n = dao.delelteProducts(pId);
            response.sendRedirect("ServletProduct_JSP");
        }
        if (service.equals("addProduct")) {
            String submit = request.getParameter("submit");
            if (submit == null) {//show form InsertProduct.jsp
                //Call Models

//Set data for view
                request.setAttribute("vector", vector);
                //select view
                request.getRequestDispatcher("jsp/product/InsertProduct.jsp").forward(request, response);
            } else {
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

                Vector<Products> list = dao.getAllProduct(SQL);
                request.setAttribute("data", list);
                request.setAttribute("pageTitle", "Product Manager");
                request.setAttribute("tableTitle", "List of Product");

                //Select view
                request.getRequestDispatcher("jsp/product/ProductJSP.jsp").forward(request, response);
//                response.sendRedirect("ServletProduct_JSP");
            }

        }
        if (service.equals("listProduct")) {
            String submit = request.getParameter("submit");
            String productName = request.getParameter("productName");
            //Call Models
            Vector<Products> list;
            if (submit == null) {
                list = dao.getAllProduct(SQL);
            } else {
                list = dao.getAllProduct("SELECT *\n"
                        + "FROM tblProducts\n"
                        + "WHERE productName like N'%" + productName + "%'");
            }

            //set data for view
            request.setAttribute("data", list);
            request.setAttribute("pageTitle", "Product Manager");
            request.setAttribute("tableTitle", "List of Product");

            //Select view
            request.getRequestDispatcher("jsp/product/ProductJSP.jsp").forward(request, response);

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
