package controllers;

import dal.RoleDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;
import java.util.Vector;
import models.Roles;

@WebServlet(name = "ServletRole", urlPatterns = {"/ServletRoleURL"})
public class ServletRole extends HttpServlet {

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
            int rId = Integer.parseInt(request.getParameter("rId"));
            int n = dao.deleteRole(rId);
            response.sendRedirect("ServletRoleURL");
        }
        if (service.equals("addRole")) {
            String roleName = request.getParameter("roleName");
            int status = Integer.parseInt(request.getParameter("status"));
            Roles r = new Roles(roleName, status);

            dao.insertRole(r);
            response.sendRedirect("ServletRoleURL");
        }
        if (service.equals("listRole")) {
            try (PrintWriter out = response.getWriter()) {
                /* TODO output your page here. You may use following sample code. */
                out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("<head>");
                out.println("<title>Servlet ServletRole</title>");
                out.println("</head>");
                out.println("<body>");
                out.println("<form action=\"ServletRoleURL\" method=\"get\">\n"
                        + "            <p>Search by name:\n"
                        + "                <input type=\"text\" name=\"roleName\">\n"
                        + "                <input type=\"submit\" name=\"submit\" value=\"Search\">\n"
                        + "                <input type=\"reset\" value=\"Reset\">\n"
                        + "                <input type=\"hidden\" name=\"service\" value=\"listRole\">\n"
                        + "        </form>");
                out.print(" <p><a href=\"addRole.html\">Add new Role</a></p>");

                out.println("<table border='1'>");
                out.println("<thead>");
                out.println("<tr>");
                out.println("<th>roleID</th>");
                out.println("<th>roleName</th>");
                out.println("<th>status</th>");
                out.println("<th>Update</th>");
                out.println("<th>Delete</th>");
                out.println("</tr>");
                out.println("</thead>");
                String submit = request.getParameter("submit");
                String roleName = request.getParameter("roleName");
                Vector<Roles> list;
                if (submit == null) {
                    list = dao.getAllRole(SQL);
                } else {
                    list = dao.getAllRole("SELECT *\n"
                            + "FROM [dbo].[tblRoles]\n"
                            + "WHERE roleName like '%" + roleName + "%'");
                }

                for (Roles roles : list) {
                    out.println("<tr>\n"
                            + "                    <td>" + roles.getRoleID() + "</td>\n"
                            + "                    <td>" + roles.getRoleName() + "</td>\n"
                            + "                    <td>" + roles.getStatus() + "</td>\n"
                            + "                    <td><a href=\"ServletRoleURL?service=updateRole&rId=" + roles.getRoleID() + "\">Update</a></td>\n"
                            + "                    <td><a href=\"ServletRoleURL?service=deleteRole&rId=" + roles.getRoleID() + "\">Delete</a></td>\n"
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
