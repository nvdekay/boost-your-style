package customermanagement;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Account;

@WebServlet(name = "ManagerAccountController", urlPatterns = {"/managerAccount"})
public class ManagerAccountController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (request.getSession().getAttribute("account") != null && request.getSession().getAttribute("role_admin") != null) {
            AcountDAO acountDBContext = new AcountDAO();
            // page
            final int PAGE_SIZE = 3;
            int page = 1;
            String pageStr = request.getParameter("page");
            if (pageStr != null) {
                page = Integer.parseInt(pageStr);
            }
            if (page < 1) {
                page = 1;
            }
            // lấy số lượng account
            int totalAccount = acountDBContext.getTotalAccount();
            int totalPage = totalAccount / PAGE_SIZE;
            if (totalAccount % PAGE_SIZE != 0) {
                totalPage += 1;
            }
            if (page > totalPage) {
                page = totalPage;
            }
            request.setAttribute("page", page);
            request.setAttribute("totalPage", totalPage);
            List<Account> accounts = acountDBContext.getAllAccountByPage(page, PAGE_SIZE);
            request.setAttribute("accounts", accounts);
            request.getRequestDispatcher("ManagerCustomer.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (request.getSession().getAttribute("account") != null && request.getSession().getAttribute("role_admin") != null) {
            // Lấy dữ liệu từ form
            String email = request.getParameter("email");
            String phoneNumber = request.getParameter("phoneNumber");
            String address = request.getParameter("address");

            // Username = email, Password = mặc định hoặc có thể tạo random
            String username = email;
            String password = "1"; // Hoặc mã hóa password trước khi lưu

            // Tạo đối tượng Account
            Account account = new Account(username, email, address, phoneNumber, password);

            // Gọi phương thức insert
            AcountDAO db = new AcountDAO();
            db.insertAccount(account);
            response.sendRedirect("managerAccount?page=1");
        } else {
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }

}
