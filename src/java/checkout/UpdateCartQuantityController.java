package checkout;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.LinkedHashMap;
import java.util.Map;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Product;

@WebServlet(name = "UpdateCartQuantityController", urlPatterns = {"/update-quantity"})

public class UpdateCartQuantityController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            if (request.getSession().getAttribute("account") != null) {
                String productId = request.getParameter("productId").trim();
                int quantity = Integer.parseInt(request.getParameter("quantity"));

                HttpSession session = request.getSession();
                Map<String, Cart> carts = (Map<String, Cart>) session.getAttribute("carts");
                if (carts == null) {
                    carts = new LinkedHashMap<>();
                }

                if (carts.containsKey(productId)) {
                    // Validate cart's quantity
                    ProductDAO productDBContext = new ProductDAO();
                    Product product = productDBContext.getProductById(productId);
                    if (quantity > product.getQuantity()) {
                        request.setAttribute("message", "Hết hàng");
                        request.getRequestDispatcher("404.jsp").forward(request, response);
                        return;
                    }
                    if (quantity < 1) {
                        carts.remove(productId);
                    } else {
                        carts.get(productId).setQuantity(quantity);
                    }
                }
                session.setAttribute("carts", carts);
                response.sendRedirect("carts");
            } else {
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }

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
