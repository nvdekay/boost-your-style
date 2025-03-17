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

@WebServlet(name = "SearchController", urlPatterns = {"/product-list"})
public class SearchController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String keyword = request.getParameter("keyword") == null ? "" : request.getParameter("keyword");
            int categoryId = 0;

            try {
                categoryId = Integer.parseInt(request.getParameter("categoryId"));
            } catch (NumberFormatException ex) {

            }
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

            int totalProducts = new ProductDBContext().countProducts(keyword, categoryId);
            int totalPage = totalProducts / PAGE_SIZE;
            if (totalProducts % PAGE_SIZE != 0) {
                totalPage += 1;
            }
            if (page > totalPage) {
                page = totalPage;
            }
            List<Product> listProducts = new ProductDBContext().search(keyword, page, PAGE_SIZE, categoryId);
            request.setAttribute("page", page);
            request.setAttribute("totalPage", totalPage);

            List<Category> listCategories = new CategoryDBContext().getAllCategories();
            request.setAttribute("listCategories", listCategories);

            request.setAttribute("listProducts", listProducts);
            request.setAttribute("key", keyword);
            request.setAttribute("categoryId", categoryId);
            request.getRequestDispatcher("list_product.jsp").forward(request, response);
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
