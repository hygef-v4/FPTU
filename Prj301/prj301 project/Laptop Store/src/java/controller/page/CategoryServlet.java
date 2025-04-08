package controller.page;

import dal.implement.CategoryDAO;
import dal.implement.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.Vector;
import model.Category;
import model.Product;

public class CategoryServlet extends HttpServlet {

    // sql statement 
    private static final String categoryListSQL = "SELECT * FROM [dbo].[tblCategories]";
    private static final String productListSQL = "SELECT * FROM [dbo].[tblProducts]";

    // declare dao 
    ProductDAO productDAO = new ProductDAO();
    CategoryDAO categoryDAO = new CategoryDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // loc san pham theo category hoac brand hoac list ra tat ca san pham 
        Vector<Product> productList = findProductDoGet(request);
        // get list category
        Vector<Category> categoryList = categoryDAO.getAllCategory(categoryListSQL);

        request.setAttribute("productList", productList);
        request.setAttribute("categoryList", categoryList);
        request.getRequestDispatcher("view/page/category.jsp").forward(request, response);
    }

    // loc san pham theo category hoac brand hoac list ra tat ca san pham 
    private Vector<Product> findProductDoGet(HttpServletRequest request) {
        // get ve search 
        String actionSearch = request.getParameter("search") == null ? "default"
                : request.getParameter("search");

        Vector<Product> listProduct;
        switch (actionSearch) {
            case "category":        // find product by category id 
                String categoryID = request.getParameter("categoryID");
                listProduct = productDAO.findByCategory(categoryID);
                break;
            case "brand":        // find product by brand id 
                String brandID = request.getParameter("brandID");
                listProduct = productDAO.findByBrandID(brandID);
                break;
            case "searchByKeyword":        // find product by name or description
                String keyword = request.getParameter("keyword");
                listProduct = productDAO.searchByKeyword(keyword);
                break;

            case "priceRange": // Filter products by price range
                double minPrice = 0; // Default minimum price
                double maxPrice = Double.MAX_VALUE; // Default maximum price

                try {
                    String minPriceStr = request.getParameter("min_price");
                    String maxPriceStr = request.getParameter("max_price");

                    if (minPriceStr != null && !minPriceStr.isEmpty()) {
                        minPrice = Double.parseDouble(minPriceStr);
                    }
                    if (maxPriceStr != null && !maxPriceStr.isEmpty()) {
                        maxPrice = Double.parseDouble(maxPriceStr);
                    }
                } catch (NumberFormatException e) {
                    e.printStackTrace(); // Handle invalid input gracefully
                }

                listProduct = productDAO.findByPriceRange(minPrice, maxPrice);
                break;
                
            case "sort": // Sort products based on orderby parameter
                String orderby = request.getParameter("orderby");
                listProduct = productDAO.sortProducts(orderby);
                break;

            default:                 // list all products 
                listProduct = productDAO.getAllProduct(productListSQL);
        }

        return listProduct;
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

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CategoryServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CategoryServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }
}
