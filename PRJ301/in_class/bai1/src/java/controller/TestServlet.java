package controller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "TestServlet", urlPatterns = {"/test"})
public class TestServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet TestServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet TestServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("index.html").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String ten = request.getParameter("name");
        String gt = request.getParameter("gender");
        String diemRaw = request.getParameter("mark");
        String monHoc = request.getParameter("subject");
        double diem;
        String ms = "";
        PrintWriter out = response.getWriter();

        out.println("<!DOCTYPE html>");
        out.println("<html>");
        out.println("<head>");
        out.println("<title>Servlet TestServlet</title>");
        out.println("</head>");
        out.println("<body>");
        try {
            diem = Double.parseDouble(diemRaw);
            if (gt.equals("1")) {
                ms = "Hello Mr " + ten;
            } else {
                ms = "Hello Ms " + ten;
            }

            if (diem > 5) {
                ms += "<br> chuc mung " + ten + " pass mon " + monHoc;
            } else {
                ms += "<br> chia buon chuc mung may man mon " + monHoc + " lan sau";
            }

        } catch (Exception e) {
            System.err.println(e);
        }
        out.println("<h2>" + ms + "</h2>");
        out.println("</body>");
        out.println("</html>");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
