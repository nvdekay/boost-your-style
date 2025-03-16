<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="./css/header.css">
        <title>Header Page</title>
    </head>

    <body>
        <nav class="navbar navbar-expand-lg navbar-light bg-white py-3 fixed-top">
            <div class="container">
                <a href="managerAccount">
                    <img src="img/logo1.png" alt="" width="200">
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                        data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                        aria-expanded="false" aria-label="Toggle navigation">
                    <span><i id="bar" class="fa fa-bars" aria-hidden="true"></i></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">

                    <c:set var="cat" value="${requestScope.data}" />
                    <c:set var="cid" value="${requestScope.cid}" />
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="managerAccount">Account Management</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="dashboard">Dashboard</a>
                        </li>
                </div>
            </div>
            <c:if test="${sessionScope.account!=null}">
                <a class="btn btn-outline-dark btn-login" type="submit" href="logout">
                    Logout
                </a>
                &nbsp;&nbsp;&nbsp;
                <span style="color:red">[ ${sessionScope.account.username} ]</span>
            </c:if>
            <c:if test="${sessionScope.account == null}">
                <a class="btn btn-outline-dark btn-login" type="submit" href="login">Login</a>
            </c:if>
        </nav>
    </body>

</html>