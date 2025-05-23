<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
              crossorigin="anonymous">
        <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" />
        <link rel="stylesheet" href="./css/header.css">
        <link rel="stylesheet" href="./css/list.css">
        <title>List</title>
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
        <div class="wrapper">

            <div class="top-nav">
                <form action="home1" class="d-flex" method="get">
                    <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search"
                           name="key">
                    <button class="btn btn-outline-dark" type="submit" style="margin-left: 10px;">Search</button>
                </form>
            </div>

            <div id="menu_tab">
                <c:set var="cat" value="${requestScope.data}" />
                <c:set var="cid" value="${requestScope.cid}" />
                <ul class="menu">
                    <li><a class="${cid == 0 ? " active" : "" }" href="home1?cid=${0}">All</a></li>
                        <c:forEach items="${cat}" var="c">
                        <li><a class="${c.id == cid ? " active" : "" }" href="home1?cid=${c.id}">${c.name}</a></li>
                        </c:forEach>
                </ul>
            </div>


            <div id="content">
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

                <div id="tab2">
                    <c:set var="list" value="${requestScope.products}" />
                    <c:if test="${list != null}">
                        <c:forEach items="${cat}" var="c">
                            <h4>Có (${list.size()} sản phẩm)</h4>
                        </c:forEach>
                        <ul class="item">
                            <c:forEach items="${list}" var="p">
                                <li>
                                    <a href="#">
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
            </div>
        </div>
    </body>

</html>