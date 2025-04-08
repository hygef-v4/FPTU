package controllers;

import dal.CategoryDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.annotation.WebInitParam;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.Vector;
import models.Category;

@WebServlet(name = "ServletCategory_JSP", urlPatterns = {"/ServletCategory_JSP"}, initParams = {
    @WebInitParam(name = "URL", value = "URLDemo"),
    @WebInitParam(name = "userName", value = "sa"),
    @WebInitParam(name = "pass", value = "123")})
public class ServletCategory_JSP extends HttpServlet {

    private static final String SQL = "SELECT * FROM [dbo].[tblCategories]";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        CategoryDAO cateDao = new CategoryDAO();
        Vector<Category> vector = cateDao.getAllCategory(SQL);

        String service = request.getParameter("service");
        if (service == null) {
            service = "listCategory";
        }

        if (service.equals("updateCategory")) {
            String submit = request.getParameter("submit");
            if (submit == null) { // Show update form
                String categoryID = request.getParameter("categoryID");
                Category c = cateDao.searchCategory(categoryID);

                request.setAttribute("c", c);
                request.getRequestDispatcher("jsp/category/UpdateCategory_JSTL.jsp").forward(request, response);

            } else {
                String categoryID = request.getParameter("categoryID");
                String categoryName = request.getParameter("categoryName");
                String describe = request.getParameter("describe");
                int status = Integer.parseInt(request.getParameter("status"));
                Category c = new Category(categoryID, categoryName, describe, status);
                cateDao.updateCategory(c);
                response.sendRedirect("ServletCategory_JSP");
            }
        }

        if (service.equals("deleteCategory")) {
            String categoryID = request.getParameter("categoryID");
            cateDao.deleteCategory(categoryID);
            response.sendRedirect("ServletCategory_JSP");
        }

        if (service.equals("addCategory")) {
            String submit = request.getParameter("submit");
            if (submit == null) { // Show form InsertCategory_JSTL.jsp
                request.getRequestDispatcher("jsp/category/InsertCategory_JSTL.jsp").forward(request, response);
            } else {
                String categoryID = request.getParameter("categoryID");
                String categoryName = request.getParameter("categoryName");
                String describe = request.getParameter("describe");
                int status = Integer.parseInt(request.getParameter("status"));

                // Check if categoryID already exists
                Category existingCategory = cateDao.searchCategory(categoryID);
                if (existingCategory != null) {
                    // Category already exists, send error message
                    request.setAttribute("error", "Category ID already exists. Please choose a different ID.");
                    request.getRequestDispatcher("jsp/category/InsertCategory_JSTL.jsp").forward(request, response);
                } else {
                    // Insert new category
                    Category c = new Category(categoryID, categoryName, describe, status);
                    cateDao.insertCategory(c);
                    response.sendRedirect("ServletCategory_JSP");
                }
                
            }
        }

            if (service.equals("listCategory")) {
                String submit = request.getParameter("submit");
                String categoryName = request.getParameter("categoryName");
                //Call Models
                Vector<Category> list;
                if (submit == null) {
                    list = cateDao.getAllCategory(SQL);
                } else {
                    list = cateDao.getAllCategory("SELECT *\n"
                            + "FROM [tblCategories]\n"
                            + "WHERE categoryName like N'%" + categoryName + "%'");
                }

                //set data for view
                request.setAttribute("data", list);
                request.setAttribute("pageTitle", "Product Manager");
                request.setAttribute("tableTitle", "List of Product");
               Category lastCat = new Category(); 
                for(int i = 0; i < list.size(); i++){
                    if(i == list.size() - 1){
                        lastCat = list.get(i);
                        break; 
                    }
                }
                request.setAttribute("lastCat", lastCat);
                request.getRequestDispatcher("jsp/category/CategoryJSP_JSTL.jsp").forward(request, response);
            }
        }

        @Override
        protected void doGet
        (HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            processRequest(request, response);
        }

        @Override
        protected void doPost
        (HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            processRequest(request, response);
        }
    }
