# Biteright Food ordering platform 🍽️ ( Full Stack Web App with Admin & Customer Panel)

This is a Java-based web application for a food ordering system with separate admin and customer interfaces. It uses **JSP**, **Servlets**, **JDBC**, **MySQL**, and includes **login/registration**, **menu management**, **cart**, **orders**, and more.

---

## 🔧 Technologies Used

- Java (Servlets & JSP)
- MySQL (Database)
- HTML, CSS, Bootstrap
- JavaScript, jQuery, AJAX
- JDBC for database interaction
- Restful API
- Apache Tomcat Server

---
## 📁 Project Structure

```
BITERIGHT_PROJECT/
├── css/                  # Stylesheets
├── images/               # Images used in the project
├── js/                   # JavaScript files
├── lib/                  # External libraries (e.g., MySQL JDBC driver)
├── WEB-INF/
│   ├── classes/          # Java Servlet Classes
│   │   ├── AdminDashboardServlet.java
│   │   ├── AdminMenuServlet.java
│   │   ├── CartServlet.java
│   │   ├── DBConnection.java
│   │   ├── DeleteMenuItemServlet.java
│   │   ├── LoginHistoryServlet.java
│   │   ├── LoginServlet.java
│   │   ├── LogoutServlet.java
│   │   ├── MenuServlet.java
│   │   ├── OrderServlet.java
│   │   ├── OrderStatusUpdateServlet.java
│   │   ├── RegisterServlet.java
│   │   └── ViewUsersServlet.java
│   └── web.xml            # Deployment descriptor
├── about.jsp
├── add_menu_item.jsp
├── admin_dashboard.jsp
├── admin_login.jsp
├── admin_menu.jsp
├── admin_orders.jsp
├── cart.jsp
├── delete_menu_item.jsp
├── edit_menu_item.jsp
├── footer.jsp
├── index.jsp
├── login.jsp
├── menu.jsp
├── navbar.jsp
├── orders.jsp
├── register.jsp
└── view_users.jsp
```

---

## 📸 Screenshots

### ✅ Home Page
![image](https://github.com/user-attachments/assets/c2187159-5e57-4574-8d06-04b2546baa52)


### ✅ Menu (Customer Side)
![image](https://github.com/user-attachments/assets/32a37d1b-d182-4db8-a51a-bd47ba8b0f43)


### ✅ Cart (Customer Side)
![image](https://github.com/user-attachments/assets/81d04d48-1162-46c7-9940-8e7235ddd53f)


### ✅ Order history (Customer Side)
![image](https://github.com/user-attachments/assets/32b1ed8e-0ec7-4495-93f0-81604af3f45e)

### ✅ Admin Login
![image](https://github.com/user-attachments/assets/b9325b55-a37b-47c3-9bf6-94f9395a29da)


### ✅ Admin Dashboard
![image](https://github.com/user-attachments/assets/d9386b58-deb6-4425-b616-02839896d9f3)


### ✅ Admin Menu management
![image](https://github.com/user-attachments/assets/ed6f29ae-3955-4b75-a74d-6f0d402d89c3)


### ✅ Admin Order management
![image](https://github.com/user-attachments/assets/cd6f5d80-520f-4b89-8b48-e054aef81492)


### ✅ Admin User management
![image](https://github.com/user-attachments/assets/7bf5a9f2-95ef-4853-b607-a0705231c1e9)



---

## 🚀 Features

### 👤 User Side:
- Register & Login
- View Food Menu
- Add to Cart
- Place Orders

### 🔐 Admin Side:
- Admin Login
- Add/Edit/Delete Menu Items
- View Orders & Update Status
- View All Registered Users

---

## ⚙️ How to Run

1. Install XAMPP or WAMP (or use MySQL server manually).
2. Import the SQL database provided in MySQL (you can use phpMyAdmin).
3. Add MySQL JDBC Driver in `lib/` folder (`mysql-connector-j-*.jar`).
4. Deploy the project in Apache Tomcat (Eclipse or standalone).
5. Start the server and visit:  
   - `http://localhost:8080/BITERIGHT/index.jsp` for customer  
   - `http://localhost:8080/BITERIGHT/admin_login.jsp` for admin

---

## 💾 Database Configuration

In `DBConnection.java`, update:

```java
String url = "jdbc:mysql://localhost:3306/your_database";
String username = "root";
String password = "your_password";
```
---

## 📦 License
This project is open only for viewing. Please contact the author for commercial use.

