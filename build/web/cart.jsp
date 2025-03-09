<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
              crossorigin="anonymous">
        <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" />
        <link rel="stylesheet" href="./css/cart.css">
    </head>

    <body>
        <%@include file="header.jsp"%>
        <section id="blog-home" class="pt-5 mt-5 container">
            <h2 class="font-weight-bold pt-5">Shopping Cart</h2>
            <hr>
        </section>

        <section id="cart-container" class="container my-5">
            <table width="100%">
                <thead>
                    <tr>
                        <td>Remove</td>
                        <td>Image</td>
                        <td>Product</td>
                        <td>Price</td>
                        <td>Quantity</td>
                        <td>Total</td>
                    </tr>
                </thead>

                <tbody>
                    <tr>
                        <td><a href="#"><i class="fas fa-trash-alt"></i></a></td>
                        <td><img src="./img/shoes/1.jpg" alt=""></td>
                        <td><h5>Product Name</h5></td>
                        <td><h5>Product Price</h5></td>
                        <td><input class="w-25 pl-1" type="number" value="1"></td>
                        <td><h5>Product Total Price</h5></td>
                    </tr>
                </tbody>
            </table>
        </section>

        <section id="cart-bottom" class="container">
            <div class="row">
                <div class="coupon col-lg-6 col-md-6 col-12 mb-4">
                    <div>
                        <h5>COUPON</h5>
                        <p>Enter your coupon code if you have one.</p>
                        <input type="text" placeholder="Coupon Code">
                        <button class="ml-auto">APPLY COUPON</button>
                    </div>
                </div>
                <div class="total col-lg-6 col-md-6 col-12 mb-4">
                    <div>
                        <h5>CART TOTAL</h5>
                        <div class="d-flex justify-content-between">
                            <h6>Subtotal</h6>
                            <p>Price</p>
                        </div>
                        <div class="d-flex justify-content-between">
                            <h6>Shipping</h6>
                            <p>Free</p>
                        </div>
                        <hr class="second-hr">
                        <div class="d-flex justify-content-between">
                            <h6>Total</h6>
                            <p>Price</p>
                        </div>
                        <button class="ml-auto">PROCEED TO CHECKOUT</button>
                    </div>
                </div>
            </div>
        </section>

        <%@include file="footer.jsp"%>
    </body>

</html>