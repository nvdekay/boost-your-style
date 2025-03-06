<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="./css/header.css">
        <link rel="stylesheet" href="./css/list.css">
        <title>JSP Page</title>
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
                     
                </div>
            </div>

        </div>
    </body>

</html>