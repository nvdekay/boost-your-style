<%-- 
    Document   : thanks
    Created on : Mar 2, 2022, 5:05:27 PM
    Author     : Admin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta
            name="viewport"
            content="width=device-width, initial-scale=1, shrink-to-fit=no"
            />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Shop Homepage - Start Bootstrap Template</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
            rel="stylesheet"
            />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
              crossorigin="anonymous">
        <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" />
        <link rel="stylesheet" href="./css/home.css">
    </head>
    <body>
        <%@include file="header.jsp" %>

        <div class="container" style="min-height: 1000px">
            <div class="alert alert-success text-center mt-5" role="alert" >
                <h3>List Products</h3>
                        <table class="table">
                            <thead>
                                <tr>
                                    <th scope="col">#</th>
                                    <th scope="col">Image</th>
                                    <th scope="col">Name</th>
                                    <th scope="col">Price</th>
                                    <th scope="col">Quantity</th>
                                    <th scope="col">Total Price</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${cartss}" var="C">
                                    <tr>
                                <input type="hidden" name="productId" value="${C.value.product.id}"/>
                                <th scope="row">${C.value.product.id}</th>
                                <td>${C.value.product.name}</td>
                                <td><img src="${C.value.product.image}" width="50"/></td>
                                <td>${C.value.product.price}</td>
                                <td>${C.value.quantity}</td>
                                <td>${C.value.product.price*C.value.quantity}</td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                        <h3>Total Amount: $${totalPrice}</h3>
                Order successfully, Thank you very much...
                <div class="text-center mt-2">
                    <a class="btn btn-outline-primary" href="home">Continue Shopping</a>
                </div>
            </div>
        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>

