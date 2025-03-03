<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="./css/login.css">
        <title>Login Page</title>
    </head>

    <body>
    <c:set var="cookie" value="${requestScope.request.cookies}" />
    <!--        <form action="login" method="post" class="login-box">
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
            <div class="forgot">
                <section>
                    <input type="checkbox" name="remember" value="ON" ${(cookie.cremember != null ? 'checked' : '')}>
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
</form>-->
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
        <div class="forgot">
            <section>
                <input type="checkbox" name="remember" value="ON" ${(cookie.cremember !=null ? 'checked' : '' )}>
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
            <input type="submit" value="Sign In" class="submit-btn" id="submit">
            <label for="submit">Sign In</label>
        </div>

        <!-- Added Google Login Button -->
        <div class="input-submit" style="margin-top: 15px;">
            <button type="button" class="submit-btn google-btn" onclick="handleGoogleLogin()"
                    style="background-color: #fff; color: #000; border: 1px solid #ddd; display: flex; align-items: center; justify-content: center; gap: 10px;">
                <img src="https://www.google.com/favicon.ico" alt="Google" style="width: 20px; height: 20px;">
                Login with Google
            </button>
        </div>

        <div class="sign-up-link">
            <p>Don't have account? <a href="#">Sign Up</a></p>
        </div>
    </form>

    <script>
        function handleGoogleLogin() {
            // Add your Google login implementation here
            // This could redirect to your Google OAuth endpoint
            window.location.href = '/google-login'; // Example endpoint
        }
    </script>
</body>

</html>