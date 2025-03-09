<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>Shop</title>
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
                integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
                crossorigin="anonymous">
            <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" />
            <link rel="stylesheet" href="./css/product.css">
        </head>

        <body>
            <%@include file="header.jsp" %>


                <section id="watches" class="my-5 py-5">
                    <div class="container mt-5 py-5">
                        <h3>Best Watches</h3>
                        <hr>
                    </div>
                    <div class="row mx-auto container">
                        <div class="product text-center col-lg-3 col-md-4 col-12">
                            <img onclick="window.location.href='sproduct.jsp';" class="img-fluid mb-3"
                                src="img/watches/1.jpg" alt="">
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


                        <nav aria-label="Page navigation example">
                            <ul class="pagination">
                                <li class="page-item">
                                    <a class="page-link" href="#" aria-label="Previous">
                                        <span aria-hidden="true">&laquo;</span>
                                    </a>
                                </li>
                                <li class="page-item"><a class="page-link" href="#">1</a></li>
                                <li class="page-item"><a class="page-link" href="#">2</a></li>
                                <li class="page-item"><a class="page-link" href="#">3</a></li>
                                <li class="page-item">
                                    <a class="page-link" href="#" aria-label="Next">
                                        <span aria-hidden="true">&raquo;</span>
                                    </a>
                                </li>
                            </ul>
                        </nav>
                    </div>
                </section>


                <%@include file="footer.jsp" %>
        </body>

        </html>