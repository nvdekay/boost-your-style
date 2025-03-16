<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .container {
            max-width: 500px;
            margin-top: 50px;
        }
        .card {
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        }
    </style>
</head>
<body>

<div class="container">
    <div class="card p-4">
        <h3 class="text-center mb-4">Đăng ký tài khoản</h3>
        <form action="user-register" method="POST">
            <!-- Nhập Tên Đăng Nhập -->
            <div class="mb-3">
                <label for="user" class="form-label">Tên đăng nhập(Email)</label>
                <input type="text" class="form-control" id="user" name="user" placeholder="Nhập tên đăng nhập" required>
            </div>

            <!-- Nhập Mật Khẩu -->
            <div class="mb-3">
                <label for="pass" class="form-label">Mật khẩu</label>
                <input type="password" class="form-control" id="pass" name="pass" placeholder="Nhập mật khẩu" required>
            </div>
            
            <!-- Nhập Lại Mật Khẩu -->
            <div class="mb-3">
                <label for="repass" class="form-label">Confirm Mật khẩu</label>
                <input type="password" class="form-control" id="repass" name="repass" placeholder="Nhập lại mật khẩu" required>
            </div>

            <!-- Nhập Địa Chỉ -->
            <div class="mb-3">
                <label for="address" class="form-label">Địa chỉ</label>
                <input type="text" class="form-control" id="address" name="address" placeholder="Nhập địa chỉ">
            </div>

            <!-- Nhập Số Điện Thoại -->
            <div class="mb-3">
                <label for="phoneNumber" class="form-label">Số điện thoại</label>
                <input type="tel" class="form-control" id="phoneNumber" name="phoneNumber" placeholder="Nhập số điện thoại" required>
            </div>

            <!-- Nút Đăng Ký -->
            <button type="submit" class="btn btn-primary w-100">Đăng ký</button>
        </form>
    </div>
</div>

</body>
</html>
