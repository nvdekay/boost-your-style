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
import model.Account;

@WebServlet(name = "CheckOutController", urlPatterns = {"/checkout"})
public class CheckOutController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            if (request.getSession().getAttribute("account") != null) {
                HttpSession session = request.getSession();
                Map<String, Cart> carts = (Map<String, Cart>) session.getAttribute("carts");
                if (carts == null) {
                    carts = new LinkedHashMap<>();
                }

                //tinh tong tien
                double totalMoney = 0;
                for (Map.Entry<String, Cart> entry : carts.entrySet()) {
                    Cart cart = entry.getValue();

                    totalMoney += cart.getQuantity() * cart.getProduct().getPrice();

                }
                request.setAttribute("totalMoney", totalMoney);
                request.setAttribute("account", session.getAttribute("account"));
                request.getRequestDispatcher("checkout.jsp").forward(request, response);
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
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String note = request.getParameter("note");

        //Lưu Order
        HttpSession session = request.getSession();
        Map<String, Cart> carts = (Map<String, Cart>) session.getAttribute("carts");
        if (carts == null) {
            carts = new LinkedHashMap<>();
        }

        //tinh tong tien
        double totalPrice = 0;
        for (Map.Entry<String, Cart> entry : carts.entrySet()) {
            Cart cart = entry.getValue();

            totalPrice += cart.getQuantity() * cart.getProduct().getPrice();

        }

        Account a = (Account) request.getSession().getAttribute("account");
        Order order = new Order(a.getId(), totalPrice, note);

        int orderId = new OrderDBcontext().createReturnId(order);
        //Lưu OrderDetail

        new OrderDetailDBcontext().saveCart(orderId, carts);

        session.removeAttribute("carts");
        request.setAttribute("cartss", carts);
        request.setAttribute("totalPrice", totalPrice);
        request.getRequestDispatcher("thank").forward(request, response);
    }

}
