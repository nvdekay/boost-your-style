<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product Details</title>

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
              crossorigin="anonymous">
        <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" />
        <link rel="stylesheet" href="./css/sproduct.css">
    </head>

    <body>
        <%@include file="header.jsp" %>

        <section class="container sproduct my-5 pt-5">
            <div class="row mt-5">
                <div class="col-lg-5 col-md-12 col-12">
                    <img class="img-fluid w-100" src="img/shop/1.jpg" id="MainImg" alt="">
                    <div class="small-img-group">
                        <div class="small-img-col">
                            <img src="img/shop/1.jpg" width="100%" class="small-img" alt="">
                        </div>
                        <div class="small-img-col">
                            <img src="img/shop/24.jpg" width="100%" class="small-img" alt="">
                        </div>
                        <div class="small-img-col">
                            <img src="img/shop/25.jpg" width="100%" class="small-img" alt="">
                        </div>
                        <div class="small-img-col">
                            <img src="img/shop/26.jpg" width="100%" class="small-img" alt="">
                        </div>
                    </div>
                </div>

                <div class="col-lg-6 col-md-12 col-12">
                    <h6>Home / T-Shirt</h6>
                    <h3 class="py-4">Men's Fashion T-Shirt</h3>
                    <h2>$139.00</h2>
                    <select class="my-3">
                        <option>Select Size</option>
                        <option>XXL</option>
                        <option>XL</option>
                        <option>Large</option>
                        <option>Medium</option>
                        <option>Small</option>
                    </select>
                    <input type="number" value="1">
                    <button class="buy-btn">Add to Cart</button>
                    <h4 class="mt-5 mb-5">Product Details</h4>
                    <span>Lorem ipsum dolor sit amet consectetur adipisicing elit. Quos, voluptates.</span>
                </div>
            </div>
        </section>


        <%@include file="footer.jsp" %>
    </body>
    <script>
        var MainImg = document.getElementById("MainImg");
        var smallimg = document.getElementsByClassName("small-img");

        smallimg[0].onclick = function () {
            MainImg.src = smallimg[0].src;
        }
        smallimg[1].onclick = function () {
            MainImg.src = smallimg[1].src;
        }
        smallimg[2].onclick = function () {
            MainImg.src = smallimg[2].src;
        }
        smallimg[3].onclick = function () {
            MainImg.src = smallimg[3].src;
        }
    </script>

    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js"
            integrity="sha384-SR1sx49pcuLnqZUnnPwx6FCym0wLsk5JZuNx2bPPENzswTNFaQU1RDvt3wT4gWFG"
    crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.min.js"
            integrity="sha384-j0CNLUeiqtyaRmlzUHCPZ+Gy5fQu0dQ6eZ/xAww941Ai1SxSY+0EQqNXNE6DZiVc"
    crossorigin="anonymous"></script>

</html>