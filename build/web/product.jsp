<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>Product</title>
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
                integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
                crossorigin="anonymous">
            <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" />
            <link rel="stylesheet" href="./css/product.css">
            <!-- <link rel="stylesheet" href="./css/product1.css"> -->
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
                <section id="tab1" class="col-md-4 col-12" style="margin: 100px 20px; height: 0;">                    
                    <c:set var="chid" value="${requestScope.chid}" />
                    <h5 style="color: chocolate;">TEN HANG</h5>
                    <hr style="border-top: 1px solid chocolate;" />
                    <form action="product1" id="f1" style="margin-bottom: 5px;">
                        <input type="checkbox" id="c0" name="cidd" ${chid[0]? "checked" : "" } value="${0}"
                            onclick="setCheck(this)" /> All<br />
                        <c:forEach begin="0" end="${cat.size() - 1}" var="i">
                            <input type="checkbox" id="cm" name="cidd" ${cat.get(i).getId()==cid? "checked" : "" }
                                value="${cat.get(i).getId()}" ${chid[i+1]? "checked" : "" }
                                onclick="setCheck(this)" /> ${cat.get(i).getName()}<br />
                        </c:forEach>
                    </form>

                     
                    <h5 style="color: chocolate;">MUC GIA</h5>
                    <hr style="border-top: 1px solid chocolate;" />
                    <c:set var="pp" value="${requestScope.pp}" />
                    <c:set var="pb" value="${requestScope.pb}" />
                    <form action="product1" id="f2">
                        <input type="checkbox" id="g0" name="price" ${pb[0]? "checked" : "" } value="0"
                            onclick="setCheck1(this)" /> All<br />
                        <c:forEach begin="0" end="${3}" var="i">
                            <input type="checkbox" id="g1" name="price" ${pb[i+1]? "checked" : "" } value="${(i+1)}"
                                onclick="setCheck(this)" /> ${pp[i]}<br />
                        </c:forEach>
                    </form>
                </section>

                <section id="products" class="my-5 py-5">
                    <c:set var="list" value="${requestScope.products}" />
                    <c:if test="${list != null}">
                        <div class="container mt-5 py-5">
                            <h2 class="font-weight-bold">Best To Watch</h2>
                            <hr>
                        </div>
                        <h4 class="font-weight-bold text-center mb-5">Có ${list.size()} 
                            sản phẩm
                        </h4>
                        <div class="row mx-auto container">
                            <c:forEach items="${list}" var="p">
                                <div class="product text-center col-lg-3 col-md-4 col-12">
                                    <img onclick="window.location.href = 'sproduct.jsp?id=${p.id}';" src="${p.image}"
                                        class="img-fluid mb-3 w-100" />
                                    <div class="star">
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                    </div>
                                    <h5 class="p-name">${(p.name)}</h5>
                                    <p>Gia goc: <span class="old">$${p.price}</span></p>
                                    <h4 class="p-price mb-5 mt-3">Sale: <span class="new">$${p.price * 0.9}</span></h4>
                                </div>
                            </c:forEach>
                        </div>
                    </c:if>
                </section>

                <hr class="container">


                <!--       <div class="row mx-auto container">
        <div class="product text-center col-lg-3 col-md-4 col-12">
            <img onclick="window.location.href = 'sproduct.jsp';" class="img-fluid mb-3"
                 src="" alt="">
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
    </div> -->

                <!-- Pagination -->
                <c:set var="k" value="${requestScope.key}" />
                <c:set var="page" value="${requestScope.page}" />
                <nav class="container">
                    <ul class="pagination">
                        <c:forEach begin="${1}" end="${requestScope.numpage}" var="i">
                            <li class="page-item active"><a class="${i==page?" active":""}"
                                    href="search?page=${i}&key=${key}">${i} Okeeee</a></li>
                        </c:forEach>
                    </ul>
                </nav>

                <%@include file="footer.jsp" %>
        </body>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js"
            integrity="sha384-SR1sx49pcuLnqZUnnPwx6FCym0wLsk5JZuNx2bPPENzswTNFaQU1RDvt3wT4gWFG"
            crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.min.js"
            integrity="sha384-j0CNLUeiqtyaRmlzUHCPZ+Gy5fQu0dQ6eZ/xAww941Ai1SxSY+0EQqNXNE6DZiVc"
            crossorigin="anonymous"></script>

        </html>