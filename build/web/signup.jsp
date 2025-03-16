<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Sign Up</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
        <style>
            @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;500&display=swap');

            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: 'Poppins', sans-serif;
            }

            body {
                display: flex;
                justify-content: center;
                align-items: center;
                min-height: 100vh;
                background: #dfdfdf;
            }

            /* Register Form */
            .register-box {
                display: flex;
                flex-direction: column;
                justify-content: center;
                width: 440px;
                height: auto;
                padding: 30px;
                border-radius: 10px;
            }

            /* Header */
            .register-header {
                text-align: center;
                margin-bottom: 30px;
            }

            .register-header h3 {
                color: #333;
                font-size: 30px;
                font-weight: 600;
            }

            /* Input Fields */
            .input-box .input-field {
                width: 100%;
                height: 60px;
                font-size: 17px;
                padding: 0 20px;
                margin-bottom: 15px;
                border-radius: 25px;
                border: none;
                box-shadow: 0px 5px 10px 1px rgba(0, 0, 0, 0.05);
                outline: none;
                transition: .3s;
            }

            ::placeholder {
                font-weight: 500;
                color: #222;
            }

            .input-field:focus {
                width: 102%;
            }

            /* Submit Button */
            .input-submit {
                position: relative;
            }

            .submit-btn {
                width: 100%;
                height: 60px;
                background: #222;
                border: none;
                border-radius: 25px;
                cursor: pointer;
                transition: .3s;
                font-size: 16px;
                color: #fff;
                font-weight: 500;
                margin-top: 28px;
            }

            .submit-btn:hover {
                background: #000;
                transform: scale(1.05, 1);
            }

            /* Sign Up Link */
            .sign-up-link {
                text-align: center;
                font-size: 15px;
                margin-top: 20px;
            }

            .sign-up-link a {
                color: #000;
                font-weight: 600;
                text-decoration: none;
            }

            .sign-up-link a:hover {
                text-decoration: underline;
            }

        </style>
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
