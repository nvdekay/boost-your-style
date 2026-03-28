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
