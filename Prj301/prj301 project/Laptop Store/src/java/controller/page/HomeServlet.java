package controller.page;

import dal.implement.BrandDAO;
import dal.implement.CategoryDAO;
import dal.implement.OrderDAO;
import dal.implement.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import java.util.Vector;
import model.Brand;
import model.Category;
import model.Order;
import model.Product;

public class HomeServlet extends HttpServlet {

    private static final String productListSQL = "SELECT * FROM [dbo].[tblProducts]";
    private static final String featureProductSQL = "SELECT * FROM [dbo].[tblProducts] WHERE isFeatured = 1";
    private static final String newProductsSQL = "SELECT top 10 * FROM [dbo].[tblProducts] order by importDate desc";
    private static final String categoryListSQL = "SELECT * FROM [dbo].[tblCategories]";
    private static final String brandListSQL = "SELECT * FROM [dbo].[tblBrands]";
    ProductDAO productDAO = new ProductDAO();
    CategoryDAO categoryDAO = new CategoryDAO();
    BrandDAO brandDAO = new BrandDAO();
    OrderDAO orderDao = new OrderDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // get list product by feature
        Vector<Product> featureProducts = productDAO.getAllProduct(featureProductSQL);
        // get list of new product
        Vector<Product> newProducts = productDAO.getAllProduct(newProductsSQL);
        // get list category
        Vector<Category> categoryList = categoryDAO.getAllCategory(categoryListSQL);
        // gete brandDAO
        Vector<Brand> brandList = brandDAO.getAllBrands(brandListSQL);
        //get all product 
        Vector<Product> productList = productDAO.getAllProduct(productListSQL);
        HttpSession session = request.getSession();
        session.setAttribute("featureProducts", featureProducts);
        session.setAttribute("newProducts", newProducts);
        session.setAttribute("categoryList", categoryList);
        session.setAttribute("brandList", brandList);
        session.setAttribute("productList", productList);

        request.getRequestDispatcher("view/page/home.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("home");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet HomeController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet HomeController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

}
