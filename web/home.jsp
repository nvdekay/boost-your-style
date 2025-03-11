<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>Home Page</title>
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
                integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
                crossorigin="anonymous">
            <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" />
            <link rel="stylesheet" href="./css/home.css">
        </head>

        <body>
            <%@include file="header.jsp" %>

                <section id="home">
                    <div class="container">
                        <h5>NEW ARRIVALS</h5>
                        <h1><span>Best Price</span> This Year</h1>
                    </div>
                </section>

                <!-- Logo brand -->
                <section id="brand" class="container">
                    <div class="row m-0 py-5">
                        <img class="img-fluid col-lg-2 col-md-4 col-6" src="img/brand/1.png" alt="">
                        <img class="img-fluid col-lg-2 col-md-4 col-6" src="img/brand/2.png" alt="">
                        <img class="img-fluid col-lg-2 col-md-4 col-6" src="img/brand/3.png" alt="">
                        <img class="img-fluid col-lg-2 col-md-4 col-6" src="img/brand/4.png" alt="">
                        <img class="img-fluid col-lg-2 col-md-4 col-6" src="img/brand/5.png" alt="">
                        <img class="img-fluid col-lg-2 col-md-4 col-6" src="img/brand/6.png" alt="">
                    </div>
                </section>

                <!--Top 3 Newest Clothes -->
                <section id="clothes" class="my-5">
                    <c:set var="news" value="${requestScope.news}" />
                    <c:if test="${news != null}">
                        <div class="container text-center mt-5 py-5">
                            <h3>Newest Clothes</h3>
                            <hr class="mx-auto">
                        </div>
                        <div class="row mx-auto container-fluid">
                            <c:forEach items="${news}" var="p">
                                <div class="product text-center col-lg-4 col-md-4 col-12">
                                    <img class="img-fluid mb-3 w-100" src="${p.image}" alt="">
                                    <div class="star">
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                    </div>
                                    <h5 class="p-name">${p.name}</h5>
                                    <h4 class="p-price">$${p.price}</h4>
                                    <button class="buy-btn">Buy Now</button>
                                </div>
                            </c:forEach>
                        </div>
                    </c:if>
                </section>

                <!-- Top 3 Oldest Clothes -->
                <section id="shoes" class="my-5 pb-5">
                    <c:set var="olds" value="${requestScope.olds}" />
                    <c:if test="${olds != null}">
                        <div class="container text-center mt-5 py-5">
                            <h3>Oldest Clothes</h3>
                            <hr class="mx-auto">
                        </div>
                        <div class="row mx-auto container-fluid">
                            <c:forEach items="${olds}" var="p">
                                <div class="product text-center col-lg-4 col-md-4 col-12">
                                    <img class="img-fluid mb-3" src="${p.image}" alt="">
                                    <div class="star">
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                    </div>
                                    <h5 class="p-name">${p.name}</h5>
                                    <h4 class="p-price">$${p.price}</h4>
                                    <button class="buy-btn">Buy Now</button>
                                </div>
                            </c:forEach>
                        </div>
                    </c:if>
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
                    </div>
                </section>

                <%@include file="footer.jsp" %>

                    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js"
                        integrity="sha384-SR1sx49pcuLnqZUnnPwx6FCym0wLsk5JZuNx2bPPENzswTNFaQU1RDvt3wT4gWFG"
                        crossorigin="anonymous"></script>
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.min.js"
                        integrity="sha384-j0CNLUeiqtyaRmlzUHCPZ+Gy5fQu0dQ6eZ/xAww941Ai1SxSY+0EQqNXNE6DZiVc"
                        crossorigin="anonymous"></script>
        </body>

        </html>