package productlist;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Category;
import model.Product;

@WebServlet(name = "CategoryController", urlPatterns = {"/category"})
public class SearchByCategoryController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int categoryId = Integer.parseInt(request.getParameter("categoryId"));
        // page
        final int PAGE_SIZE = 8;
        int page = 1;
        String pageStr = request.getParameter("page");
        if (pageStr != null) {
            page = Integer.parseInt(pageStr);
        }
        if (page < 1) {
            page = 1;
        }
        int totalProducts = new ProductDBContext().countProducts(categoryId);
        int totalPage = totalProducts / PAGE_SIZE;
        if (totalProducts % PAGE_SIZE != 0) {
            totalPage += 1;
        }
        if (page > totalPage) {
            page = totalPage;
        }
        request.setAttribute("page", page);
        request.setAttribute("totalPage", totalPage);
        List<Product> listProducts = new ProductDBContext().getProductsByCategoryId(categoryId);
        List<Category> listCategories = new CategoryDAO().getAllCategories();
        request.setAttribute("listCategories", listCategories);
        request.setAttribute("listProducts", listProducts);
        request.setAttribute("tag", categoryId);
        request.getRequestDispatcher("list_product.jsp").forward(request, response);

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
