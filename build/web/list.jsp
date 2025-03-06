<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="./css/header.css">
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
                    <li><a href="home1" class="active">All</a></li>
                </ul>
            </div>
            
        </div>
    </body>

</html>