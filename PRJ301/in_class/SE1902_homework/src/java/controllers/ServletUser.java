/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers;

import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;
import java.util.Vector;
import models.Users;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "ServletUser", urlPatterns = {"/ServletUserURL"})
public class ServletUser extends HttpServlet {

    private static final String SQL = "SELECT * FROM [dbo].[tblUsers]";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        UserDAO dao = new UserDAO();
        String service = request.getParameter("service");
        if (service == null) {
            service = "listUser";
        }
        if (service.equals("deleteUser")) {
            String uId = request.getParameter("uId");
            int n = dao.deleteUser(uId);
            response.sendRedirect("ServletUserURL");
        }
        if (service.equals("addUser")) {
            String userID = request.getParameter("userID"),
                    fullName = request.getParameter("fullName"),
                    password = request.getParameter("password");
            int roleID = Integer.parseInt(request.getParameter("roleID"));
            String address = request.getParameter("address"),
                    phone = request.getParameter("phone"),
                    email = request.getParameter("email");
            boolean activate = Boolean.parseBoolean(request.getParameter("activate"));
            Users u = new Users(userID, fullName, password, roleID, address, phone, email, activate);

            dao.insertUser(u);
            response.sendRedirect("ServletUserURL");

        }
        if (service.equals("listUser")) {
            try (PrintWriter out = response.getWriter()) {
                /* TODO output your page here. You may use following sample code. */
                out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("<head>");
                out.println("<title>Servlet ServletUser</title>");
                out.println("</head>");
                out.println("<body>");
                out.println("<form action=\"ServletUserURL\" method=\"get\">\n"
                        + "            <p>Search by User Name:\n"
                        + "                <input type=\"text\" name=\"fullName\">\n"
                        + "                <input type=\"submit\" name=\"submit\" value=\"Search\">\n"
                        + "                <input type=\"reset\" value=\"Reset\">\n"
                        + "                <input type=\"hidden\" name=\"service\" value=\"listUser\">\n"
                        + "        </form>");
                out.print(" <p><a href=\"addUser.html\">add User</a></p>");
                out.println("<table border='1'>");
                out.println("<thead>");
                out.println("<tr>");
                out.println("<th>userID</th>");
                out.println("<th>fullName</th>");
                out.println("<th>password</th>");
                out.println("<th>roleID</th>");
                out.println("<th>address</th>");
                out.println("<th>phone</th>");
                out.println("<th>email</th>");
                out.println("<th>activate</th>");
                out.println("<th>Update</th>");
                out.println("<th>Delete</th>");
                out.println("</tr>");
                out.println("</thead>");
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

                for (Users users : list) {
                    out.println("<tr>\n"
                            + "                    <td>" + users.getUserID() + "</td>\n"
                            + "                    <td>" + users.getFullName() + "</td>\n"
                            + "                    <td>" + users.getPassword() + "</td>\n"
                            + "                    <td>" + users.getRoleID() + "</td>\n"
                            + "                    <td>" + users.getAddress() + "</td>\n"
                            + "                    <td>" + users.getPhone() + "</td>\n"
                            + "                    <td>" + users.getEmail() + "</td>\n"
                            + "                    <td>" + users.isActivate() + "</td>\n"
                            + "                    <td><a href=\"ServletUserURL?service=updateUser&uId=" + users.getUserID() + "\">Update</a></td>\n"
                            + "                    <td><a href=\"ServletUserURL?service=deleteUser&uId=" + users.getUserID() + "\">Delete</a></td>\n"
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
