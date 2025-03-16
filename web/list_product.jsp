
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
        <title>Fashion Clothes</title>
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
        <!-- Header-->

        <!-- Section-->
        <section class="py-5">
            <div class="container px-4 px-lg-5 mt-5">
                <div class="row">
                    <div class="col-md-3 mb-5">
                        <h3>List Categories</h3>
                        <ul class="list-group category_block ">
                            <c:forEach items="${listCategories}" var="C">
                                <li class="list-group-item text-white ${tag == C.id? "active":""}"><a class="x-vip" href="product-list?categoryId=${C.id}&keyword=${key}"><h5>${C.name}</h5></a></li>
                                        </c:forEach>
                        </ul>
                    </div>
                    <div class="col-md-9">
                        <h3>List Products</h3>
                        <c:choose>
                            <c:when test="${listProducts==null || listProducts.size()==0}">
                                Not founds
                            </c:when>
                            <c:otherwise>
                                <nav aria-label="Page navigation example" class="d-flex justify-content-center">
                                    <ul class="pagination">
                                        <li class="page-item"><a class="page-link" href="product-list?page=${page-1}&keyword=${key}&categoryId=${categoryId}">Previous</a></li>
                                            <c:forEach begin="1" end="${totalPage}" var="i">
                                            <li class="page-item ${i == page?"active":""}"><a class="page-link" href="product-list?page=${i}&keyword=${key}&categoryId=${categoryId}">${i}</a></li>
                                            </c:forEach>
                                        <li class="page-item"><a class="page-link" href="product-list?page=${page+1}&keyword=${key}&categoryId=${categoryId}">Next</a></li>
                                    </ul>
                                </nav>
                            </c:otherwise>
                        </c:choose>

                        <div
                            class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 justify-content-center"
                            >
                            <c:forEach items="${listProducts}" var="P">
                                <div class="col mb-5">
                                    <!--${P.id}-->
                                    <div class="card h-100 card-vip">
                                        <!-- Product image-->
                                        <a href="detail?productId=${P.id}">
                                            <img
                                                class="card-img-top"
                                                src="${P.image}"
                                                alt="..."
                                                />
                                        </a>
                                        <!-- Product details-->
                                        <div class="card-body p-4">
                                            <div class="text-center">
                                                <!-- Product name-->
                                                <h5 class="fw-bolder">${P.name}</h5>
                                                <c:choose>
                                                    <c:when test="${P.quantity > 0}">
                                                        <h5 class="fw-bolder">Quantity : ${P.quantity}</h5>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <h5 class="fw-bolder text-danger">Hết hàng</h5>
                                                    </c:otherwise>
                                                </c:choose>
                                                <a href="product-detail?productId=${P.id}">Detail</a>
                                                <!-- Product price-->
                                                ${P.price}VND
                                            </div>
                                        </div>
                                        <!-- Product actions-->
                                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                            <c:choose>
                                                <c:when test="${P.quantity > 0}">
                                                    <div class="text-center">
                                                        <a class="btn btn-outline-dark mt-auto" href="add-to-cart?productId=${P.id}"
                                                           >Add to cart</a
                                                        >
                                                    </div>
                                                </c:when>
                                            </c:choose>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <%@include file="footer.jsp" %>
    </body>
</html>
