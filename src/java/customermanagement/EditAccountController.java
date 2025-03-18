package customermanagement;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Account;

@WebServlet(name = "EditAccountController", urlPatterns = {"/EditAccount"})
public class EditAccountController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (request.getSession().getAttribute("account") != null && request.getSession().getAttribute("role_admin") != null) {
            Account account = new Account();
            account.setId(Integer.parseInt(request.getParameter("id")));
            account.setActive(Boolean.parseBoolean(request.getParameter("active")));

            AcountDAO adb = new AcountDAO();
            adb.updateAccount(account);
            response.sendRedirect("managerAccount");
        } else {
            request.getRequestDispatcher("login.jsp").forward(request, response);
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
