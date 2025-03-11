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
            <link rel="stylesheet" href="./css/header.css">
            <link rel="stylesheet" href="./css/list.css">
            <script>
                function setCheck(obj) {
                    var fries = document.getElementsByName('cidd');
                    if ((obj.id == 'c0') && (fries[0].checked == true)) {
                        // Uncheck all other checkboxes if 'All' is checked
                        for (var i = 1; i < fries.length; i++) {
                            fries[i].checked = false;
                        }
                    } else {
                        // Uncheck 'All' checkbox if any other checkbox is checked
                        for (var i = 0; i < fries.length; i++) {
                            if (fries[i].checked == true) {
                                fries[0].checked = false;
                                break;
                            }
                        }
                    }
                    // Submit the form after updating checkbox states
                    document.getElementById('f1').submit();
                }
            </script>
        </head>


        <body>
            <%@include file="header.jsp" %>

                <section id="products" class="my-5 py-5">
                    <div id="tab1">
                        <!-- Ten hang -->
                        <c:set var="chid" value="${requestScope.chid}" />
                        <h5 style="color: chocolate;">TEN HANG</h5>
                        <hr style="border-top: 1px solid chocolate;" />
                        <form action="home1" id="f1">
                            <input type="checkbox" id="c0" name="cidd" ${chid[0]? "checked" : "" } value="${0}"
                                onclick="setCheck(this)" />All<br />
                            <c:forEach begin="0" end="${cat.size() - 1}" var="i">
                                <input type="checkbox" id="cm" name="cidd" ${cat.get(i).getId()==cid? "checked" : "" }
                                    value="${cat.get(i).getId()}" ${chid[i+1]? "checked" : "" }
                                    onclick="setCheck(this)" />${cat.get(i).getName()}<br />
                            </c:forEach>
                        </form>

                        <!-- Muc gia -->
                        <h5>MUC GIA</h5>
                        <hr style="border-top: 1px solid chocolate;" />
                        <c:set var="pp" value="${requestScope.pp}" />
                        <c:set var="pb" value="${requestScope.pb}" />
                        <form action="home1" id="f2">
                            <input type="checkbox" id="g0" name="price" ${pb[0]? "checked" : "" } value="0"
                                onclick="setCheck1(this)" />All<br />
                            <c:forEach begin="0" end="${3}" var="i">
                                <input type="checkbox" id="g1" name="price" ${pb[i+1]? "checked" : "" } value="${(i+1)}"
                                    onclick="setCheck(this)" />${pp[i]}<br />
                            </c:forEach>
                        </form>
                    </div>
                    <div class="container mt-5 py-5" id="tab2">
                        <h2 class="font-weight-bold">Best Watches</h2>
                        <hr>
                        <c:set var="list" value="${requestScope.products}" />
                        <c:if test="${list != null}">
                            <h4>Có (${list.size()} sản phẩm)</h4>
                            <ul class="item">
                                <c:forEach items="${list}" var="p">
                                    <li>
                                        <a href="sproduct.jsp?id=${p.id}">
                                            <img src="${p.image}" width="100px" height="100px" />
                                            <p>${(p.name)}</p>
                                            <p>Gia goc: <span class="old">${p.price}</span>VND</p>
                                            <p>Sale: <span class="new">${p.price}</span>VND</p>
                                        </a>
                                    </li>
                                </c:forEach>
                            </ul>
                            <hr />
                        </c:if>
                    </div>



                    <!--             
    <div class="row mx-auto container">
            <c:set var="list" value="${requestScope.products}" />
            <c:if test="${list != null}">
                <div class="product text-center col-lg-3 col-md-4 col-12">
                <c:forEach items="${list}" var="p">
                    <img onclick="window.location.href = 'sproduct.jsp';" class="img-fluid mb-3"
                         src="${p.image}" alt="">
                    <div class="star">
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                    </div>
                    <h5 class="p-name">${p.name}</h5>
                    <h4 class="p-price">$${p.price}</h4>
                    <!-- <button class="buy-btn">Buy Now</button> -->
                    <!-- </c:forEach>
                    </div>
            </c:if>
        </div> -->

                    <!-- Pagination -->
                    <nav aria-label="..." class="container">
                        <ul class="pagination">
                            <li class="page-item disabled">
                                <span class="page-link">Previous</span>
                            </li>
                            <li class="page-item active"><a class="page-link" href="#">1</a></li>
                            <li class="page-item" aria-current="page">
                                <span class="page-link">2</span>
                            </li>
                            <li class="page-item"><a class="page-link" href="#">3</a></li>
                            <li class="page-item">
                                <a class="page-link" href="#">Next</a>
                            </li>
                        </ul>
                    </nav>


                </section>

                <%@include file="footer.jsp" %>
        </body>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js"
            integrity="sha384-SR1sx49pcuLnqZUnnPwx6FCym0wLsk5JZuNx2bPPENzswTNFaQU1RDvt3wT4gWFG"
            crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.min.js"
            integrity="sha384-j0CNLUeiqtyaRmlzUHCPZ+Gy5fQu0dQ6eZ/xAww941Ai1SxSY+0EQqNXNE6DZiVc"
            crossorigin="anonymous"></script>

        </html>