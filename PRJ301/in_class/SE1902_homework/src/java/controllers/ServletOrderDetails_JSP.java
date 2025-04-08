package controllers;

import dal.OrderDetailsDAO;
import java.io.IOException;
import java.util.Vector;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.annotation.WebInitParam;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.OrderDetails;

@WebServlet(name = "ServletOrderDetails_JSP", urlPatterns = {"/ServletOrderDetails_JSP"}, initParams = {
    @WebInitParam(name = "URL", value = "URLDemo"),
    @WebInitParam(name = "userName", value = "sa"),
    @WebInitParam(name = "pass", value = "123")
})
public class ServletOrderDetails_JSP extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        OrderDetailsDAO dao = new OrderDetailsDAO();
        String service = request.getParameter("service");
        if (service == null) {
            service = "listOrderDetails";
        }
        
        // Add Order Detail
        if (service.equals("addOrderDetail")) {
            String submit = request.getParameter("submit");
            if (submit == null) { 
                // Show Insert form (JSP)
                request.getRequestDispatcher("jsp/orderDetail/InsertOrderDetail.jsp").forward(request, response);
            } else {
                double price = Double.parseDouble(request.getParameter("price"));
                int quantity = Integer.parseInt(request.getParameter("quantity"));
                int orderID = Integer.parseInt(request.getParameter("orderID"));
                int productID = Integer.parseInt(request.getParameter("productID"));
                
                // detailID is auto-generated so not provided
                OrderDetails od = new OrderDetails(0, price, quantity, orderID, productID);
                dao.insertOrderDetail(od);
                response.sendRedirect("ServletOrderDetails_JSP?service=listOrderDetails");
            }
        }
        
        // Update Order Detail (Only update price and quantity)
        if (service.equals("updateOrderDetail")) {
            String submit = request.getParameter("submit");
            if (submit == null) {
                // Show Update form (JSP)
                int detailID = Integer.parseInt(request.getParameter("detailID"));
                OrderDetails od = dao.searchOrderDetail(detailID);
                request.setAttribute("orderDetail", od);
                request.getRequestDispatcher("jsp/orderDetail/UpdateOrderDetail_JSTL.jsp").forward(request, response);
            } else {
                int detailID = Integer.parseInt(request.getParameter("detailID"));
                double price = Double.parseDouble(request.getParameter("price"));
                int quantity = Integer.parseInt(request.getParameter("quantity"));
                
                // Retrieve existing orderID and productID from DB
                OrderDetails oldOd = dao.searchOrderDetail(detailID);
                int orderID = oldOd.getOrderID();
                int productID = oldOd.getProductID();
                
                OrderDetails od = new OrderDetails(detailID, price, quantity, orderID, productID);
                dao.updateOrderDetail(od);
                response.sendRedirect("ServletOrderDetails_JSP?service=listOrderDetails");
            }
        }
        
        // Delete Order Detail
        if (service.equals("deleteOrderDetail")) {
            int detailID = Integer.parseInt(request.getParameter("detailID"));
            dao.deleteOrderDetail(detailID);
            response.sendRedirect("ServletOrderDetails_JSP?service=listOrderDetails");
        }
        
        // List Order Details and optional search by orderID
        if (service.equals("listOrderDetails")) {
            String orderIDParam = request.getParameter("orderID");
            Vector<OrderDetails> list;
            if (orderIDParam == null || orderIDParam.trim().isEmpty()) {
                list = dao.getAllOrderDetails();
            } else {
                list = dao.searchOrderDetailsByOrderID(Integer.parseInt(orderIDParam));
            }
            request.setAttribute("data", list);
            request.setAttribute("pageTitle", "Order Details Manager");
            request.getRequestDispatcher("jsp/orderDetail/OrderDetailsJSP_JSTL.jsp").forward(request, response);
        }
    }

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
        return "Servlet for Order Details Management (JSP version)";
    }
}
