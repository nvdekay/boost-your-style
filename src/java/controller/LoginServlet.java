package controller;

import dal.DAO;
import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Account;

@WebServlet(name = "LoginServlet", urlPatterns = {"/login"})
public class LoginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String u = request.getParameter("user");
        String p = request.getParameter("pass");
        String r = request.getParameter("remember");

        // Tao 3 cookies: username, pass, remember
        Cookie cu = new Cookie("cuser", u);
        Cookie cp = new Cookie("cpass", p);
        Cookie cr = new Cookie("cremember", r);
        if (r != null) {
            cu.setMaxAge(60 * 60 * 24 * 30);
            cp.setMaxAge(60 * 60 * 24 * 30);
            cr.setMaxAge(60 * 60 * 24 * 30);
        } else {
            cu.setMaxAge(0);
            cp.setMaxAge(0);
            cr.setMaxAge(0);
        }
        response.addCookie(cu);
        response.addCookie(cp);
        response.addCookie(cr);

        DAO d = new DAO();
        Account a = d.check(u, p);
        if (a == null) {
            // Chua co user nay
            request.setAttribute("error", "Invalid username or password.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else {
            // Co user nay
            session.setAttribute("account", a);
            // roleId = 1 -> admin
            if (a.getRoleId() == 1) {
                response.sendRedirect("managerAccount");
                session.setAttribute("role_admin", "yes");
            } else { // role = 2 -> user
                response.sendRedirect("home");
            }
        }

    }
}
