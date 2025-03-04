<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

        <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" />

        <link rel="stylesheet" href="./css/home.css">
    </head>

    <body>

        <!-- NAVBAR -->
        <nav class="navbar navbar-expand-lg navbar-light bg-white py-3 fixed-top">
            <div class="container">
                <img src="img/logo1.png" alt="">
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                        data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                        aria-expanded="false" aria-label="Toggle navigation">
                    <span><i id="bar" class="fa fa-bars" aria-hidden="true"></i></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav ml-auto">

                        <li class="nav-item">
                            <a class="nav-link" href="home">Home</a>
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
                        <li class="nav-item">
                            <i class="fa fa-search nav-icon" aria-hidden="true"></i>
                            <i class="fa fa-shopping-bag nav-icon" aria-hidden="true"></i>
                        </li>

                </div>
            </div>
        </nav>

        <section id="home">
            <div class="container">
                <h5>NEW ARRIVALS</h5>
                <h1><span>Best Price</span> This Year</h1>
                <button>Shop Now</button>
            </div>
        </section>

        <section id="brand" class="container">
            <div class="row m-0 py-5">
                <img class="img-fluid col-lg-2 col-md-4 col-6" src="./img/brand/1.png" alt="">
                <img class="img-fluid col-lg-2 col-md-4 col-6" src="./img/brand/2.png" alt="">
                <img class="img-fluid col-lg-2 col-md-4 col-6" src="./img/brand/3.png" alt="">
                <img class="img-fluid col-lg-2 col-md-4 col-6" src="./img/brand/4.png" alt="">
                <img class="img-fluid col-lg-2 col-md-4 col-6" src="./img/brand/5.png" alt="">
                <img class="img-fluid col-lg-2 col-md-4 col-6" src="./img/brand/6.png" alt="">
            </div>
        </section>

        <!-- All Category -->
        <section id="news" class="w-100">
            <div class="row p-0 m-0">
                <div class="one col-lg-4 col-md-12 col-12 p-0">
                    <img class="img-fluid" src="./img/new/2.jpg" alt="">
                    <div class="details">
                        <h2>Awesome Blank Outfit</h2>
                        <button class="text-uppercase" href="#clothes">Show now</button>
                    </div>
                </div>
                <div class="one col-lg-4 col-md-12 col-12 p-0">
                    <img class="img-fluid" src="./img/new/1.jpg" alt="">
                    <div class="details">
                        <h2>Extreme Rare Sneakers</h2>
                        <button class="text-uppercase">Show now</button>
                    </div>
                </div>
                <div class="one col-lg-4 col-md-12 col-12 p-0">
                    <img class="img-fluid" src="./img/new/3.jpg" alt="">
                    <div class="details">
                        <h2>Spotwear Up To 50% Off</h2>
                        <button class="text-uppercase">Show now</button>
                    </div>
                </div>

            </div>
        </section>

        <!-- Clothes -->
        <section id="clothes" class="my-5">
            <div class="container text-center mt-5 py-5">
                <h3>Dresses & Jackets</h3>
                <hr class="mx-auto">
            </div>
            <div class="row mx-auto container-fluid">
                <div class="product text-center col-lg-4 col-md-4 col-12">
                    <img class="img-fluid mb-3" src="img/clothes/1.jpg" alt="">
                    <div class="star">
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                    </div>
                    <h5 class="p-name">Sport Boots</h5>
                    <h4 class="p-price">$92.00</h4>
                    <button class="buy-btn">Buy Now</button>
                </div>
                <div class="product text-center col-lg-4 col-md-4 col-12">
                    <img class="img-fluid mb-3" src="img/clothes/2.jpg" alt="">
                    <div class="star">
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                    </div>
                    <h5 class="p-name">Sport Boots</h5>
                    <h4 class="p-price">$92.00</h4>
                    <button class="buy-btn">Buy Now</button>
                </div>
                <div class="product text-center col-lg-4 col-md-4 col-12">
                    <img class="img-fluid mb-3" src="img/clothes/3.jpg" alt="">
                    <div class="star">
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                    </div>
                    <h5 class="p-name">Sport Boots</h5>
                    <h4 class="p-price">$92.00</h4>
                    <button class="buy-btn">Buy Now</button>
                </div>
            </div>
        </section>

        <!-- Shoes -->
        <section id="shoes" class="my-5 pb-5">
            <div class="container text-center mt-5 py-5">
                <h3>Running Shoes</h3>
                <hr class="mx-auto">
            </div>
            <div class="row mx-auto container-fluid">
                <div class="product text-center col-lg-3 col-md-4 col-12">
                    <img class="img-fluid mb-3" src="img/shoes/1.jpg" alt="">
                    <div class="star">
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                    </div>
                    <h5 class="p-name">Sport Boots</h5>
                    <h4 class="p-price">$92.00</h4>
                    <button class="buy-btn">Buy Now</button>
                </div>
                <div class="product text-center col-lg-3 col-md-4 col-12">
                    <img class="img-fluid mb-3" src="img/shoes/2.jpg" alt="">
                    <div class="star">
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                    </div>
                    <h5 class="p-name">Sport Boots</h5>
                    <h4 class="p-price">$92.00</h4>
                    <button class="buy-btn">Buy Now</button>
                </div>
                <div class="product text-center col-lg-3 col-md-4 col-12">
                    <img class="img-fluid mb-3" src="img/shoes/3.jpg" alt="">
                    <div class="star">
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                    </div>
                    <h5 class="p-name">Sport Boots</h5>
                    <h4 class="p-price">$92.00</h4>
                    <button class="buy-btn">Buy Now</button>
                </div>
                <div class="product text-center col-lg-3 col-md-4 col-12">
                    <img class="img-fluid mb-3" src="img/shoes/4.jpg" alt="">
                    <div class="star">
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                    </div>
                    <h5 class="p-name">Sport Boots</h5>
                    <h4 class="p-price">$92.00</h4>
                    <button class="buy-btn">Buy Now</button>
                </div>


            </div>
        </section>

        <!-- Watches -->
        <section id="watches" class="my-5">
            <div class="container text-center mt-5 py-5">
                <h3>Best Watches</h3>
                <hr class="mx-auto">
            </div>
            <div class="row mx-auto container-fluid">
                <div class="product text-center col-lg-3 col-md-4 col-12">
                    <img class="img-fluid mb-3" src="img/watches/1.jpg" alt="">
                    <div class="star">
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                    </div>
                    <h5 class="p-name">Sport Boots</h5>
                    <h4 class="p-price">$92.00</h4>
                    <button class="buy-btn">Buy Now</button>
                </div>
                <div class="product text-center col-lg-3 col-md-4 col-12">
                    <img class="img-fluid mb-3" src="img/watches/2.jpg" alt="">
                    <div class="star">
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                    </div>
                    <h5 class="p-name">Sport Boots</h5>
                    <h4 class="p-price">$92.00</h4>
                    <button class="buy-btn">Buy Now</button>
                </div>
                <div class="product text-center col-lg-3 col-md-4 col-12">
                    <img class="img-fluid mb-3" src="img/watches/3.jpg" alt="">
                    <div class="star">
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                    </div>
                    <h5 class="p-name">Sport Boots</h5>
                    <h4 class="p-price">$92.00</h4>
                    <button class="buy-btn">Buy Now</button>
                </div>
                <div class="product text-center col-lg-3 col-md-4 col-12">
                    <img class="img-fluid mb-3" src="img/watches/4.jpg" alt="">
                    <div class="star">
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                    </div>
                    <h5 class="p-name">Sport Boots</h5>
                    <h4 class="p-price">$92.00</h4>
                    <button class="buy-btn">Buy Now</button>
                </div>


            </div>
        </section>

        <%@include file="footer.jsp"%>

        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js"
                integrity="sha384-SR1sx49pcuLnqZUnnPwx6FCym0wLsk5JZuNx2bPPENzswTNFaQU1RDvt3wT4gWFG"
        crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.min.js"
                integrity="sha384-j0CNLUeiqtyaRmlzUHCPZ+Gy5fQu0dQ6eZ/xAww941Ai1SxSY+0EQqNXNE6DZiVc"
        crossorigin="anonymous"></script>
    </body>

</html>