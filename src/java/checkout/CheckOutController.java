/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
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
/**
 *
 * @author Admin
 */
@WebServlet(name = "CheckOutController", urlPatterns = {"/checkout"})
public class CheckOutController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
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
