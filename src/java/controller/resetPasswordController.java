package controller;

import customermanagement.AcountDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Account;

@WebServlet(name = "SignupController", urlPatterns = { "/reset" })
public class resetPasswordController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet forgetPasswordController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet forgetPasswordController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (request.getSession().getAttribute("account") != null) {
            request.getRequestDispatcher("change-newpassword.jsp").forward(request, response);
        } else {
            response.sendError(404);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Account logingAccount = (Account) session.getAttribute("account");
        String pass = request.getParameter("newPassword");
        String repass = request.getParameter("confirmPassword");
        AcountDAO adb = new AcountDAO();
        if (!pass.equals(repass)) {
            request.setAttribute("mess", "password does not match!");
            request.getRequestDispatcher("change-newpassword.jsp").forward(request, response);
            return;
        }
        if (pass.equals(repass)) {
            adb.UpDatePassWord(pass, logingAccount.getId());
            request.setAttribute("mess", "Change password successfully!");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }

}
