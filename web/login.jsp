<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="./css/login.css">
        <title>Login</title>
    </head>

    <body>
    <c:set var="cookie" value="${requestScope.request.cookies}" />
    <form action="login" method="post" class="login-box">
        <div class="login-header">
            <header>Login</header>
        </div>
        <div class="input-box">
            <input type="text" name="user" class="input-field" placeholder="Username" autocomplete="off"
                   value="${cookie.cuser.value}" required>
        </div>
        <div class="input-box">
            <input type="password" name="pass" class="input-field" placeholder="Password" autocomplete="off"
                   value="${cookie.cpass.value}" required>
        </div>
        <h3 class="error" style="
            color: red;
            text-align: center;
            margin-bottom: 20px;
            font-size: 15px;">
            ${requestScope.error}
        </h3>

        <div class="input-submit">
            <input type="submit" value="Sign In" class="submit-btn" id="submit">
            <label for="submit">Sign In</label>
        </div>

        <div class="sign-up-link">
            <p>Don't have account? <a href="user-register">Sign Up</a></p>
            <p>${mess}</p>
        </div>
        <div class="sign-up-link">
            <p>Forgot password? <a href="forgot-password">Forgot Password</a></p>
            <p>${messForgot}</p>
        </div>
    </form>
</body>

</html>