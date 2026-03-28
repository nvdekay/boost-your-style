# Boost Your Style — E-Commerce Fashion Web Application

> **PRJ301 Assignment — SE1928 | FPT University Spring 2026**
>
> A full-stack e-commerce shopping website for fashion products built with Java Servlet/JSP, SQL Server, and Bootstrap 4.

---

## Table of Contents

1. [Project Overview](#1-project-overview)
2. [Tech Stack](#2-tech-stack)
3. [System Architecture](#3-system-architecture)
4. [Prerequisites](#4-prerequisites)
5. [Database Setup](#5-database-setup)
6. [Installation & Running](#6-installation--running)
7. [Project Structure](#7-project-structure)
8. [Database Schema](#8-database-schema)
9. [Features & Functionality](#9-features--functionality)
10. [URL Routes & Controllers](#10-url-routes--controllers)
11. [Authentication & Authorization](#11-authentication--authorization)
12. [Shopping Cart System](#12-shopping-cart-system)
13. [Admin Panel](#13-admin-panel)
14. [Email Service](#14-email-service)
15. [Frontend Design](#15-frontend-design)
16. [Configuration Reference](#16-configuration-reference)
17. [Team Members](#17-team-members)

---

## 1. Project Overview

**Boost Your Style** is an e-commerce web application for a fashion retail store, allowing customers to browse products (clothes, shoes, watches, accessories), add them to cart, and complete purchases. The project is built as a standard Java EE web application following the **MVC (Model-View-Controller)** pattern.

### What the app does

| Actor | Capabilities |
|-------|-------------|
| **Guest** | Browse products, search by keyword, filter by category |
| **Customer** | Register, login, manage account, add to cart, checkout, track orders |
| **Admin** | Manage customer accounts, view dashboard, activate/deactivate users |

---

## 2. Tech Stack

### Backend
| Technology | Version | Purpose |
|------------|---------|---------|
| Java | 8+ | Core programming language |
| Jakarta EE Servlet | 6.0 | HTTP request handling, routing |
| JSP + JSTL | 1.2 | Server-side templating |
| JDBC | — | Direct SQL database access |
| Microsoft SQL Server JDBC | — | SQL Server connector (`com.microsoft.sqlserver.jdbc.SQLServerDriver`) |
| JavaMail API | — | Email delivery via Gmail SMTP |
| Apache Tomcat | 9+ | Application server |
| Apache Ant | — | Build automation |

### Frontend
| Technology | Version | Purpose |
|------------|---------|---------|
| HTML5 | — | Markup |
| CSS3 | — | Custom styling |
| JavaScript | ES5+ | Client-side interactivity |
| Bootstrap | 4.3.1 | Responsive UI framework |
| Font Awesome | 5.10.0 | Icon library |
| Google Fonts (Poppins) | — | Typography |

### Database
| Technology | Details |
|------------|---------|
| Microsoft SQL Server | Local instance on port `1433` |
| Database name | `BoostYourStyleDB` |
| Default credentials | User: `sa` / Password: `123` |

### Development Tools
| Tool | Purpose |
|------|---------|
| NetBeans IDE | Primary IDE (project files included) |
| Apache Ant | Build & deploy (`build.xml`) |
| SQL Server Management Studio | Database management |

---

## 3. System Architecture

```
┌─────────────────────────────────────────────────────────┐
│                     Client (Browser)                     │
│              HTML + CSS + JS + Bootstrap                 │
└────────────────────────┬────────────────────────────────┘
                         │ HTTP Request/Response
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

**Pattern:** MVC (Model-View-Controller)
- **Model** — `src/java/model/` + DAO classes
- **View** — `web/*.jsp` templates
- **Controller** — `src/java/controller/` + package-level servlets

**Session Management:** HttpSession (server-side)
**Cart Storage:** HttpSession (LinkedHashMap, non-persistent)

---

## 4. Prerequisites

Before setting up the project, ensure the following are installed:

- **JDK 8 or later** — [Download](https://www.oracle.com/java/technologies/downloads/)
- **Apache Tomcat 9+** — [Download](https://tomcat.apache.org/)
- **Microsoft SQL Server** (Developer or Express edition) — [Download](https://www.microsoft.com/en-us/sql-server/sql-server-downloads)
- **SQL Server Management Studio (SSMS)** — For database management
- **NetBeans IDE 12+** (recommended) or any IDE supporting Jakarta EE projects — [Download](https://netbeans.apache.org/)
- **Microsoft JDBC Driver for SQL Server** — Must be added to project classpath
- **Apache Ant** — [Download](https://ant.apache.org/) (or bundled with NetBeans)

---

## 5. Database Setup

### Step 1 — Create the database

Open **SQL Server Management Studio** and connect to your local SQL Server instance.

```sql
CREATE DATABASE BoostYourStyleDB;
```

### Step 2 — Run the schema script

Execute the SQL script located at:

```
database/BoostYourStyleDB.sql
```

This will create all required tables: `Account`, `Categories`, `Products`, `Orders`, `OrderDetail`.

If there is a separate query file, also run:

```
database/querry.sql
```

### Step 3 — Verify the connection settings

By default, `DBContext.java` uses:

```java
String url  = "jdbc:sqlserver://localhost:1433;databaseName=BoostYourStyleDB";
String user = "sa";
String pass = "123";
```

Edit `src/java/dal/DBContext.java` to match your local SQL Server credentials if they differ.

---

## 6. Installation & Running

### Clone the repository

```bash
git clone https://github.com/nvdekay/boost-your-style.git
cd boost-your-style
```

### Open in NetBeans

1. **File → Open Project** → select the cloned folder
2. NetBeans will detect the Ant-based web project automatically

### Add required libraries

Place the following JAR files in your project's `lib/` folder (or configure via NetBeans Libraries):

| JAR | Purpose |
|-----|---------|
| `mssql-jdbc-*.jar` | SQL Server JDBC driver |
| `javax.mail.jar` / `jakarta.mail.jar` | JavaMail for email |
| `jstl-1.2.jar` | JSTL tag library |
| `servlet-api.jar` | Servlet API (provided by Tomcat) |

### Configure Tomcat in NetBeans

1. **Tools → Servers → Add Server** → Apache Tomcat
2. Point to your Tomcat installation directory
3. Set port to `8080` (or your preferred port)

### Build & Deploy

**Via NetBeans:**
- Right-click project → **Clean and Build** → **Run**

**Via Ant (command line):**
```bash
ant clean
ant build
ant run
```

### Access the Application

Open your browser and navigate to:

```
http://localhost:8080/boostyourstyle/home
```

---

## 7. Project Structure

```
boost-your-style/
│
├── src/
│   └── java/                          # All backend Java source code
│       ├── model/                     # Data model classes (POJOs)
│       │   ├── Account.java           # User account entity
│       │   ├── Product.java           # Product entity
│       │   ├── Category.java          # Product category entity
│       │   └── Role.java              # User role entity (Admin / User)
│       │
│       ├── dal/                       # Data Access Layer (base)
│       │   ├── DBContext.java         # Database connection manager
│       │   ├── DAO.java               # General-purpose data operations
│       │   └── ProductDAO.java        # Product queries (search, paginate)
│       │
│       ├── controller/                # Core HTTP controllers
│       │   ├── HomeServlet.java       # Homepage — newest & oldest products
│       │   ├── LoginServlet.java      # Login with remember-me cookies
│       │   ├── LogoutServlet.java     # Session invalidation
│       │   ├── UserRegisterController.java  # New user registration
│       │   ├── resetPasswordController.java # Password change
│       │   ├── SearchServlet.java     # Product search
│       │   ├── Home1Servlet.java      # Alternative home (legacy)
│       │   ├── PagingServlet.java     # Pagination helper
│       │   ├── Product1Servlet.java   # Product list (legacy)
│       │   └── ProductServlet.java    # Product detail (legacy)
│       │
│       ├── productlist/               # Product browsing logic
│       │   ├── ProductDBContext.java  # Extended product DB operations
│       │   ├── CategoryDAO.java       # Category CRUD operations
│       │   ├── ProductDetailController.java   # Single product page
│       │   ├── SearchController.java  # Search with category filter + pagination
│       │   └── SearchByCategoryController.java # Browse by category
│       │
│       ├── checkout/                  # Shopping cart & order processing
│       │   ├── Cart.java              # Cart item (product + quantity)
│       │   ├── Order.java             # Order entity
│       │   ├── OrderDetail.java       # Order line item
│       │   ├── OrderDAO.java          # Create & retrieve orders
│       │   ├── OrderDetailDAO.java    # Save & retrieve order details
│       │   ├── ProductDAO.java        # Stock management (checkout)
│       │   ├── AddToCartServlet.java  # Add product to session cart
│       │   ├── CartController.java    # View cart contents & total
│       │   ├── UpdateCartQuantityController.java # Change item quantity
│       │   ├── DeleteCartController.java  # Remove item from cart
│       │   ├── CheckOutController.java    # Place order & clear cart
│       │   ├── ThankController.java       # Order confirmation
│       │   └── BaseRequiredAuthenController.java # Auth base class
│       │
│       ├── customermanagement/        # Admin: customer management
│       │   ├── AcountDAO.java         # Account CRUD + pagination
│       │   ├── ManagerAccountController.java # List & manage customers
│       │   └── EditAccountController.java    # Edit customer details
│       │
│       ├── dashboard/                 # Admin dashboard
│       │   ├── DashboardDAO.java      # Dashboard statistics queries
│       │   └── DashboardServlet.java  # Admin dashboard controller
│       │
│       ├── forgotpassword/            # Password recovery flow
│       │   ├── ForgotPasswordServlet.java  # Forgot-password handler
│       │   ├── SendMailHelper.java    # Gmail SMTP email sender
│       │   └── GoogleInfomation.java  # Gmail credentials store
│       │
│       └── filter/                    # Servlet filters
│           ├── LoginFilter.java       # Authentication gate
│           └── HomeFilter.java        # Home page filter
│
├── web/                               # Frontend (JSP, CSS, JS, images)
│   ├── home.jsp                       # Homepage view
│   ├── header.jsp                     # Global navigation header
│   ├── footer.jsp                     # Global footer
│   ├── login.jsp                      # Login form
│   ├── signup.jsp                     # Registration form
│   ├── product-detail.jsp             # Product detail page
│   ├── list_product.jsp               # Product listing / search results
│   ├── cart.jsp                       # Shopping cart
│   ├── checkout.jsp                   # Checkout form
│   ├── thanks.jsp                     # Order success page
│   ├── forgot-password.jsp            # Forgot password form
│   ├── change-newpassword.jsp         # Password reset form
│   ├── ManagerCustomer.jsp            # Admin: customer management
│   ├── dashboard.jsp                  # Admin: dashboard
│   ├── 404.jsp                        # Error / not found page
│   ├── css/                           # Per-page stylesheets
│   │   ├── header.css
│   │   ├── footer.css
│   │   ├── home.css
│   │   ├── login.css
│   │   ├── signup.css
│   │   ├── product.css
│   │   └── cart.css
│   ├── img/                           # Static image assets
│   │   ├── brand/                     # Brand logo images
│   │   ├── clothes/                   # Clothing product images
│   │   ├── watches/                   # Watch product images
│   │   ├── shoes/                     # Shoe product images
│   │   ├── featured/                  # Featured/banner images
│   │   └── cart/                      # Cart-related images
│   └── WEB-INF/
│       ├── web.xml                    # Servlet & filter mappings
│       └── context.xml                # Tomcat deployment context
│
├── database/
│   ├── BoostYourStyleDB.sql           # Full database schema + seed data
│   └── querry.sql                     # Additional SQL queries
│
├── build.xml                          # Apache Ant build script
├── nbproject/                         # NetBeans project metadata
│   ├── project.xml
│   ├── project.properties
│   └── build-impl.xml
└── README.md
```

---

## 8. Database Schema

### Entity Relationship Overview

```
Account (1) ────── (N) Orders (1) ────── (N) OrderDetail
                                              (stores product snapshot)

Categories (1) ─── (N) Products
```

### Table Definitions

#### `Account`
| Column | Type | Constraints | Description |
|--------|------|-------------|-------------|
| `ID` | `INT` | PK, Identity | Auto-increment user ID |
| `Username` | `NVARCHAR(100)` | NOT NULL | Display name / login name |
| `Email` | `NVARCHAR(100)` | NOT NULL | Email address |
| `Address` | `NVARCHAR(100)` | NOT NULL | Delivery address |
| `PhoneNumber` | `VARCHAR(20)` | NOT NULL | Contact phone |
| `Password` | `VARCHAR(50)` | NOT NULL | Plain-text password (hashing recommended for production) |
| `RoleID` | `INT` | NOT NULL | `1` = Admin, `2` = Customer |
| `Create_At` | `DATETIME` | NULL | Account creation timestamp |
| `active` | `BIT` | NULL | `1` = active, `0` = disabled |

#### `Categories`
| Column | Type | Constraints | Description |
|--------|------|-------------|-------------|
| `ID` | `INT` | PK | Category identifier |
| `Name` | `NVARCHAR(30)` | — | Category name (e.g., Clothes, Shoes, Watches) |
| `Describe` | `NVARCHAR(MAX)` | — | Category description |

#### `Products`
| Column | Type | Constraints | Description |
|--------|------|-------------|-------------|
| `id` | `VARCHAR` | PK | Product identifier (string) |
| `name` | `NVARCHAR(255)` | — | Product name |
| `quantity` | `INT` | — | Stock quantity |
| `price` | `FLOAT` | — | Retail price |
| `releaseDate` | `VARCHAR` | — | Product release date |
| `describe` | `NVARCHAR(MAX)` | — | Full product description |
| `image` | `VARCHAR` | — | Image path or URL |
| `cid` | `INT` | FK → Categories | Category reference |

#### `Orders`
| Column | Type | Constraints | Description |
|--------|------|-------------|-------------|
| `id` | `INT` | PK, Identity | Auto-increment order ID |
| `account_id` | `INT` | FK → Account | Owning customer |
| `totalPrice` | `FLOAT` | — | Total order value |
| `note` | `NVARCHAR(255)` | — | Delivery/order note |
| `create_date` | `DATE` | DEFAULT `GETDATE()` | Order placement date |

#### `OrderDetail`
| Column | Type | Constraints | Description |
|--------|------|-------------|-------------|
| `id` | `INT` | PK, Identity | Auto-increment |
| `order_id` | `INT` | FK → Orders | Parent order |
| `productName` | `NVARCHAR(255)` | — | Snapshot of product name at time of purchase |
| `productImage` | `NVARCHAR(255)` | — | Snapshot of product image |
| `productPrice` | `FLOAT` | — | Snapshot of product price at purchase |
| `quantity` | `INT` | — | Quantity ordered |

> **Note:** OrderDetail stores a snapshot of product data (name, image, price) rather than a live FK to Products. This ensures order history remains accurate even if product data changes.

---

## 9. Features & Functionality

### 9.1 Customer-Facing Features

#### Product Browsing
- **Homepage** — Displays newest products (sorted by releaseDate DESC) and oldest products (sorted by releaseDate ASC) in separate carousels/sections.
- **Product Listing** — Full product catalogue with search and category filter. Paginated at 8 products per page.
- **Search by Name** — Full-text LIKE search across product name and description.
- **Filter by Category** — Browse products by category (Clothes, Shoes, Watches, etc.) with pagination support.
- **Product Detail** — Individual product page with full description, price, stock status, and related products from the same category.

#### User Account
- **Registration** — Create a new account with username, email, address, phone, and password. Password confirmation validated client-side and server-side.
- **Login** — Authenticate with username + password. Credentials checked against `active = 1` accounts in the database.
- **Remember Me** — Optional 30-day cookie-based credential persistence (`cuser`, `cpass`, `cremember`).
- **Logout** — Invalidates the HTTP session and clears the cart.
- **Edit Account** — Update personal information (address, phone, email, etc.).
- **Forgot Password** — Enter email address to receive a system-generated random password via email.
- **Change Password** — Reset to a new password from within the account settings.

#### Shopping Cart
- **Add to Cart** — Any logged-in customer can add a product to the session-based cart.
- **View Cart** — Lists all cart items with individual and total prices calculated server-side.
- **Update Quantity** — Increase or decrease item quantity (capped by available stock).
- **Remove Item** — Delete a specific item from the cart.
- **Persistent across pages** — Cart is stored in `HttpSession` and survives navigation.

#### Checkout & Orders
- **Checkout Page** — Review cart, enter delivery notes.
- **Place Order** — Creates an `Order` record and individual `OrderDetail` records. Stock is decremented automatically.
- **Order Confirmation** — Displays a "Thank You" page after successful order placement.
- **Cart Reset** — Cart is cleared from the session after successful checkout.

### 9.2 Admin Features

#### Customer Management (`/managerAccount`)
- View all registered customer accounts in a paginated table (3 per page).
- Activate or deactivate customer accounts.
- Edit customer details directly from the admin panel.
- Create new customer accounts manually.

#### Dashboard (`/dashboard`)
- Overview statistics (orders, customers, etc.) via `DashboardDAO`.

---

## 10. URL Routes & Controllers

### Public Routes

| Method | URL | Controller | Description |
|--------|-----|-----------|-------------|
| GET | `/home` | `HomeServlet` | Homepage with newest & oldest products |
| GET | `/login` | `LoginServlet` | Show login form |
| POST | `/login` | `LoginServlet` | Process login credentials |
| GET | `/logout` | `LogoutServlet` | Logout and invalidate session |
| GET | `/user-register` | `UserRegisterController` | Show registration form |
| POST | `/user-register` | `UserRegisterController` | Process new account creation |
| GET | `/forgot-password` | `ForgotPasswordServlet` | Show forgot password form |
| POST | `/forgot-password` | `ForgotPasswordServlet` | Send recovery email |
| GET | `/reset` | `resetPasswordController` | Show reset password form |
| POST | `/reset` | `resetPasswordController` | Process password reset |
| GET | `/product-list` | `SearchController` | Product listing, search, category filter |
| GET | `/product-detail` | `ProductDetailController` | Single product detail page |

### Authenticated Customer Routes

| Method | URL | Controller | Description |
|--------|-----|-----------|-------------|
| GET/POST | `/add-to-cart` | `AddToCartServlet` | Add product to session cart |
| GET | `/carts` | `CartController` | View shopping cart |
| POST | `/update-quantity` | `UpdateCartQuantityController` | Update item quantity |
| GET | `/delete-cart` | `DeleteCartController` | Remove item from cart |
| GET/POST | `/checkout` | `CheckOutController` | Checkout page & place order |
| GET/POST | `/thank` | `ThankController` | Order success confirmation |

### Admin Routes

| Method | URL | Controller | Description |
|--------|-----|-----------|-------------|
| GET/POST | `/managerAccount` | `ManagerAccountController` | Customer management table |
| GET/POST | `/edit-account` | `EditAccountController` | Edit a specific account |
| GET | `/dashboard` | `DashboardServlet` | Admin dashboard overview |

---

## 11. Authentication & Authorization

### Login Flow

```
User submits /login (POST)
       │
       ▼
DAO.check(username, password)
  → SELECT * FROM Account WHERE Username=? AND Password=? AND active=1
       │
       ├── Not found → Redirect /login with error message
       │
       └── Found → Store Account in HttpSession("account")
                       │
                       ├── RoleID == 1 (Admin)
                       │     → Set session("role_admin") = "yes"
                       │     → Redirect to /managerAccount
                       │
                       └── RoleID == 2 (Customer)
                             → Redirect to /home
```

### Session Structure

| Session Key | Type | Description |
|-------------|------|-------------|
| `account` | `Account` | Logged-in user object |
| `carts` | `LinkedHashMap<String, Cart>` | Shopping cart (productId → Cart) |
| `role_admin` | `String` | `"yes"` if the user is an admin |

### Cookie-Based Remember Me

When "Remember Me" is checked on login:
- `cuser` cookie — stores username, expires in 30 days
- `cpass` cookie — stores password, expires in 30 days
- `cremember` cookie — stores `"1"` flag, expires in 30 days

On next visit, `LoginServlet` reads these cookies and pre-fills or auto-authenticates the form.

### Authorization Checks

Controllers manually check session attributes:

```java
// Check if user is logged in
if (session.getAttribute("account") == null) {
    response.sendRedirect("login");
    return;
}

// Check if user is admin
if (session.getAttribute("role_admin") == null) {
    response.sendRedirect("home");
    return;
}
```

### Password Recovery Flow

```
1. User visits /forgot-password and submits their registered email
2. ForgotPasswordServlet queries the database for an account with that email
3. If found:
   a. Generates a random password (Base64-encoded random bytes)
   b. Updates the account's password in the database
   c. Sends an email via Gmail SMTP (SendMailHelper) with the new password
4. User receives the new password and can log in, then change it
```

---

## 12. Shopping Cart System

The cart is entirely session-based — no database persistence until checkout.

### Cart Data Structure

```java
// Stored in HttpSession
LinkedHashMap<String, Cart> carts = new LinkedHashMap<>();
// Key: productId (String)
// Value: Cart object { Product product, int quantity }
```

### Cart Operations

| Operation | Controller | Logic |
|-----------|-----------|-------|
| **Add** | `AddToCartServlet` | If product already in cart → increment quantity; else → add new entry |
| **View** | `CartController` | Load cart from session, calculate per-item and total price |
| **Update** | `UpdateCartQuantityController` | Adjust quantity for a given productId |
| **Remove** | `DeleteCartController` | Remove entry from the LinkedHashMap |
| **Checkout** | `CheckOutController` | Create DB records, deduct stock, clear cart from session |

### Total Price Calculation (CartController)

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

### Customer Management (`ManagerAccountController`)

- Lists all accounts from the `Account` table
- **Pagination:** 3 accounts per page (configurable in `AcountDAO`)
- **Search/filter** support
- Buttons to **edit** or **deactivate** each account
- Admin can manually **create** new customer accounts

### Dashboard (`DashboardServlet`)

The dashboard provides a high-level overview using `DashboardDAO`:
- Total number of customers
- Total number of orders
- Revenue summary
- Recent activity

### Access Control

Admin pages check `session.getAttribute("role_admin")`. If the user is not an admin, they are redirected to `/home`.

---

## 14. Email Service

Password recovery emails are sent via **Gmail SMTP**.

### Configuration (`GoogleInfomation.java`)

```java
// Edit these values before deploying
public static final String EMAIL    = "your-email@gmail.com";
public static final String PASSWORD = "your-app-password";
```

> **Important:** Use a **Gmail App Password** (not your main Gmail password). Enable 2FA and generate an App Password under Google Account → Security → App Passwords.

### SendMailHelper

```java
SendMailHelper.sendEmailTo(
    recipientEmail,    // destination address
    subject,           // email subject
    body               // HTML or plain-text body
);
```

**SMTP Settings:**
| Property | Value |
|----------|-------|
| Host | `smtp.gmail.com` |
| Port | `587` |
| Auth | `true` |
| STARTTLS | `true` |

---

## 15. Frontend Design

### Layout Structure

Every page includes shared `header.jsp` and `footer.jsp` fragments via `<jsp:include>`.

```
┌──────────────────────────────┐
│           header.jsp          │  ← Global navbar (logo, nav links, cart icon)
├──────────────────────────────┤
│                               │
│       Page-specific JSP       │
│       (home, products, etc.)  │
│                               │
├──────────────────────────────┤
│           footer.jsp          │  ← Links, social media, copyright
└──────────────────────────────┘
```

### Color Scheme

| Usage | Color |
|-------|-------|
| Primary text | `#1d1d1d` (near-black) |
| Accent / CTA | `#fb774b` (orange) |
| Background | `#ffffff` (white) |
| Muted text | `#d8d8d8` (light gray) |
| Star ratings | Gold yellow |
| Badges | Bootstrap blue |

### Typography

- **Font family:** Poppins (via Google Fonts)
- Imported in each page: `@import url('https://fonts.googleapis.com/css?family=Poppins')`

### Responsive Breakpoints (Bootstrap 4)

| Class suffix | Screen width |
|-------------|-------------|
| `-lg` | ≥ 992px (desktop) |
| `-md` | ≥ 768px (tablet) |
| `-sm` | ≥ 576px (large phone) |
| (default) | < 576px (mobile) |

### CSS Files

| File | Scope |
|------|-------|
| `header.css` | Navbar, logo, menu links, cart icon |
| `home.css` | Hero section, product cards, star ratings |
| `login.css` | Login form layout and inputs |
| `signup.css` | Registration form styling |
| `product.css` | Product detail page |
| `cart.css` | Cart table and summary box |
| `footer.css` | Footer columns and social links |

---

## 16. Configuration Reference

### Database Connection (`src/java/dal/DBContext.java`)

```java
private static final String URL      = "jdbc:sqlserver://localhost:1433;databaseName=BoostYourStyleDB";
private static final String USERNAME = "sa";
private static final String PASSWORD = "123";
private static final String DRIVER   = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
```

Change these values to match your local SQL Server setup.

### Tomcat Deployment Context (`web/WEB-INF/context.xml`)

```xml
<Context path="/boostyourstyle" />
```

The application is deployed at: `http://localhost:8080/boostyourstyle/`

### Web Application Descriptor (`web/WEB-INF/web.xml`)

```xml
<!-- Jakarta EE 6.0 -->
<web-app version="6.0" xmlns="https://jakarta.ee/xml/ns/jakartaee">
    <!-- Filter: LoginFilter — guards /add.jsp and /add -->
    <!-- Remaining servlet mappings are annotation-based (@WebServlet) -->
</web-app>
```

### Default Admin Account

After running the database script, a default admin account should be seeded:

| Field | Value |
|-------|-------|
| RoleID | `1` (Admin) |
| active | `1` |

Check `database/BoostYourStyleDB.sql` for the default credentials.

---

## 17. Team Members

This project was developed as a team assignment for **PRJ301 — Java Web Application Development** at **FPT University, Spring 2026 semester (SE1928)**.

| Member | Role |
|--------|------|
| Team Member 1 | Backend / Controllers |
| Team Member 2 | Frontend / JSP Views |
| Team Member 3 | Database Design / DAOs |
| Team Member 4 | Authentication / Security |
| Team Member 5 | Integration & Testing |

---

## Notes & Known Limitations

- **Passwords are stored as plain text.** In production, use `BCrypt` or `PBKDF2` for password hashing.
- **Database credentials are hardcoded** in `DBContext.java`. Use environment variables or a properties file for production deployments.
- **Gmail credentials are hardcoded** in `GoogleInfomation.java`. Move to environment variables before deploying.
- **Cart is session-based** — cart contents are lost if the server restarts or the session expires.
- **LoginFilter is partially disabled** — authentication enforcement should be reviewed before production use.
- **No CSRF protection** — consider adding CSRF tokens to all POST forms.
- **No input sanitization for XSS** — JSP pages should use `<c:out>` or JSTL escaping for all user-controlled data.

---

*Built with Java Servlet/JSP · Bootstrap 4 · SQL Server · Apache Tomcat*
