<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Dashboard</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" />
        <link rel="stylesheet" href="./css/home.css">
    </head>
    <body>
        <%@include file="admin_header.jsp" %>
        <div class="container mt-5" style="margin-top: 200px !important; ">
            <h2 class="text-center">Thống kê doanh thu</h2>
            <div class="row mt-4">
                <div class="col-md-4">
                    <div class="card bg-primary text-white p-3">
                        <h4>Tổng số đơn hàng</h4>
                        <h2>${totalOrders}</h2>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card bg-success text-white p-3">
                        <h4>Tổng doanh thu</h4>
                        <h2>${totalRevenue} VND</h2>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card bg-warning text-dark p-3">
                        <h4>Sản phẩm đã bán</h4>
                        <h2>${totalProductsSold}</h2>
                    </div>
                </div>
                <div class="col-md-6 mt-3">
                    <div class="card bg-danger text-white p-3">
                        <h4>Đơn hàng lớn nhất</h4>
                        <h2>${maxOrderValue} VND</h2>
                    </div>
                </div>
                <div class="col-md-6 mt-3">
                    <div class="card bg-secondary text-white p-3">
                        <h4>Đơn hàng nhỏ nhất</h4>
                        <h2>${minOrderValue} VND</h2>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
