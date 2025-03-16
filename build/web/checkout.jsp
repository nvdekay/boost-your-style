<%-- 
    Document   : viewCart
    Created on : Feb 23, 2022, 10:32:01 PM
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

        <!-- Product section-->
        <section class="py-5">

            <div class="container" style="min-height: 1000px">
                <h1>Checkout</h1>
                <div class="row">
                    <div class="col-md-8" style="border: 1px solid #ccc; border-radius: 5px; padding: 1rem">
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
                                <c:forEach items="${carts}" var="C">
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
                        <h3>Total Amount: $${totalMoney}</h3>
                    </div>
                    <div class="col-md-4" style="border: 1px solid #ccc; border-radius: 5px; padding: 1rem">
                        <h3>Information of customer</h3>
                        <form action="checkout" method="POST">
                            <div class="mb-3">
                                <label for="name" class="form-label">Name<span style="color: red"> *</span></label>
                                <input type="text" class="form-control" required id="name" name="name" aria-describedby="emailHelp">
                            </div>
                            <div class="mb-3">
                                <label for="phone" class="form-label">Phone<span style="color: red"> *</span></label>
                                <input type="text" class="form-control" id="phone" required name="phone" value="${account.phoneNumber}" aria-describedby="emailHelp">
                            </div>
                            <div class="mb-3">
                                <label for="address" class="form-label">Address<span style="color: red"> *</span></label>
                                <input type="text" class="form-control" id="address" required name="address" value="${account.address}" aria-describedby="emailHelp">
                            </div>
                            <div class="mb-3">
                                <label for="note" class="form-label">Note<span style="color: red"> *</span></label>
                                <textarea class="form-control" id="note" required name="note" rows="3"></textarea>
                            </div>
                            <button type="submit" class="btn btn-primary w-100">Submit</button>
                        </form>
                    </div>
                </div>
            </div>
        </section>
        <%@include file="footer.jsp" %>
    </body>
</html>

