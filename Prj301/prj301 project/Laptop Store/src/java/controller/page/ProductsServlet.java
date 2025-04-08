package controller.page;

import dal.implement.ProductDAO;
import dal.implement.ProductDetailDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.Vector;
import model.Product;
import model.ProductDetail;

public class ProductsServlet extends HttpServlet {

    // declare dao 
    ProductDAO productDao = new ProductDAO();
    ProductDetailDAO productDetailDao = new ProductDetailDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ProductsServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProductsServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // get id product
        int productID = Integer.parseInt(request.getParameter("productID"));

        // find product by id 
        Product productFind = productDao.searchProduct(productID);
        // get related product list 
        Vector<Product> relatedProducts = productDao.getRelatedProducts2(productID);
        // get category name of product 
        String categoryName = productDao.getCategoryNameByProductID(productID); 
        // get brand name 
        String brandName = productDao.getBrandNameByProductID(productID); 
        // product detail 
        ProductDetail productDetail = productDetailDao.getProductDetailByProductID(productID); 
        
        // set and forward sang trang product 
        
        request.setAttribute("product", productFind);
        request.setAttribute("relatedProducts", relatedProducts);
        request.setAttribute("categoryName", categoryName);
        request.setAttribute("brandName", brandName);
        request.setAttribute("productDetail", productDetail);
       
        request.getRequestDispatcher("view/page/product.jsp").forward(request, response);
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
