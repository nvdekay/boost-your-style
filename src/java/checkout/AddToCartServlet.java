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

@WebServlet(name = "AddToCartServlet", urlPatterns = {"/add-to-cart"})
public class AddToCartServlet extends BaseRequiredAuthenController {

    protected void processRequests(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            if (request.getSession().getAttribute("account") != null) {
                String productId = request.getParameter("productId");
                // validate product's quantity
                ProductDAO productDBContext = new ProductDAO();
                Product product = productDBContext.getProductById(productId);
                if(product.getQuantity() <= 0){
                    request.setAttribute("message", "Hết hàng");
                    request.getRequestDispatcher("404.jsp").forward(request, response);
                    return;
                }
                //map    productId | cart
                HttpSession session = request.getSession();
                Map<String, Cart> carts = (Map<String, Cart>) session.getAttribute("carts");
                if (carts == null) {
                    carts = new LinkedHashMap<>();
                }
                
                // ktra san pham co trong gio hang hay chua
                if (carts.containsKey(productId)) {//sản phẩm đã có trên giỏ hàng
                    int oldQuantity = carts.get(productId).getQuantity();
                    carts.get(productId).setQuantity(oldQuantity + 1);
                } else {//sản phẩm chưa có trên giỏ hàng
                    product = productDBContext.getProductById(productId);
                    carts.put(productId, new Cart(product, 1));
                }
                //lưu carts lên session
                session.setAttribute("carts", carts);
                response.sendRedirect("carts");
            } else {
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
            
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
