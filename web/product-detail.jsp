<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Product Detail</title>
        <!-- Bootstrap 5 -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
              crossorigin="anonymous">
        <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" />
        <link rel="stylesheet" href="./css/home.css">
        <style>
            .product-img {
                max-width: 100%;
                height: auto;
                border-radius: 10px;
            }
            .product-card {
                max-width: 900px;
                margin: auto;
            }
        </style>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <div class="container my-5" style="margin-top: 150px !important;">
            <div class="card shadow product-card">
                <div class="row g-0">
                    <div class="col-md-5">
                        <img src="${product.image}" class="img-fluid product-img" alt="${product.name}">
                    </div>
                    <div class="col-md-7">
                        <div class="card-body">
                            <h2 class="card-title fw-bold">${product.name}</h2>
                            <p class="text-muted">Category: 
                                <span class="badge bg-primary" style="color : white;">${product.category.name}</span>
                            </p>
                            <h4 class="text-danger">$${String.format("%.2f", product.price)}</h4>
                            <p><strong>Release date:</strong> ${product.releaseDate}</p>

                            <c:choose>
                                <c:when test="${product.quantity > 0}">
                                    <p class="text-success"><strong>Quantity:</strong> ${product.quantity}</p>
                                </c:when>
                                <c:otherwise>
                                    <p class="text-danger"><strong>Out of stock</strong></p>
                                </c:otherwise>
                            </c:choose>

                            <p class="mt-3">${product.describe}</p>

                            <a href="add-to-cart?productId=${product.id}" class="btn btn-primary btn-lg mt-3">
                                <i class="bi bi-cart-plus"></i> Add to cart
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="mt-5">
                <h3 class="text-center mb-4">Related products</h3>
                <div class="row">
                    <c:forEach var="p" items="${productsByCategory}">
                        <c:if test="${p.id ne product.id}"> 
                            <div class="col-md-3 mb-4">
                                <div class="card h-100 shadow-sm">
                                    <img src="${p.image}" class="card-img-top related-products" alt="${p.name}">
                                    <div class="card-body text-center">
                                        <h5 class="card-title">${p.name}</h5>
                                        <p class="text-danger fw-bold">$${String.format("%.2f", p.price)}</p>
                                        <a href="product-detail?productId=${p.id}" class="btn btn-outline-primary btn-sm">Detail</a>
                                    </div>
                                </div>
                            </div>
                        </c:if>
                    </c:forEach>
                </div>
            </div>                   
        </div>
        <%@include file="footer.jsp" %>                        
        <!-- Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
