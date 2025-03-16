<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Không thể thực hiện hành động</title>
        <style>
            /* Import font chữ đẹp hơn */
            @import url('https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap');

            /* Reset mặc định */
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: 'Inter', sans-serif;
            }

            body {
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
                background: linear-gradient(135deg, #f0f4f8, #d9e2ec);
                text-align: center;
                padding: 20px;
            }

            /* Khung chứa nội dung */
            .container {
                max-width: 450px;
                padding: 35px;
                background: #ffffff;
                border-radius: 12px;
                box-shadow: 0px 8px 20px rgba(0, 0, 0, 0.1);
                transition: all 0.3s ease-in-out;
            }

            .container:hover {
                transform: translateY(-3px);
                box-shadow: 0px 12px 25px rgba(0, 0, 0, 0.15);
            }

            /* Tiêu đề chính */
            h1 {
                font-size: 42px;
                font-weight: 600;
                color: #e63946;
                margin-bottom: 16px;
                letter-spacing: 0.5px;
            }

            /* Nội dung mô tả */
            p {
                font-size: 18px;
                color: #555;
                margin-bottom: 20px;
                line-height: 1.5;
            }

            /* Nút quay về trang chủ */
            a {
                display: inline-block;
                padding: 14px 26px;
                font-size: 18px;
                font-weight: 500;
                color: white;
                background: linear-gradient(135deg, #007bff, #0056b3);
                text-decoration: none;
                border-radius: 8px;
                transition: 0.3s ease-in-out;
                box-shadow: 0px 4px 12px rgba(0, 123, 255, 0.3);
                position: relative;
                overflow: hidden;
            }

            /* Hiệu ứng hover cho nút */
            a:hover {
                background: linear-gradient(135deg, #0056b3, #004099);
                box-shadow: 0px 6px 18px rgba(0, 91, 187, 0.4);
                transform: scale(1.05);
            }

            /* Hiệu ứng khi bấm vào nút */
            a:active {
                transform: scale(0.98);
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h1>${message}</h1>
            <a href="home">Quay về trang chủ</a>
        </div>
    </body>

</html>
