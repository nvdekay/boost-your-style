package forgotpassword;

import customermanagement.AcountDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.security.SecureRandom;
import java.util.Base64;
import model.Account;

@WebServlet("/forgot-password")
public class ForgotPasswordServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        request.getRequestDispatcher("forgot-password.jsp").forward(request, response);
    } 
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        AcountDAO acountDBContext = new AcountDAO();
        Account account = acountDBContext.checkAccountExist(email);
        // Kiểm tra email có tồn tại không
        if (account == null) {
            request.setAttribute("messForgot", "Email không tồn tại");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }
        // Tạo mật khẩu mới
        String newPassword = generateRandomPassword();

        // Cập nhật mật khẩu trong database
        acountDBContext.UpDatePassWord(newPassword,account.getId());

        // Gửi mật khẩu mới qua email
        String subject = "Your New Password";
        String message = "Your new password is: " + newPassword;
        SendMailHelper helper = new SendMailHelper();
        helper.sendEmailTo(email, subject, message);

        request.setAttribute("messForgot", "Mật khẩu mới đã được gửi về email của bạn");
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }

    String generateRandomPassword() {
        SecureRandom random = new SecureRandom();
        byte[] bytes = new byte[6]; // 6 bytes ~ 8 ký tự base64
        random.nextBytes(bytes);
        return Base64.getUrlEncoder().withoutPadding().encodeToString(bytes);
    }
}
