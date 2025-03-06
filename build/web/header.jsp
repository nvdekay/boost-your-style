<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="./css/header.css">
        <title>Header Page</title>
    </head>
    <body>
        <!-- NAVBAR -->
        <nav class="navbar navbar-expand-lg navbar-light bg-white py-3 fixed-top">
            <div class="container">
                <img src="img/logo1.png" alt="" width="200">
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                        data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                        aria-expanded="false" aria-label="Toggle navigation">
                    <span><i id="bar" class="fa fa-bars" aria-hidden="true"></i></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav ml-auto">

                        <li class="nav-item">
                            <a class="nav-link" href="#home">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#clothes">Clothes</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#shoes">Shoes</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#watches">Watches</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#footer">Contact Us</a>
                        </li>
                        <form class="d-flex">
                            <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                            <button class="btn btn-outline-dark" type="submit"
                                    style="margin-left: 10px;">Search</button>
                        </form>

                </div>
            </div>
            <c:if test="${sessionScope.account!=null}">
                <!-- ||
                <a href="infor">
                    User Info
                </a> -->
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
