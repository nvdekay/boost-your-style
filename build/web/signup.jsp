<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Sign Up</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="./css/signup.css">
    </head>
    <body>

        <div class="register-box">
            <div class="register-header">
                <h3>Register</h3>
            </div>
            <form action="user-register" method="POST">
                <div class="input-box">
                    <input type="email" class="input-field" id="user" name="user" placeholder="Enter your email" required>
                </div>

                <div class="input-box">
                    <input type="password" class="input-field" id="pass" name="pass" placeholder="Enter your password" required>
                </div>

                <div class="input-box">
                    <input type="password" class="input-field" id="repass" name="repass" placeholder="Confirm your password" required>
                </div>

                <div class="input-box">
                    <input type="text" class="input-field" id="address" name="address" placeholder="Enter address">
                </div>

                <div class="input-box">
                    <input type="tel" class="input-field" id="phoneNumber" name="phoneNumber" placeholder="Enter your phone number" required>
                </div>

                <div class="input-submit">
                    <button type="submit" class="submit-btn">Register</button>
                </div>
            </form>

            <div class="sign-up-link">
                Already have an account? <a href="login">Login</a>
            </div>
        </div>


    </body>
</html>
