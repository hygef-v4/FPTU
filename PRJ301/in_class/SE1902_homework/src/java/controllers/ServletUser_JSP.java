/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers;

import dal.RoleDAO;
import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebInitParam;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;
import java.util.Vector;
import models.Roles;
import models.Users;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "ServletUser_JSP", urlPatterns = {"/ServletUser_JSP"}, initParams = {
    @WebInitParam(name = "URL", value = "URLDemo"),
    @WebInitParam(name = "userName", value = "sa"),
    @WebInitParam(name = "pass", value = "123")})
public class ServletUser_JSP extends HttpServlet {

    private static final String SQL = "SELECT * FROM [dbo].[tblUsers]";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        RoleDAO roleDao = new RoleDAO();
        Vector<Roles> vector = roleDao.getAllRole("SELECT * FROM [dbo].[tblRoles]");
        UserDAO dao = new UserDAO();
        String service = request.getParameter("service");
        if (service == null) {
            service = "listUser";
        }

        if (service.equals("deleteUser")) {
            String userID = request.getParameter("userID");
            int n = dao.deleteUser(userID);
            response.sendRedirect("ServletUser_JSP");
        }

        if (service.equals("updateUser")) {
            String submit = request.getParameter("submit");
            if (submit == null) {//show UpdateUser.jsp
                String userID = request.getParameter("userID");
                Users u = dao.searchUser(userID);
                request.setAttribute("vector", vector);
                request.setAttribute("u", u);
                request.getRequestDispatcher("jsp/user/UpdateUser.jsp").forward(request, response);
            } else {
                String userID = request.getParameter("userID"),
                        fullName = request.getParameter("fullName"),
                        password = request.getParameter("password");
                int roleID = Integer.parseInt(request.getParameter("roleID"));
                String address = request.getParameter("address"),
                        phone = request.getParameter("phone"),
                        email = request.getParameter("email");
                boolean activate = Boolean.parseBoolean(request.getParameter("activate"));
                Users u = new Users(userID, fullName, password, roleID, address, phone, email, activate);
                dao.updateUser(u);
                response.sendRedirect("ServletUser_JSP");
            }
        }

        if (service.equals("addUser")) {
            String submit = request.getParameter("submit");
            if (submit == null) {//show form InsertUser.jsp
                //set data for view
                request.setAttribute("vector", vector);
                //select view 
                request.getRequestDispatcher("jsp/user/InsertUser.jsp").forward(request, response);
            } else {
                String userID = request.getParameter("userID"),
                        fullName = request.getParameter("fullName"),
                        password = request.getParameter("password");
                int roleID = Integer.parseInt(request.getParameter("roleID"));
                String address = request.getParameter("address"),
                        phone = request.getParameter("phone"),
                        email = request.getParameter("email");
                boolean activate = Boolean.parseBoolean(request.getParameter("activate"));
                // Check if userID already exists
                Users existingUser = dao.searchUser(userID);
                if (existingUser != null) {
                    request.setAttribute("errorMessage", "User ID already exists! Please choose a different one.");
                    request.setAttribute("vector", vector);
                    request.getRequestDispatcher("jsp/user/InsertUser.jsp").forward(request, response);
                    return; // Stop further execution
                }

                Users u = new Users(userID, fullName, password, roleID, address, phone, email, activate);
                dao.insertUser(u);

                Vector<Users> list = dao.getAllUser(SQL);
                request.setAttribute("data", list);
                request.setAttribute("pageTitle", "User Manager");
                request.setAttribute("tableTitle", "List of Users");

                request.getRequestDispatcher("jsp/user/UserJSP.jsp").forward(request, response);

//                response.sendRedirect("ServletProduct_JSP");
            }
        }
        if (service.equals("listUser")) {
            String submit = request.getParameter("submit");
            String fullName = request.getParameter("fullName");
            Vector<Users> list;
            if (submit == null) {
                list = dao.getAllUser(SQL);
            } else {
                list = dao.getAllUser("SELECT *\n"
                        + "FROM [dbo].[tblUsers]\n"
                        + "WHERE fullName like N'%" + fullName + "%'");
            }

            //set data for view
            request.setAttribute("data", list);
            request.setAttribute("pageTitle", "Users Manager");
            request.setAttribute("tableTitle", "List of Users");

            //Select view
            request.getRequestDispatcher("jsp/user/UserJSP.jsp").forward(request, response);
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
