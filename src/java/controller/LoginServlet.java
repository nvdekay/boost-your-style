package controller;

import dal.DAO;
import java.io.IOException;
import java.io.PrintWriter;

//import dal.DAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Admin;

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
        DAO d = new DAO();
        Admin a = d.check(u, p);
        if (a == null) {
//             Chua co user nay
            request.setAttribute("error", "Invalid username or password.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else {
//             Co user nay
            session.setAttribute("account", a);
            // role = 1 -> admin
            if (a.getRole() == 1) {
                request.getRequestDispatcher("admin.jsp").forward(request, response);
            } else { // role = 0 -> user
                request.getRequestDispatcher("home.jsp").forward(request, response);
            }
            response.sendRedirect("home");
        }
    }
}
