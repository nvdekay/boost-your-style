<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                        data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
                        aria-label="Toggle navigation">
                    <span><i id="bar" class="fa fa-bars" aria-hidden="true"></i></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav ml-auto">

                        <li class="nav-item">
                            <a class="nav-link" href="#">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Shop</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Blog</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">About</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Contact Us</a>
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
                <p>Lorem ipsum dolor sit amet consectetur </p>
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

        <section id="news" class="w-100">
            <div class="row p-0 m-0">
                <div class="one col-lg-4 col-md-12 col-12 p-0">
                    <img class="img-fluid" src="./img/new/1.jpg" alt="">
                    <div class="details">
                        <h2>Extreme Rare Sneakers</h2>
                        <button class="text-uppercase">Show now</button>
                    </div>
                </div>
                <div class="one col-lg-4 col-md-12 col-12 p-0">
                    <img class="img-fluid" src="./img/new/2.jpg" alt="">
                    <div class="details">
                        <h2>Awesome Blank Outfit</h2>
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

        <section id="featured" class="my-5 pb-5">
            <div class="container text-center mt-5 py-5">
                <h3>Our Featured</h3>
                <hr class="mx-auto">
                <p>Lorem ipsum dolor sit amet consectetur</p>
            </div>
            <div class="row mx-auto container-fluid">
                <div class="product text-center col-lg-3 col-md-4 col-12">
                    <img class="img-fluid mb-3" src="img/featured/1.jpg" alt="">
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
                    <img class="img-fluid mb-3" src="img/featured/2.jpg" alt="">
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
                    <img class="img-fluid mb-3" src="img/featured/3.jpg" alt="">
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
                    <img class="img-fluid mb-3" src="img/featured/4.jpg" alt="">
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

        <section id="banner" class="my-5 py-5">
            <div class="container">
                <h4>MID SEASON'S SALE</h4>
                <h1>Autumn Collection<br>UP TO 20% OFF</h1>
                <button class="text-uppercase">Show now</button>
            </div>
        </section>

        <section id="clothes" class="my-5">
            <div class="container text-center mt-5 py-5">
                <h3>Dresses & Jackets</h3>
                <hr class="mx-auto">
                <p>Lorem ipsum dolor sit amet consectetur</p>
            </div>
            <div class="row mx-auto container-fluid">
                <div class="product text-center col-lg-3 col-md-4 col-12">
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
                <div class="product text-center col-lg-3 col-md-4 col-12">
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
                <div class="product text-center col-lg-3 col-md-4 col-12">
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
                <div class="product text-center col-lg-3 col-md-4 col-12">
                    <img class="img-fluid mb-3" src="img/clothes/4.jpg" alt="">
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

        <section id="watches" class="my-5">
            <div class="container text-center mt-5 py-5">
                <h3>Best Watches</h3>
                <hr class="mx-auto">
                <p>Lorem ipsum dolor sit amet consectetur</p>
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

        <section id="shoes" class="my-5 pb-5">
            <div class="container text-center mt-5 py-5">
                <h3>Running Shoes</h3>
                <hr class="mx-auto">
                <p>Lorem ipsum dolor sit amet consectetur</p>
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

        <footer class="mt-5 py-5">
            <div class="row container mx-auto pt-5">
                <div class="footer-one col-lg-3 col-md-6 col-12">
                    <img src="img/logo2.png" alt="">
                    <p class="pt-3">Lorem ipsum dolor sit amet consectetur adipisicing elit. Quaerat, voluptate.</p>
                </div>
                <div class="footer-one col-lg-3 col-md-6 col-12 mb-3">
                    <h5 class="pb-2">Featured</h5>
                    <ul class="text-uppercase list-unstyled">
                        <li><a href="#">men</a></li>
                        <li><a href="#">women</a></li>
                        <li><a href="#">boys</a></li>
                        <li><a href="#">girls</a></li>
                        <li><a href="#">new arrivals</a></li>
                        <li><a href="#">shoes</a></li>
                        <li><a href="#">cloths</a></li>
                    </ul>
                </div>
                <div class="footer-one col-lg-3 col-md-6 col-12 mb-3">
                    <h5 class="pb-2">Contact Us</h5>
                    <div>
                        <h6 class="text-uppercase">Address</h6>
                        <p>123, Main Street, Your City</p>
                    </div>
                    <div>
                        <h6 class="text-uppercase">Phone</h6>
                        <p>(123) 456 789</p>
                    </div>
                    <div>
                        <h6 class="text-uppercase">Email</h6>
                        <p>khanhnvd.work@gmail.com</p>
                    </div>
                </div>
                <div class="footer-one col-lg-3 col-md-6 col-12 mb-3">
                    <h5 class="pb-2">Instagram</h5>
                    <div class="row">
                        <img class="img-fluid w-25 h-100 m-2" src="img/insta/1.jpg" alt="">
                        <img class="img-fluid w-25 h-100 m-2" src="img/insta/2.jpg" alt="">
                        <img class="img-fluid w-25 h-100 m-2" src="img/insta/3.jpg" alt="">
                        <img class="img-fluid w-25 h-100 m-2" src="img/insta/4.jpg" alt="">
                        <img class="img-fluid w-25 h-100 m-2" src="img/insta/5.jpg" alt="">
                    </div>
                </div>
            </div>
            <div class="copyright mt-5">
                <div class="row container mx-auto">
                    <div class="col-lg-3 col-md-6 col-12 mb-4">
                        <img src="img/payment.png" alt="">
                    </div>
                    <div class="col-lg-4 col-md-6 col-12 text-nowrap mb-2">
                        <p>Copyright ©2021 All Rights Reserved</p>
                    </div>
                    <div class="col-lg-4 col-md-6 col-12">
                        <a href="#"><i class="fab fa-facebook-f"></i></a>
                        <a href="#"><i class="fab fa-twitter"></i></a>
                        <a href="#"><i class="fab fa-instagram"></i></a>
                        <a href="#"><i class="fab fa-youtube"></i></a>
                    </div>
                </div>
            </div>
        </footer>







        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js"
                integrity="sha384-SR1sx49pcuLnqZUnnPwx6FCym0wLsk5JZuNx2bPPENzswTNFaQU1RDvt3wT4gWFG"
        crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.min.js"
                integrity="sha384-j0CNLUeiqtyaRmlzUHCPZ+Gy5fQu0dQ6eZ/xAww941Ai1SxSY+0EQqNXNE6DZiVc"
        crossorigin="anonymous"></script>
    </body>

</html>
