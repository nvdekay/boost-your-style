package productlist;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Category;
import model.Product;

@WebServlet(name = "ProductDetailController", urlPatterns = {"/product-detail"})
public class ProductDetailController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String productId = request.getParameter("productId");
            ProductDBContext productDBContext = new ProductDBContext();
            CategoryDAO categoryDBContext = new CategoryDAO();
            Product product = productDBContext.getProductById(productId);
            Category category = categoryDBContext.getCategoryById(product.getCategory().getId());
            product.setCategory(category);
            List<Product> productsByCategory = productDBContext.getProductsByCategoryId(category.getId());
            request.setAttribute("product", product);
            request.setAttribute("productsByCategory", productsByCategory);
            request.getRequestDispatcher("product-detail.jsp").forward(request, response);
        } catch (Exception ex) {
            response.sendError(404);
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
}
