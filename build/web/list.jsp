<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="./css/header.css">
        <link rel="stylesheet" href="./css/list.css">
        <title>JSP Page</title>
        <script>
            function setCheck(obj) {
                var fries = document.getElementsByName('cidd');
                if ((obj.id == 'c0') && (fries[0].checked == true)) {
                    for (var i = 1; i < fries.length; i++) {
                        fries[i].checked = false;
                    }
                } else {
                    for (var i = 0; i < fries.length; i++) {
                        if (fries[i].checked == true) {
                            fries[0].checked = false;
                            break;
                        }
                    }
                }
                document.getElementById('f1').submit();
            }
        </script>
    </head>

    <body>
        <div class="wrapper">

            <div class="top-nav">
                <form action="home1" class="d-flex" method="get">
                    <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search" name="key">
                    <button class="btn btn-outline-dark" type="submit" style="margin-left: 10px;">Search</button>
                </form>
            </div>

            <div id="menu_tab">
                <c:set var="cat" value="${requestScope.data}" />
                <c:set var="cid" value="${requestScope.cid}" />
                <ul class="menu">
                    <li><a href="home1" class="${cid == 0 ? " active" : "" }" href="home1?cid=${0}">All</a></li>
                        <c:forEach items="${cat}" var="c">
                        <li><a href="home1?cid=${c.id}" class="${cid == c.id ? " active" : "" }">${c.name}</a></li>
                        </c:forEach>
                </ul>
            </div>


            <div id="content">
                <div id="tab1">
                    <!-- Ten hang -->
                    <c:set var="chid" value="${requestScope.chid}" />
                    <h5 style="color: chocolate;">TEN HANG</h5>
                    <hr style="border-top: 1px solid chocolate;"/>
                    <form action="home1" id="f1">
                        <input type="checkbox" id="c0" name="cidd" ${chid[0]? "checked" : "" } value="$0" onclick="setCheck(this)"/>All<br/>
                        <c:forEach begin="0" end="${cat.size() - 1}" var="i">
                            <input type="checkbox" id="cm" name="cidd" ${cat.get(i).getId() == cid? "checked" : "" } value="${cat.get(i).getId()}" ${chid[i+1]? "checked:" : "" } onclick="setCheck(this)"/>${cat.get(i).getName()}<br/>
                        </c:forEach>
                    </form>

                    <!-- Muc gia -->
                    <h5>MUC GIA</h5>
                    <hr style="border-top: 1px solid chocolate;"/>
                    <c:set var="pp" value="${requestScope.pp}" />
                    <c:set var="pb" value="${requestScope.pb}" />
                    <form action="home1" id="f2">
                        <input type="checkbox" id="g0" name="price" ${pb[0]? "checked" : "" } value="0" onclick="setCheck1(this)"/>All<br/>
                        <c:forEach begin="0" end="${3}" var="i">
                            <input type="checkbox" id="g1" name="price" ${pb[i+1]? "checked" : "" } value="${(i+1)}" onclick="setCheck1(this)"/>${pp[i]}<br/>
                        </c:forEach>
                    </form>
                </div>

                <div id="tab2">
                    <c:set var="news" value="${requestScope.news}" />
                    <c:if test="${news != null}">
                        <h4>Dien thoai moi</h4>
                        <ul class="item">
                            <c:forEach items="${news}" var="p">
                                <li>
                                    <a href="#">
                                        <img src="${p.image}" width="100px" height="100px"/>
                                        <p>${p.name}</p>
                                        <p>Gia goc: <span class="old">${p.price}</span>VND</p>
                                        <p>Sale: <span class="new">${p.price}</span>VND</p>
                                    </a>
                                </li>
                            </c:forEach>
                        </ul>
                        <hr/>
                    </c:if>

                    <c:set var="olds" value="${requestScope.olds}" />
                    <c:if test="${olds != null}">
                        <h4>Dien thoai cu</h4>
                        <ul class="item">
                            <c:forEach items="${olds}" var="p">
                                <li>
                                    <a href="#">
                                        <img src="${p.image}" width="100px" height="100px"/>
                                        <p>${p.name}</p>
                                        <p>Gia goc: <span class="old">${p.price}</span>VND</p>
                                        <p>Sale: <span class="new">${p.price}</span>VND</p>
                                    </a>
                                </li>
                            </c:forEach>
                        </ul>
                        <hr/>
                    </c:if>
                </div>
            </div>
        </div>
    </body>

</html>