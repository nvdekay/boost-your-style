<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
       if (request.getSession().getAttribute("role_admin") == null) {
           response.sendRedirect("home");
       }
%>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Manager Product</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
            rel="stylesheet"
            />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
              crossorigin="anonymous">
        <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" />
        <link rel="stylesheet" href="./css/home.css">
        <style>
            .body-container{
                margin-top: 80px;
                margin-left: 15px;
            }

            .toggle-container {
                display: flex;
                align-items: center;
                gap: 10px;
                font-family: Arial, sans-serif;
            }

            .toggle-label {
                font-size: 16px;
            }

            .toggle-switch {
                position: relative;
                width: 50px;
                height: 20px;
            }

            .toggle-switch input {
                display: none;
            }

            .slider {
                position: absolute;
                cursor: pointer;
                top: 0;
                left: 0;
                right: 0;
                bottom: 0;
                background-color: #ccc;
                transition: 0.4s;
                border-radius: 30px;
            }

            .slider::before {
                position: absolute;
                content: "";
                height: 15px;
                width: 15px;
                left: 3px;
                bottom: 3px;
                background-color: white;
                transition: 0.4s;
                border-radius: 50%;
            }

            input:checked + .slider {
                background-color: #4CAF50;
            }

            input:checked + .slider::before {
                transform: translateX(30px);
            }

            /* Hiển thị trạng thái */
            .status {
                font-weight: bold;
                color: #333;
            }

            input:checked ~ .status::after {
                content: "True";
                color: #4CAF50;
            }

            input:not(:checked) ~ .status::after {
                content: "Active";
                color: #007bff;
            }
        </style>
        <script>
            function back() {
                window.location.href = "home";
            }
            function doDelete(id)
            {
                var c = confirm("Are you sure?");
                if (c)
                {
                    window.location.href = "delete?pid=" + id;
                }
            }

            function updateStatus(id, checked) {
                window.location.href = 'EditAccount?id=' + id + "&active=" + checked;
            }
        </script>

    <body>
        <%@include file="admin_header.jsp" %>
        <div class="body-container">
            <div class="table-wrapper">
                <div class="table-title">
                    <div class="row">
                        <h2>Manage Account</b></h2>   
                    </div>
                </div>
                <table class="table table-striped table-hover">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>User</th>
                            <th>Email</th>
                            <th>Active</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${accounts}" var="p">
                            <tr>
                                <td>${p.id}</td>
                                <td>${p.username}</td>
                                <td>${p.email}</td>
                                <td>

                                    <c:choose>
                                        <c:when test="${!p.active}">
                                            <p style="color: red">Blocked</p>
                                        </c:when>    
                                        <c:otherwise>
                                            <p style="color: green">Active</p>
                                        </c:otherwise>
                                    </c:choose>
                                    <div class="toggle-container">
                                        <label class="toggle-switch">
                                            <input type="checkbox" ${p.active ? "checked=checked" : ""} onchange="updateStatus(${p.id}, this.checked)">
                                            <span class="slider"></span>
                                        </label>
                                        <span class="status"></span>
                                    </div>        
                                </td>
                            </tr>
                        </c:forEach>
                        <tr>
                            <td colspan="4">
                                <!-- Nút mở popup -->
                                <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addUserModal">Thêm User</button>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <!-- Modal Popup Form -->
                <div class="modal fade" id="addUserModal" tabindex="-1" aria-labelledby="addUserModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="addUserModalLabel">Thêm User</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <form action="managerAccount" method="POST">
                                    <div class="mb-3">
                                        <label>Email (Sử dụng làm username)</label>
                                        <input type="email" class="form-control" name="email" required>
                                    </div>
                                    <div class="mb-3">
                                        <label>Số điện thoại</label>
                                        <input type="text" class="form-control" name="phoneNumber" required>
                                    </div>
                                    <div class="mb-3">
                                        <label>Địa chỉ</label>
                                        <input type="text" class="form-control" name="address" required>
                                    </div>
                                    <button type="submit" class="btn btn-success">Thêm</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="clearfix"> 
                    <ul class="pagination">
                        <li class="page-item"><a class="page-link" href="managerAccount?page=${page-1}">Previous</a></li>
                            <c:forEach begin="1" end="${totalPage}" var="i">
                            <li class="page-item ${i == page?"active":""}"><a class="page-link" href="managerAccount?page=${i}">${i}</a></li>
                            </c:forEach>
                        <li class="page-item"><a class="page-link" href="managerAccount?page=${page+1}">Next</a></li>
                    </ul>
                </div>
            </div>
            <a href="#">
                <button type="button" class="btn btn-primary" onclick="back()">Back to home</button>

                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
                </body>
                </html>
