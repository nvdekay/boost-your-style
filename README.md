# Boost Your Style — Ứng Dụng Thương Mại Điện Tử Thời Trang

> **PRJ301 Assignment — SE1928 | FPT University Spring 2026**
>
> Website mua sắm thời trang full-stack được xây dựng bằng Java Servlet/JSP, SQL Server và Bootstrap 4.

---

## Mục Lục

1. [Tổng Quan Dự Án](#1-tổng-quan-dự-án)
2. [Tech Stack](#2-tech-stack)
3. [Kiến Trúc Hệ Thống](#3-kiến-trúc-hệ-thống)
4. [Yêu Cầu Cài Đặt](#4-yêu-cầu-cài-đặt)
5. [Cài Đặt Database](#5-cài-đặt-database)
6. [Hướng Dẫn Chạy Dự Án](#6-hướng-dẫn-chạy-dự-án)
7. [Cấu Trúc Thư Mục](#7-cấu-trúc-thư-mục)
8. [Database Schema](#8-database-schema)
9. [Tính Năng Hệ Thống](#9-tính-năng-hệ-thống)
10. [URL Routes & Controllers](#10-url-routes--controllers)
11. [Xác Thực & Phân Quyền](#11-xác-thực--phân-quyền)
12. [Hệ Thống Giỏ Hàng](#12-hệ-thống-giỏ-hàng)
13. [Admin Panel](#13-admin-panel)
14. [Dịch Vụ Email](#14-dịch-vụ-email)
15. [Giao Diện Frontend](#15-giao-diện-frontend)
16. [Cấu Hình Hệ Thống](#16-cấu-hình-hệ-thống)
17. [Thành Viên Nhóm](#17-thành-viên-nhóm)

---

## 1. Tổng Quan Dự Án

**Boost Your Style** là ứng dụng thương mại điện tử dành cho cửa hàng thời trang, cho phép khách hàng duyệt sản phẩm (quần áo, giày dép, đồng hồ, phụ kiện), thêm vào giỏ hàng và đặt mua. Dự án được xây dựng theo mô hình **MVC (Model-View-Controller)** chuẩn của Java EE.

### Vai trò người dùng

| Vai trò | Chức năng |
|---------|-----------|
| **Guest** (Khách) | Duyệt sản phẩm, tìm kiếm theo tên, lọc theo danh mục |
| **Customer** (Khách hàng) | Đăng ký, đăng nhập, quản lý tài khoản, thêm vào giỏ hàng, đặt hàng |
| **Admin** (Quản trị viên) | Quản lý tài khoản người dùng, xem dashboard, kích hoạt/vô hiệu hoá tài khoản |

---

## 2. Tech Stack

### Backend

| Công nghệ | Phiên bản | Mục đích |
|-----------|-----------|----------|
| Java | 8+ | Ngôn ngữ lập trình chính |
| Jakarta EE Servlet | 6.0 | Xử lý HTTP request, định tuyến URL |
| JSP + JSTL | 1.2 | Template engine phía server |
| JDBC | — | Truy cập database trực tiếp qua SQL |
| Microsoft SQL Server JDBC | — | Driver kết nối SQL Server (`com.microsoft.sqlserver.jdbc.SQLServerDriver`) |
| JavaMail API | — | Gửi email qua Gmail SMTP |
| Apache Tomcat | 9+ | Application server (Servlet container) |
| Apache Ant | — | Build & deploy tự động |

### Frontend

| Công nghệ | Phiên bản | Mục đích |
|-----------|-----------|----------|
| HTML5 | — | Cấu trúc trang |
| CSS3 | — | Tùy chỉnh giao diện |
| JavaScript | ES5+ | Tương tác phía client |
| Bootstrap | 4.3.1 | Framework UI responsive |
| Font Awesome | 5.10.0 | Thư viện icon |
| Google Fonts (Poppins) | — | Font chữ chính |

### Database

| Công nghệ | Chi tiết |
|-----------|----------|
| Microsoft SQL Server | Chạy local, cổng `1433` |
| Tên database | `BoostYourStyleDB` |
| Thông tin mặc định | User: `sa` / Password: `123` |

### Công Cụ Phát Triển

| Công cụ | Mục đích |
|---------|----------|
| NetBeans IDE | IDE chính (project files đã được include) |
| Apache Ant | Build & deploy (`build.xml`) |
| SQL Server Management Studio | Quản lý database |

---

## 3. Kiến Trúc Hệ Thống

```
┌─────────────────────────────────────────────────────────┐
│                     Client (Browser)                     │
│              HTML + CSS + JS + Bootstrap                 │
└────────────────────────┬────────────────────────────────┘
                         │ HTTP Request / Response
┌────────────────────────▼────────────────────────────────┐
│              Apache Tomcat (Servlet Container)           │
│                                                         │
│  ┌──────────────┐   ┌───────────────┐   ┌───────────┐  │
│  │   Filters    │──▶│  Controllers  │──▶│   Views   │  │
│  │ LoginFilter  │   │  (Servlets)   │   │  (JSPs)   │  │
│  │ HomeFilter   │   │               │   │           │  │
│  └──────────────┘   └───────┬───────┘   └───────────┘  │
│                             │                           │
│                    ┌────────▼────────┐                  │
│                    │  Model / DAOs   │                  │
│                    │  (Business +    │                  │
│                    │  Data Access)   │                  │
│                    └────────┬────────┘                  │
└─────────────────────────────┼───────────────────────────┘
                              │ JDBC
┌─────────────────────────────▼───────────────────────────┐
│              Microsoft SQL Server (localhost:1433)        │
│                   BoostYourStyleDB                        │
└─────────────────────────────────────────────────────────┘
```

Dự án tuân theo **mô hình MVC** với phân tách rõ ràng:
- **Model** — `src/java/model/` và các lớp DAO: chứa dữ liệu và logic truy cập database
- **View** — `web/*.jsp`: các file template hiển thị giao diện cho người dùng
- **Controller** — `src/java/controller/` và các servlet theo package: xử lý request, điều phối dữ liệu

**Quản lý session:** `HttpSession` phía server
**Lưu trữ giỏ hàng:** `HttpSession` dùng `LinkedHashMap` — không lưu vào database cho đến khi checkout

---

## 4. Yêu Cầu Cài Đặt

Trước khi chạy dự án, cần cài đặt đầy đủ các công cụ sau:

- **JDK 8 trở lên** — [Tải về](https://www.oracle.com/java/technologies/downloads/)
- **Apache Tomcat 9+** — [Tải về](https://tomcat.apache.org/)
- **Microsoft SQL Server** (bản Developer hoặc Express) — [Tải về](https://www.microsoft.com/en-us/sql-server/sql-server-downloads)
- **SQL Server Management Studio (SSMS)** — Công cụ quản lý database
- **NetBeans IDE 12+** (khuyến nghị) hoặc IDE hỗ trợ Jakarta EE — [Tải về](https://netbeans.apache.org/)
- **Microsoft JDBC Driver for SQL Server** — Phải thêm vào classpath của project
- **Apache Ant** — [Tải về](https://ant.apache.org/) (đã tích hợp sẵn trong NetBeans)

---

## 5. Cài Đặt Database

### Bước 1 — Tạo database

Mở **SQL Server Management Studio**, kết nối tới SQL Server local và chạy lệnh:

```sql
CREATE DATABASE BoostYourStyleDB;
```

### Bước 2 — Chạy script tạo bảng

Thực thi file SQL tại đường dẫn:

```
database/BoostYourStyleDB.sql
```

Script này sẽ tạo toàn bộ 5 bảng: `Account`, `Categories`, `Products`, `Orders`, `OrderDetail`, kèm theo dữ liệu mẫu ban đầu.

Nếu có file query bổ sung, chạy tiếp:

```
database/querry.sql
```

### Bước 3 — Kiểm tra thông tin kết nối

Mặc định trong `DBContext.java`, thông tin kết nối database là:

```java
String url  = "jdbc:sqlserver://localhost:1433;databaseName=BoostYourStyleDB";
String user = "sa";
String pass = "123";
```

Nếu cấu hình SQL Server trên máy bạn khác, hãy chỉnh sửa file `src/java/dal/DBContext.java` cho phù hợp.

---

## 6. Hướng Dẫn Chạy Dự Án

### Clone repository

```bash
git clone https://github.com/nvdekay/boost-your-style.git
cd boost-your-style
```

### Mở trong NetBeans

1. Chọn **File → Open Project** → trỏ tới thư mục vừa clone
2. NetBeans sẽ tự nhận diện đây là Ant-based web project

### Thêm thư viện cần thiết

Đặt các file JAR sau vào thư mục `lib/` của project (hoặc cấu hình qua NetBeans Libraries):

| File JAR | Mục đích |
|----------|----------|
| `mssql-jdbc-*.jar` | Driver kết nối SQL Server |
| `javax.mail.jar` / `jakarta.mail.jar` | JavaMail — gửi email |
| `jstl-1.2.jar` | Thư viện JSTL tag |
| `servlet-api.jar` | Servlet API (đã có sẵn trong Tomcat) |

### Cấu hình Tomcat trong NetBeans

1. Vào **Tools → Servers → Add Server** → chọn Apache Tomcat
2. Trỏ tới thư mục cài đặt Tomcat
3. Đặt cổng là `8080` (hoặc cổng tuỳ ý)

### Build & Deploy

**Qua NetBeans:**
- Chuột phải vào project → **Clean and Build** → **Run**

**Qua Ant (command line):**
```bash
ant clean
ant build
ant run
```

### Truy cập ứng dụng

Mở trình duyệt và truy cập:

```
http://localhost:8080/boostyourstyle/home
```

---

## 7. Cấu Trúc Thư Mục

```
boost-your-style/
│
├── src/
│   └── java/                          # Toàn bộ source code Java backend
│       ├── model/                     # Các lớp Model (POJO — Plain Old Java Object)
│       │   ├── Account.java           # Entity tài khoản người dùng
│       │   ├── Product.java           # Entity sản phẩm
│       │   ├── Category.java          # Entity danh mục sản phẩm
│       │   └── Role.java              # Entity vai trò (Admin / User)
│       │
│       ├── dal/                       # Data Access Layer — lớp nền
│       │   ├── DBContext.java         # Quản lý kết nối database (JDBC)
│       │   ├── DAO.java               # Các thao tác dữ liệu chung
│       │   └── ProductDAO.java        # Truy vấn sản phẩm (tìm kiếm, phân trang)
│       │
│       ├── controller/                # Các HTTP Controller chính
│       │   ├── HomeServlet.java       # Trang chủ — sản phẩm mới & cũ nhất
│       │   ├── LoginServlet.java      # Đăng nhập + cookie "ghi nhớ"
│       │   ├── LogoutServlet.java     # Đăng xuất, huỷ session
│       │   ├── UserRegisterController.java  # Đăng ký tài khoản mới
│       │   ├── resetPasswordController.java # Đổi mật khẩu
│       │   ├── SearchServlet.java     # Tìm kiếm sản phẩm
│       │   ├── Home1Servlet.java      # Trang chủ phiên bản cũ (legacy)
│       │   ├── PagingServlet.java     # Hỗ trợ phân trang
│       │   ├── Product1Servlet.java   # Danh sách sản phẩm (legacy)
│       │   └── ProductServlet.java    # Chi tiết sản phẩm (legacy)
│       │
│       ├── productlist/               # Logic duyệt & tìm kiếm sản phẩm
│       │   ├── ProductDBContext.java  # Các thao tác DB mở rộng cho sản phẩm
│       │   ├── CategoryDAO.java       # CRUD danh mục sản phẩm
│       │   ├── ProductDetailController.java   # Trang chi tiết 1 sản phẩm
│       │   ├── SearchController.java  # Tìm kiếm + lọc danh mục + phân trang
│       │   └── SearchByCategoryController.java # Duyệt theo danh mục
│       │
│       ├── checkout/                  # Giỏ hàng & xử lý đơn hàng
│       │   ├── Cart.java              # Item giỏ hàng (sản phẩm + số lượng)
│       │   ├── Order.java             # Entity đơn hàng
│       │   ├── OrderDetail.java       # Entity dòng sản phẩm trong đơn hàng
│       │   ├── OrderDAO.java          # Tạo & lấy đơn hàng từ DB
│       │   ├── OrderDetailDAO.java    # Lưu & lấy chi tiết đơn hàng
│       │   ├── ProductDAO.java        # Quản lý tồn kho khi checkout
│       │   ├── AddToCartServlet.java  # Thêm sản phẩm vào giỏ (session)
│       │   ├── CartController.java    # Xem giỏ hàng & tính tổng tiền
│       │   ├── UpdateCartQuantityController.java # Cập nhật số lượng
│       │   ├── DeleteCartController.java  # Xoá sản phẩm khỏi giỏ
│       │   ├── CheckOutController.java    # Đặt hàng & xoá giỏ
│       │   ├── ThankController.java       # Trang xác nhận đặt hàng thành công
│       │   └── BaseRequiredAuthenController.java # Base class yêu cầu đăng nhập
│       │
│       ├── customermanagement/        # Admin: quản lý khách hàng
│       │   ├── AcountDAO.java         # CRUD tài khoản + phân trang
│       │   ├── ManagerAccountController.java # Danh sách & quản lý khách hàng
│       │   └── EditAccountController.java    # Chỉnh sửa tài khoản khách hàng
│       │
│       ├── dashboard/                 # Admin dashboard
│       │   ├── DashboardDAO.java      # Truy vấn thống kê cho dashboard
│       │   └── DashboardServlet.java  # Controller trang admin dashboard
│       │
│       ├── forgotpassword/            # Luồng khôi phục mật khẩu
│       │   ├── ForgotPasswordServlet.java  # Xử lý quên mật khẩu
│       │   ├── SendMailHelper.java    # Gửi email qua Gmail SMTP
│       │   └── GoogleInfomation.java  # Lưu thông tin đăng nhập Gmail
│       │
│       └── filter/                    # Servlet Filters
│           ├── LoginFilter.java       # Kiểm tra xác thực trước khi vào trang
│           └── HomeFilter.java        # Filter cho trang chủ
│
├── web/                               # Frontend (JSP, CSS, JS, hình ảnh)
│   ├── home.jsp                       # Giao diện trang chủ
│   ├── header.jsp                     # Thanh điều hướng dùng chung
│   ├── footer.jsp                     # Footer dùng chung
│   ├── login.jsp                      # Form đăng nhập
│   ├── signup.jsp                     # Form đăng ký tài khoản
│   ├── product-detail.jsp             # Trang chi tiết sản phẩm
│   ├── list_product.jsp               # Danh sách / kết quả tìm kiếm sản phẩm
│   ├── cart.jsp                       # Giỏ hàng
│   ├── checkout.jsp                   # Trang thanh toán
│   ├── thanks.jsp                     # Trang xác nhận đặt hàng thành công
│   ├── forgot-password.jsp            # Form quên mật khẩu
│   ├── change-newpassword.jsp         # Form đổi mật khẩu
│   ├── ManagerCustomer.jsp            # Admin: quản lý khách hàng
│   ├── dashboard.jsp                  # Admin: trang dashboard
│   ├── 404.jsp                        # Trang lỗi / không tìm thấy
│   ├── css/                           # Stylesheet riêng cho từng trang
│   │   ├── header.css
│   │   ├── footer.css
│   │   ├── home.css
│   │   ├── login.css
│   │   ├── signup.css
│   │   ├── product.css
│   │   └── cart.css
│   ├── img/                           # Tài nguyên hình ảnh tĩnh
│   │   ├── brand/                     # Logo các thương hiệu
│   │   ├── clothes/                   # Ảnh sản phẩm quần áo
│   │   ├── watches/                   # Ảnh sản phẩm đồng hồ
│   │   ├── shoes/                     # Ảnh sản phẩm giày dép
│   │   ├── featured/                  # Ảnh banner/featured
│   │   └── cart/                      # Ảnh liên quan đến giỏ hàng
│   └── WEB-INF/
│       ├── web.xml                    # Cấu hình Servlet & Filter mappings
│       └── context.xml                # Cấu hình deployment context của Tomcat
│
├── database/
│   ├── BoostYourStyleDB.sql           # Schema đầy đủ + dữ liệu mẫu
│   └── querry.sql                     # Các câu truy vấn SQL bổ sung
│
├── build.xml                          # Script build Apache Ant
├── nbproject/                         # Metadata dự án NetBeans
│   ├── project.xml
│   ├── project.properties
│   └── build-impl.xml
└── README.md
```

---

## 8. Database Schema

### Sơ đồ quan hệ giữa các bảng

```
Account (1) ────── (N) Orders (1) ────── (N) OrderDetail
                                              (lưu snapshot sản phẩm lúc đặt)

Categories (1) ─── (N) Products
```

### Chi tiết từng bảng

#### Bảng `Account` — Tài khoản người dùng

| Cột | Kiểu dữ liệu | Ràng buộc | Mô tả |
|-----|-------------|-----------|-------|
| `ID` | `INT` | PK, Identity | ID tự tăng |
| `Username` | `NVARCHAR(100)` | NOT NULL | Tên hiển thị / tên đăng nhập |
| `Email` | `NVARCHAR(100)` | NOT NULL | Địa chỉ email |
| `Address` | `NVARCHAR(100)` | NOT NULL | Địa chỉ giao hàng |
| `PhoneNumber` | `VARCHAR(20)` | NOT NULL | Số điện thoại liên hệ |
| `Password` | `VARCHAR(50)` | NOT NULL | Mật khẩu (plain-text — cần hash trong production) |
| `RoleID` | `INT` | NOT NULL | `1` = Admin, `2` = Khách hàng |
| `Create_At` | `DATETIME` | NULL | Thời điểm tạo tài khoản |
| `active` | `BIT` | NULL | `1` = đang hoạt động, `0` = đã vô hiệu hoá |

#### Bảng `Categories` — Danh mục sản phẩm

| Cột | Kiểu dữ liệu | Ràng buộc | Mô tả |
|-----|-------------|-----------|-------|
| `ID` | `INT` | PK | ID danh mục |
| `Name` | `NVARCHAR(30)` | — | Tên danh mục (vd: Clothes, Shoes, Watches) |
| `Describe` | `NVARCHAR(MAX)` | — | Mô tả danh mục |

#### Bảng `Products` — Sản phẩm

| Cột | Kiểu dữ liệu | Ràng buộc | Mô tả |
|-----|-------------|-----------|-------|
| `id` | `VARCHAR` | PK | ID sản phẩm (dạng chuỗi) |
| `name` | `NVARCHAR(255)` | — | Tên sản phẩm |
| `quantity` | `INT` | — | Số lượng tồn kho |
| `price` | `FLOAT` | — | Giá bán lẻ |
| `releaseDate` | `VARCHAR` | — | Ngày ra mắt sản phẩm |
| `describe` | `NVARCHAR(MAX)` | — | Mô tả chi tiết sản phẩm |
| `image` | `VARCHAR` | — | Đường dẫn hoặc URL ảnh sản phẩm |
| `cid` | `INT` | FK → Categories | Tham chiếu đến danh mục |

#### Bảng `Orders` — Đơn hàng

| Cột | Kiểu dữ liệu | Ràng buộc | Mô tả |
|-----|-------------|-----------|-------|
| `id` | `INT` | PK, Identity | ID đơn hàng tự tăng |
| `account_id` | `INT` | FK → Account | Khách hàng đặt hàng |
| `totalPrice` | `FLOAT` | — | Tổng giá trị đơn hàng |
| `note` | `NVARCHAR(255)` | — | Ghi chú giao hàng |
| `create_date` | `DATE` | DEFAULT `GETDATE()` | Ngày đặt hàng |

#### Bảng `OrderDetail` — Chi tiết đơn hàng

| Cột | Kiểu dữ liệu | Ràng buộc | Mô tả |
|-----|-------------|-----------|-------|
| `id` | `INT` | PK, Identity | ID tự tăng |
| `order_id` | `INT` | FK → Orders | Đơn hàng cha |
| `productName` | `NVARCHAR(255)` | — | Snapshot tên sản phẩm tại thời điểm mua |
| `productImage` | `NVARCHAR(255)` | — | Snapshot ảnh sản phẩm tại thời điểm mua |
| `productPrice` | `FLOAT` | — | Snapshot giá sản phẩm tại thời điểm mua |
| `quantity` | `INT` | — | Số lượng đặt mua |

> **Lưu ý thiết kế:** `OrderDetail` lưu snapshot dữ liệu sản phẩm (tên, ảnh, giá) thay vì tham chiếu trực tiếp vào bảng `Products`. Điều này đảm bảo lịch sử đơn hàng không bị thay đổi kể cả khi thông tin sản phẩm được cập nhật sau này.

---

## 9. Tính Năng Hệ Thống

### 9.1 Chức Năng Dành Cho Khách Hàng

#### Duyệt Sản Phẩm
- **Trang chủ** — Hiển thị sản phẩm mới nhất (sắp xếp `releaseDate DESC`) và sản phẩm cũ nhất (`releaseDate ASC`) trong các section riêng biệt.
- **Danh sách sản phẩm** — Xem toàn bộ catalogue có hỗ trợ tìm kiếm và lọc danh mục. Phân trang 8 sản phẩm/trang.
- **Tìm kiếm theo tên** — Tìm kiếm LIKE trên tên và mô tả sản phẩm.
- **Lọc theo danh mục** — Duyệt sản phẩm theo từng nhóm (Quần áo, Giày dép, Đồng hồ...) có phân trang.
- **Chi tiết sản phẩm** — Trang riêng với mô tả đầy đủ, giá, tình trạng kho và các sản phẩm liên quan cùng danh mục.

#### Tài Khoản Người Dùng
- **Đăng ký** — Tạo tài khoản với username, email, địa chỉ, số điện thoại và mật khẩu. Xác nhận mật khẩu được kiểm tra cả phía client lẫn server.
- **Đăng nhập** — Xác thực bằng username + password, chỉ cho phép tài khoản có `active = 1`.
- **Ghi nhớ đăng nhập** — Lưu cookie 30 ngày nếu chọn "Remember Me" (`cuser`, `cpass`, `cremember`).
- **Đăng xuất** — Huỷ `HttpSession` và xoá giỏ hàng khỏi bộ nhớ.
- **Chỉnh sửa tài khoản** — Cập nhật địa chỉ, số điện thoại, email và các thông tin cá nhân khác.
- **Quên mật khẩu** — Nhập email để nhận mật khẩu mới do hệ thống tự tạo gửi qua email.
- **Đổi mật khẩu** — Thay đổi mật khẩu trực tiếp từ trang cài đặt tài khoản.

#### Giỏ Hàng
- **Thêm vào giỏ** — Khách hàng đã đăng nhập có thể thêm sản phẩm vào giỏ dựa trên session.
- **Xem giỏ hàng** — Liệt kê tất cả sản phẩm trong giỏ kèm đơn giá và tổng tiền được tính phía server.
- **Cập nhật số lượng** — Tăng hoặc giảm số lượng từng sản phẩm (giới hạn bởi tồn kho thực tế).
- **Xoá sản phẩm** — Xoá từng item khỏi giỏ hàng.
- **Duy trì qua các trang** — Giỏ hàng lưu trong `HttpSession`, không mất khi điều hướng giữa các trang.

#### Thanh Toán & Đặt Hàng
- **Trang checkout** — Xem lại giỏ hàng, nhập ghi chú giao hàng.
- **Đặt hàng** — Tạo bản ghi `Order` và các `OrderDetail` tương ứng. Tồn kho sản phẩm tự động giảm sau khi đặt.
- **Xác nhận đơn hàng** — Hiển thị trang "Thank You" sau khi đặt hàng thành công.
- **Reset giỏ hàng** — Giỏ hàng được xoá khỏi session sau khi checkout thành công.

### 9.2 Chức Năng Admin

#### Quản Lý Khách Hàng (`/managerAccount`)
- Xem toàn bộ tài khoản khách hàng dạng bảng phân trang (3 tài khoản/trang).
- Kích hoạt hoặc vô hiệu hoá tài khoản khách hàng.
- Chỉnh sửa thông tin tài khoản trực tiếp từ admin panel.
- Tạo mới tài khoản khách hàng thủ công.

#### Dashboard (`/dashboard`)
- Xem thống kê tổng quan: số đơn hàng, số khách hàng, doanh thu... thông qua `DashboardDAO`.

---

## 10. URL Routes & Controllers

### Routes Công Khai (không cần đăng nhập)

| Method | URL | Controller | Mô tả |
|--------|-----|-----------|-------|
| GET | `/home` | `HomeServlet` | Trang chủ: sản phẩm mới & cũ nhất |
| GET | `/login` | `LoginServlet` | Hiển thị form đăng nhập |
| POST | `/login` | `LoginServlet` | Xử lý thông tin đăng nhập |
| GET | `/logout` | `LogoutServlet` | Đăng xuất, huỷ session |
| GET | `/user-register` | `UserRegisterController` | Hiển thị form đăng ký |
| POST | `/user-register` | `UserRegisterController` | Xử lý tạo tài khoản mới |
| GET | `/forgot-password` | `ForgotPasswordServlet` | Hiển thị form quên mật khẩu |
| POST | `/forgot-password` | `ForgotPasswordServlet` | Gửi email khôi phục mật khẩu |
| GET | `/reset` | `resetPasswordController` | Hiển thị form đặt lại mật khẩu |
| POST | `/reset` | `resetPasswordController` | Xử lý đặt lại mật khẩu |
| GET | `/product-list` | `SearchController` | Danh sách sản phẩm, tìm kiếm, lọc danh mục |
| GET | `/product-detail` | `ProductDetailController` | Trang chi tiết 1 sản phẩm |

### Routes Yêu Cầu Đăng Nhập (Khách Hàng)

| Method | URL | Controller | Mô tả |
|--------|-----|-----------|-------|
| GET/POST | `/add-to-cart` | `AddToCartServlet` | Thêm sản phẩm vào giỏ hàng session |
| GET | `/carts` | `CartController` | Xem giỏ hàng |
| POST | `/update-quantity` | `UpdateCartQuantityController` | Cập nhật số lượng sản phẩm trong giỏ |
| GET | `/delete-cart` | `DeleteCartController` | Xoá sản phẩm khỏi giỏ |
| GET/POST | `/checkout` | `CheckOutController` | Trang thanh toán & đặt hàng |
| GET/POST | `/thank` | `ThankController` | Xác nhận đặt hàng thành công |

### Routes Admin (Yêu cầu `role_admin`)

| Method | URL | Controller | Mô tả |
|--------|-----|-----------|-------|
| GET/POST | `/managerAccount` | `ManagerAccountController` | Bảng quản lý khách hàng |
| GET/POST | `/edit-account` | `EditAccountController` | Chỉnh sửa tài khoản cụ thể |
| GET | `/dashboard` | `DashboardServlet` | Tổng quan admin dashboard |

---

## 11. Xác Thực & Phân Quyền

### Luồng Đăng Nhập

```
Người dùng submit /login (POST)
       │
       ▼
DAO.check(username, password)
  → SELECT * FROM Account WHERE Username=? AND Password=? AND active=1
       │
       ├── Không tìm thấy → Redirect /login + hiển thị thông báo lỗi
       │
       └── Tìm thấy → Lưu Account object vào HttpSession("account")
                       │
                       ├── RoleID == 1 (Admin)
                       │     → Set session("role_admin") = "yes"
                       │     → Redirect đến /managerAccount
                       │
                       └── RoleID == 2 (Khách hàng)
                             → Redirect đến /home
```

### Cấu Trúc Session

| Session Key | Kiểu | Mô tả |
|-------------|------|-------|
| `account` | `Account` | Object tài khoản của người dùng đang đăng nhập |
| `carts` | `LinkedHashMap<String, Cart>` | Giỏ hàng (productId → Cart object) |
| `role_admin` | `String` | Giá trị `"yes"` nếu tài khoản là Admin |

### Cookie Ghi Nhớ Đăng Nhập

Khi người dùng tick vào "Remember Me":
- Cookie `cuser` — lưu username, hết hạn sau 30 ngày
- Cookie `cpass` — lưu password, hết hạn sau 30 ngày
- Cookie `cremember` — lưu cờ `"1"`, hết hạn sau 30 ngày

Lần truy cập tiếp theo, `LoginServlet` đọc các cookie này để tự điền hoặc tự xác thực lại form.

### Kiểm Tra Phân Quyền

Các controller tự kiểm tra session attribute thủ công:

```java
// Kiểm tra đã đăng nhập chưa
if (session.getAttribute("account") == null) {
    response.sendRedirect("login");
    return;
}

// Kiểm tra có phải admin không
if (session.getAttribute("role_admin") == null) {
    response.sendRedirect("home");
    return;
}
```

### Luồng Khôi Phục Mật Khẩu

```
1. Người dùng vào /forgot-password và nhập email đã đăng ký
2. ForgotPasswordServlet truy vấn database tìm tài khoản có email đó
3. Nếu tìm thấy:
   a. Tạo mật khẩu ngẫu nhiên (mã hoá Base64)
   b. Cập nhật mật khẩu mới vào database
   c. Gửi email qua Gmail SMTP (SendMailHelper) chứa mật khẩu mới
4. Người dùng nhận email, đăng nhập bằng mật khẩu mới rồi tự đổi lại
```

---

## 12. Hệ Thống Giỏ Hàng

Giỏ hàng hoàn toàn lưu trong session — không persist vào database cho đến khi checkout.

### Cấu Trúc Dữ Liệu Giỏ Hàng

```java
// Lưu trong HttpSession với key "carts"
LinkedHashMap<String, Cart> carts = new LinkedHashMap<>();
// Key:   productId (String)
// Value: Cart object { Product product, int quantity }
```

### Các Thao Tác Trên Giỏ Hàng

| Thao tác | Controller | Logic xử lý |
|----------|-----------|-------------|
| **Thêm** | `AddToCartServlet` | Nếu sản phẩm đã có → tăng số lượng; chưa có → tạo entry mới |
| **Xem** | `CartController` | Đọc giỏ từ session, tính tiền từng sản phẩm và tổng tiền |
| **Cập nhật** | `UpdateCartQuantityController` | Thay đổi số lượng theo productId |
| **Xoá** | `DeleteCartController` | Xoá entry khỏi `LinkedHashMap` |
| **Checkout** | `CheckOutController` | Tạo bản ghi DB, trừ tồn kho, xoá giỏ khỏi session |

### Cách Tính Tổng Tiền (CartController)

```java
double totalMoney = 0;
for (Map.Entry<String, Cart> entry : carts.entrySet()) {
    Cart c = entry.getValue();
    totalMoney += c.getProduct().getPrice() * c.getQuantity();
}
request.setAttribute("totalMoney", totalMoney);
```

---

## 13. Admin Panel

### Quản Lý Khách Hàng (`ManagerAccountController`)

- Liệt kê toàn bộ tài khoản từ bảng `Account`
- **Phân trang:** 3 tài khoản/trang (có thể tuỳ chỉnh trong `AcountDAO`)
- Hỗ trợ tìm kiếm / lọc theo từ khoá
- Nút **Sửa** và **Vô hiệu hoá** cho từng tài khoản
- Admin có thể **Tạo mới** tài khoản khách hàng thủ công

### Dashboard (`DashboardServlet`)

Dashboard cung cấp cái nhìn tổng quan thông qua `DashboardDAO`:
- Tổng số khách hàng đã đăng ký
- Tổng số đơn hàng đã đặt
- Thống kê doanh thu
- Các hoạt động gần đây

### Kiểm Soát Truy Cập

Các trang admin kiểm tra `session.getAttribute("role_admin")`. Nếu người dùng không phải admin, hệ thống sẽ redirect về `/home`.

---

## 14. Dịch Vụ Email

Email khôi phục mật khẩu được gửi qua **Gmail SMTP**.

### Cấu Hình (`GoogleInfomation.java`)

```java
// Thay đổi các giá trị này trước khi deploy
public static final String EMAIL    = "your-email@gmail.com";
public static final String PASSWORD = "your-app-password";
```

> **Quan trọng:** Sử dụng **Gmail App Password** (không phải mật khẩu Gmail thông thường). Bật 2FA trên tài khoản Google, sau đó tạo App Password tại Google Account → Security → App Passwords.

### Sử Dụng SendMailHelper

```java
SendMailHelper.sendEmailTo(
    recipientEmail,    // địa chỉ email nhận
    subject,           // tiêu đề email
    body               // nội dung (HTML hoặc plain-text)
);
```

**Cài đặt SMTP:**

| Thuộc tính | Giá trị |
|------------|---------|
| Host | `smtp.gmail.com` |
| Port | `587` |
| Auth | `true` |
| STARTTLS | `true` |

---

## 15. Giao Diện Frontend

### Cấu Trúc Layout

Mỗi trang đều include fragment `header.jsp` và `footer.jsp` dùng chung thông qua `<jsp:include>`:

```
┌──────────────────────────────┐
│           header.jsp          │  ← Navbar toàn cục (logo, nav links, icon giỏ hàng)
├──────────────────────────────┤
│                               │
│       Nội dung riêng từng     │
│       trang (JSP page)        │
│                               │
├──────────────────────────────┤
│           footer.jsp          │  ← Links, mạng xã hội, bản quyền
└──────────────────────────────┘
```

### Bảng Màu

| Vị trí | Màu sắc |
|--------|---------|
| Màu chữ chính | `#1d1d1d` (gần đen) |
| Màu nhấn / CTA | `#fb774b` (cam) |
| Nền trang | `#ffffff` (trắng) |
| Chữ phụ | `#d8d8d8` (xám nhạt) |
| Đánh giá sao | Vàng gold |
| Badge | Xanh Bootstrap |

### Typography

- **Font chính:** Poppins (Google Fonts)
- Import trong mỗi trang: `@import url('https://fonts.googleapis.com/css?family=Poppins')`

### Responsive Breakpoints (Bootstrap 4)

| Suffix class | Độ rộng màn hình |
|-------------|-----------------|
| `-lg` | ≥ 992px (máy tính để bàn) |
| `-md` | ≥ 768px (máy tính bảng) |
| `-sm` | ≥ 576px (điện thoại lớn) |
| (mặc định) | < 576px (điện thoại nhỏ) |

### Danh Sách File CSS

| File | Phạm vi áp dụng |
|------|----------------|
| `header.css` | Navbar, logo, menu, icon giỏ hàng |
| `home.css` | Khu hero, card sản phẩm, sao đánh giá |
| `login.css` | Layout và input form đăng nhập |
| `signup.css` | Giao diện form đăng ký |
| `product.css` | Trang chi tiết sản phẩm |
| `cart.css` | Bảng giỏ hàng và hộp tổng tiền |
| `footer.css` | Cột footer và icon mạng xã hội |

---

## 16. Cấu Hình Hệ Thống

### Kết Nối Database (`src/java/dal/DBContext.java`)

```java
private static final String URL      = "jdbc:sqlserver://localhost:1433;databaseName=BoostYourStyleDB";
private static final String USERNAME = "sa";
private static final String PASSWORD = "123";
private static final String DRIVER   = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
```

Chỉnh sửa các giá trị này để phù hợp với cấu hình SQL Server trên máy của bạn.

### Deployment Context của Tomcat (`web/WEB-INF/context.xml`)

```xml
<Context path="/boostyourstyle" />
```

Ứng dụng được deploy tại: `http://localhost:8080/boostyourstyle/`

### Web Application Descriptor (`web/WEB-INF/web.xml`)

```xml
<!-- Jakarta EE 6.0 -->
<web-app version="6.0" xmlns="https://jakarta.ee/xml/ns/jakartaee">
    <!-- Filter: LoginFilter — bảo vệ /add.jsp và /add -->
    <!-- Các servlet mapping còn lại dùng annotation @WebServlet -->
</web-app>
```

### Tài Khoản Admin Mặc Định

Sau khi chạy script database, một tài khoản admin sẽ được seed sẵn:

| Trường | Giá trị |
|--------|---------|
| `RoleID` | `1` (Admin) |
| `active` | `1` |

Kiểm tra file `database/BoostYourStyleDB.sql` để xem thông tin đăng nhập mặc định.

---

## 17. Thành Viên Nhóm

Dự án được phát triển bởi nhóm sinh viên trong môn học **PRJ301 — Phát Triển Ứng Dụng Web Java** tại **Đại học FPT, kỳ Spring 2026 (SE1928)**.

| Thành viên | Vai trò |
|-----------|---------|
| Thành viên 1 | Backend / Controllers |
| Thành viên 2 | Frontend / JSP Views |
| Thành viên 3 | Database Design / DAOs |
| Thành viên 4 | Authentication / Security |
| Thành viên 5 | Integration & Testing |

---

## Lưu Ý & Hạn Chế Hiện Tại

- **Mật khẩu lưu dạng plain-text.** Trong môi trường production, cần dùng `BCrypt` hoặc `PBKDF2` để hash mật khẩu.
- **Thông tin kết nối database bị hardcode** trong `DBContext.java`. Nên dùng biến môi trường hoặc file `.properties` cho production.
- **Thông tin Gmail bị hardcode** trong `GoogleInfomation.java`. Cần chuyển sang biến môi trường trước khi deploy.
- **Giỏ hàng lưu trong session** — nội dung giỏ hàng sẽ mất nếu server restart hoặc session hết hạn.
- **LoginFilter chưa được bật đầy đủ** — cần xem xét lại cơ chế kiểm soát truy cập trước khi đưa lên production.
- **Chưa có CSRF protection** — nên thêm CSRF token cho tất cả form POST.
- **Chưa có sanitization cho XSS** — các JSP nên dùng `<c:out>` hoặc JSTL escaping cho mọi dữ liệu do người dùng nhập.

---

*Built with Java Servlet/JSP · Bootstrap 4 · SQL Server · Apache Tomcat*
