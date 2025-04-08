/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers;

import dal.RoleDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.annotation.WebInitParam;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.Vector;
import models.Roles;

@WebServlet(name = "ServletRole_JSP", urlPatterns = {"/ServletRole_JSP"}, initParams = {
    @WebInitParam(name = "URL", value = "URLDemo"),
    @WebInitParam(name = "userName", value = "sa"),
    @WebInitParam(name = "pass", value = "123")})
public class ServletRole_JSP extends HttpServlet {

    private static final String SQL = "SELECT * FROM [dbo].[tblRoles]";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        RoleDAO dao = new RoleDAO();

        String service = request.getParameter("service");
        if (service == null) {
            service = "listRole";
        }

        if (service.equals("deleteRole")) {
            int roleID = Integer.parseInt(request.getParameter("roleID"));
            int n = dao.deleteRole(roleID);
            response.sendRedirect("ServletRole_JSP");
        }

        if (service.equals("updateRole")) {
            String submit = request.getParameter("submit");
            if (submit == null) {//show UpdateProduct.jsp
                int roleID = Integer.parseInt(request.getParameter("roleID"));
                Roles r = dao.searchRole(roleID);

                request.setAttribute("r", r);
                request.getRequestDispatcher("jsp/role/UpdateRole.jsp").forward(request, response);
            } else {
                int roleID = Integer.parseInt(request.getParameter("roleID"));
                String roleName = request.getParameter("roleName");
                int status = Integer.parseInt(request.getParameter("status"));
                Roles r = new Roles(roleID, roleName, status);

                dao.updateRole(r);
//                Vector<Products> list = dao.getAllProduct(SQL);
//                request.setAttribute("data", list);
//                request.setAttribute("pageTitle", "Product Manager");
//                request.setAttribute("tableTitle", "List of Products");
//
//                request.getRequestDispatcher("jsp/role/ProductJSP.jsp").forward(request, response);
                response.sendRedirect("ServletRole_JSP");
            }
        }

        if (service.equals("addRole")) {
            String submit = request.getParameter("submit");
            if (submit == null) {//show form InsertProduct.jsp
                request.getRequestDispatcher("jsp/role/InsertRole.jsp").forward(request, response);
            } else {
                String roleName = request.getParameter("roleName");
                int status = Integer.parseInt(request.getParameter("status"));
                Roles r = new Roles(roleName, status);

                dao.insertRole(r);
                response.sendRedirect("ServletRole_JSP");
            }
        }
        
        if (service.equals("listRole")) {
            String submit = request.getParameter("submit");
            String roleName = request.getParameter("roleName");
            Vector<Roles> list;
            if (submit == null) {
                list = dao.getAllRole(SQL);
            } else {
                list = dao.getAllRole("SELECT *\n"
                        + "FROM [dbo].[tblRoles]\n"
                        + "WHERE roleName like N'%" + roleName + "%'");
            }

            //set data for view
            request.setAttribute("data", list);
            request.setAttribute("pageTitle", "Role Manager");
            request.setAttribute("tableTitle", "List of Roles");

            //Select view
            request.getRequestDispatcher("jsp/role/RoleJSP.jsp").forward(request, response);
        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
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

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
