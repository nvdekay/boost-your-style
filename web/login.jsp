<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="./css/login.css">
        <title>Login Page</title>
    </head>

    <body>
        <form action="login" method="post" class="login-box">
            <div class="login-header">
                <header>Login</header>
            </div>
            <div class="input-box">
                <input type="text" name="user" class="input-field" placeholder="Username" autocomplete="off" required>
            </div>
            <div class="input-box">
                <input type="password" name="pass" class="input-field" placeholder="Password" autocomplete="off"
                       required>
            </div>
            <div class="forgot">
                <section>
                    <input type="checkbox" id="check">
                    <label for="check">Remember me</label>
                </section>
                <section>
                    <a href="#">Forgot password</a>
                </section>
            </div>
            <h3 class="error" style="
                color: red;
                text-align: center;
                margin-bottom: 20px;
                font-size: 15px;">

                ${requestScope.error}
            </h3>

            <div class="input-submit">
                <input type="submit" value="Sign In" class="submit-btn" id="submit"></>
                <label for="submit">Sign In</label>
            </div>
            <div class="sign-up-link">
                <p>Don't have account? <a href="#">Sign Up</a></p>
            </div>
        </form>
    </body>

</html>