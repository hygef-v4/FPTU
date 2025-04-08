
package controller.page;

import dal.implement.OrderDAO;
import dal.implement.OrderDetailDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import model.Order;
import model.OrderDetails;
import model.User;
import java.util.Vector;
import model.Product;

/**
 *
 * @author hungs
 */
public class CartServlet extends HttpServlet {

    OrderDAO orderDao = new OrderDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("view/page/cart.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action") == null
                ? "" : request.getParameter("action");
        switch (action) {
            case "add-product":
                addProduct(request, response);
                break;
            case "change-quantity":
                changeQuantity(request, response);
                break;
            case "delete":
                deleteProduct(request, response);
                break;
            default:
                throw new AssertionError();
        }
        response.sendRedirect("cart");
    }

    private void addProduct(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();
        //get session 
        // get product id 
        int id = Integer.parseInt(request.getParameter("productID"));

        // get quantity
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        // get cart tren session 
        Order cart = (Order) session.getAttribute("cart");
        if (cart == null) {
            cart = new Order();
        }
        OrderDetails orderDetail = new OrderDetails();
        orderDetail.setProductID(id);
        orderDetail.setQuantity(quantity);
        // them order details vao cart
        addOrderDetailsToOrder(orderDetail, cart);
        // set new cart to session
        session.setAttribute("cart", cart);

    }

    private void addOrderDetailsToOrder(OrderDetails orderDetail, Order cart) {
        boolean isAdd = false;
        for (OrderDetails od : cart.getListOrderDetails()) {
            if (od.getProductID() == orderDetail.getProductID()) {
                od.setQuantity(od.getQuantity() + orderDetail.getQuantity());  // update quantity when art new order to cart
                isAdd = true;
            }
        }
        if (isAdd == false) {  // neu chua add san pham nao 
            cart.getListOrderDetails().add(orderDetail);
        }
    }

    private void changeQuantity(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();

        try {
            // Get product id 
            int id = Integer.parseInt(request.getParameter("id"));
            // Get new quantity 
            int quantity = Integer.parseInt(request.getParameter("quantity-input"));

            // Get cart 
            Order cart = (Order) session.getAttribute("cart");
            if (cart != null) { // Ensure cart is not null
                for (OrderDetails od : cart.getListOrderDetails()) {
                    if (od.getProductID() == id) {
                        od.setQuantity(quantity);
                        break; // Stop loop after updating the correct product
                    }
                }
                // Update session
                session.setAttribute("cart", cart);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void deleteProduct(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("productID"));
        HttpSession session = request.getSession();
        // get cart from session 
        Order cart = (Order) session.getAttribute("cart");
        // loop through to remove product that has same id in order detail 
        OrderDetails productFind = null;
        for (OrderDetails od : cart.getListOrderDetails()) {
            if (od.getProductID() == id) {
                productFind = od;
                break;
            }
        }
        cart.getListOrderDetails().remove(productFind); // delete from order detail list
        session.setAttribute("cart", cart); // update session  

    }

    

}
