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
