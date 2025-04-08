package controller;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "CalcServlet", urlPatterns = "/calc")
public class CalcServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String dai = request.getParameter("dai");
        String rong = request.getParameter("rong");
//        String cv = request.getParameter("cv");
//        String dt = request.getParameter("dt");
        String[] d = request.getParameterValues("d");
        double a, b;
        String ms = "";
        PrintWriter out = response.getWriter();

        try {
            a = Double.parseDouble(dai);
            b = Double.parseDouble(rong);

            //cach 1 
            // khong chon 
//            if (cv == null && dt == null) {
//                ms = "Chua chon gi";
//            } else if (cv != null && dt == null) {
//                ms = "Chu vi: " + (a + b) * 2;
//            } else if (cv == null && dt != null) {
//                ms = "Dien tich: " + a * b;
//            } else {
//                ms = "Chu vi: " + (a + b) * 2 + "<br>Dien tich: " + a * b;
//            }
            if (d == null) {
                ms = "Chua chon gi";
            } else if (d.length == 2) {
                ms = "Chu vi: " + (a + b) * 2 + "<br>Dien tich: " + a * b;
            } else if (d[0].equalsIgnoreCase("0")) {
                ms = "Chu vi: " + (a + b) * 2;
            } else {
                ms = "Dien tich: " + a * b;
            }
            out.println("<h1>" + ms + "</h1>");
        } catch (NumberFormatException e) {
            System.err.println(e);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("index.html").forward(request, response);
    }

}
