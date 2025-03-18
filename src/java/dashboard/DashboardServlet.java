package dashboard;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/dashboard")
public class DashboardServlet extends HttpServlet {

    private DashboardDAO dashboardDAO;

    @Override
    public void init() throws ServletException {
        dashboardDAO = new DashboardDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getSession().getAttribute("account") != null && request.getSession().getAttribute("role_admin") != null) {
            try {
                request.setAttribute("totalOrders", dashboardDAO.getTotalOrders());
                request.setAttribute("totalRevenue", dashboardDAO.getTotalRevenue());
                request.setAttribute("maxOrderValue", dashboardDAO.getMaxOrderValue());
                request.setAttribute("minOrderValue", dashboardDAO.getMinOrderValue());
                request.setAttribute("totalProductsSold", dashboardDAO.getTotalProductsSold());
            } catch (SQLException e) {
                throw new ServletException("Error fetching dashboard data", e);
            }
            // Chuyển đến trang JSP
            request.getRequestDispatcher("dashboard.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}
