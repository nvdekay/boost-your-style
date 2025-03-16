/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import customermanagement.AcountDBContext;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "UserRegisterController", urlPatterns = {"/user-register"})
public class UserRegisterController extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UserRegisterController</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UserRegisterController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        request.getRequestDispatcher("signup.jsp").forward(request, response);
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
        String user = request.getParameter("user");
        String pass = request.getParameter("pass");
        String address = request.getParameter("address");
        String phoneNumber = request.getParameter("phoneNumber");
        String repass = request.getParameter("repass");
        if (!pass.equals(repass)) {
            request.setAttribute("user", user);
            request.setAttribute("pass", pass);
            request.setAttribute("repass", repass);
            request.setAttribute("mess", "Mật Khẩu Không Khớp");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else {
            AcountDBContext adb = new AcountDBContext();
            Account a = adb.checkAccountExist(user);
            // ktra tai khoan co trong he thogn hay ko
            if (a == null) {
                Account b = new Account();
                b.setUsername(user);
                b.setPassword(pass);
                int result = adb.insertAccount(new Account(user, user, address, phoneNumber, pass));
                if (result == 0) {
                    request.setAttribute("user", user);
                    request.setAttribute("pass", pass);
                    request.setAttribute("repass", repass);
                    request.setAttribute("mess", "Thông tin đã tồn tại");
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                    response.sendRedirect("login.jsp");
                    return;
                }
                HttpSession session = request.getSession();
                session.setAttribute("account", b);
                response.sendRedirect("home");
            } else {
                // neu co thi bao da ton tai
                request.setAttribute("user", user);
                request.setAttribute("pass", pass);
                request.setAttribute("repass", repass);
                request.setAttribute("mess", "Tài Khoản Đã Tồn Tại");
                request.setAttribute("check", true);
                request.getRequestDispatcher("login.jsp").forward(request, response);
                response.sendRedirect("login.jsp");
            }
        }
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
