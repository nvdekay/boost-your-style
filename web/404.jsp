<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Không thể thực hiện hành động</title>
        <style>
            /* Reset mặc định */
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: 'Arial', sans-serif;
            }

            body {
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
                background-color: #f8f8f8;
                text-align: center;
            }

            /* Khung chứa nội dung */
            .container {
                max-width: 500px;
                padding: 40px;
                background: white;
                border-radius: 10px;
                box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            }

            /* Tiêu đề chính */
            h1 {
                font-size: 72px;
                color: #ff4a4a;
                margin-bottom: 10px;
            }

            /* Nội dung mô tả */
            p {
                font-size: 18px;
                color: #555;
                margin-bottom: 20px;
            }

            /* Nút quay về trang chủ */
            a {
                display: inline-block;
                padding: 12px 24px;
                font-size: 16px;
                color: white;
                background: #007bff;
                text-decoration: none;
                border-radius: 5px;
                transition: 0.3s;
            }

            a:hover {
                background: #0056b3;
            }
        </style>
    </head>
    <body>
        <h1>${message}</h1>
        <a href="home">Quay về trang chủ</a>
    </body>
</html>
