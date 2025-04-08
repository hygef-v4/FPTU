package controller.page;

import dal.implement.OrderDAO;
import dal.implement.OrderDetailDAO;
import dal.implement.ProductDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.HashSet;

import model.Order;
import model.OrderDetails;
import model.User;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Product;

/**
 *
 * @author hungs
 */
public class PaymentServlet extends HttpServlet {

    OrderDAO orderDao = new OrderDAO();
    OrderDetailDAO OrderDetailDao = new OrderDetailDAO();
    ProductDAO productDAO = new ProductDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        // Check if user is null or missing required fields
        if (user == null || "Default Name".equals(user.getFullName())
                || user.getAddress() == null || user.getPhone() == null) {

            session.setAttribute("alertInfoMessage", "Vui lòng cập nhật thông tin cá nhân trước khi thanh toán!");
            response.sendRedirect("dashboard?tab=edit");
            return;  // Ensures no further execution
        }

        request.getRequestDispatcher("view/page/checkout.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action") == null
                ? "" : request.getParameter("action");
        switch (action) {
            case "check-out":
                if (checkOut(request, response)) {
                    response.sendRedirect("dashboard?tab=order");
                }
                break;
            default:
                response.sendRedirect("payment");
        }

    }

    private boolean checkOut(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        // get cart 
        HttpSession session = request.getSession();
        // get cart from session 
        Order cart = (Order) session.getAttribute("cart");
        // get account id 
        User user = (User) session.getAttribute("user");
        // lay list product 
        Vector<Product> productList = (Vector<Product>) session.getAttribute("productList");

        int userID = user.getUserID();
        // calculate amount
        int amount = caculateAmount(cart, productList);
        //set order to check out 
        cart.setUserID(userID);
        cart.setAmount(amount);

        cart.setFullname(request.getParameter("fullname"));
        cart.setAddress(request.getParameter("address"));
        cart.setPhone(request.getParameter("phone"));

        String note = request.getParameter("order-note");

        if (note == null || note.trim().isEmpty()) {
            note = "không có ghi chú";
        } else {
            note = note.trim(); // Still trim to remove leading/trailing spaces
        }
        cart.setNote(note);

        // Check stock before proceeding
        for (OrderDetails od : cart.getListOrderDetails()) {
            Product product = productDAO.searchProduct(od.getProductID());
            if (product == null) {
                session.setAttribute("errorPaymentMsg",
                        "Sản phẩm với ID " + od.getProductID() + " không tồn tại.");
                request.getRequestDispatcher("view/page/cart.jsp").forward(request, response);
                return false;
            } else if (product.getQuantity() < od.getQuantity()) {
                session.setAttribute("errorPaymentMsg",
                        "Sản phẩm " + product.getProductName() + " không đủ hàng trong kho.");
                request.getRequestDispatcher("view/page/cart.jsp").forward(request, response);
                return false;
            }
        }

        // insert order 
        int orderId = orderDao.insertOrder(cart); // return order id 
        for (OrderDetails od : cart.getListOrderDetails()) {
            od.setOrderID(orderId);   // cap nhat order id cho tung sp mua 
            
            // **Set the price for each order detail**
            double productPrice = findPriceById(productList, od.getProductID());
            od.setPrice(productPrice);

            OrderDetailDao.insert(od);
            // tru di so luong san pham trong db 
            Product product = productDAO.searchProduct(od.getProductID());
            int newQuantity = product.getQuantity() - od.getQuantity();
            productDAO.updateProductQuantity(product.getProductID(), newQuantity);

        }

        // remove cart 
        session.removeAttribute("cart");
        session.setAttribute("successPaymentMsg", "Cảm ơn bạn đã mua hàng");
        return true;
    }

    private int caculateAmount(Order cart, Vector<Product> productList) {
        int amount = 0;
        for (OrderDetails od : cart.getListOrderDetails()) {
            amount += (od.getQuantity() * findPriceById(productList, od.getProductID()));
        }
        return amount;
    }

    private double findPriceById(Vector<Product> productList, int productID) {
        for (Product p : productList) {
            if (p.getProductID() == productID) {
                return p.getPrice();
            }
        }
        return 0;
    }

}
