# Vendor Management System

## Description
Developed a comprehensive Vendor Management System using Spring MVC, Java, JPA, MySQL, Hibernate, HTML, CSS, JavaScript, AJAX, Bootstrap, and Maven.

## Key Features

### User Interface
- **Home Page**: Main landing page for users.
- **Registration Page**: User registration with email validation and OTP verification.
- **Login Page**: Secure login with OTP.
- **Profile Page**: View and update user profile information.
- **Update Profile Page**: Edit and save changes to user profile.

### Registration Process
- Validates email addresses and checks for existing accounts.
- Sends an OTP using Java Mail Sender for email verification.
- Sends a verification email upon successful registration.

### Login Process
- Verifies if the email exists and is approved by the admin.
- Restricts login until admin approval.
- Sends an OTP for login, valid for 2 minutes.

### Index Page Notifications
- Displays the latest notifications, including new products and company announcements.

### Product Management
- Enables users to add, view, and edit product details on their profile page.

### Order Management
- Users can receive orders, manage deliveries, cancel orders, and download order copies.

### Invoice Management
- Users can upload invoices when changing order status.

### History Tracking
- Provides access to order and payment history.

### Messaging System
- Facilitates communication between users and the company.

### Notifications
- Displays messages from the admin via a notification bell icon on the profile page.

### Admin Interface
- Separate login link for admins with dual validation through OTP and password.

### Admin Dashboard
- View vendors, products, orders, order status, order history, payment history, announcements, and messaging.

### Vendor Management
- Admins can view vendor details and approve vendors for the company.

### Product Management
- Admins can view and order products, and manage orders before vendor acceptance.

### Order Management
- Admins can track order status, update received orders, and make payments. Payment copies are emailed to vendors.

### Announcements
- Admins can make and delete announcements displayed to users.

### Messaging System
- Admins can send messages to all users or specific vendors, with notifications displayed on vendor profiles and emails.

### Payment History
- Displays all payment details, including total paid, amount due, and remaining balance.
- A scheduler sends unpaid status reports to the admin's email every morning.

## Technologies Used

### Frontend
- HTML
- CSS
- JavaScript

### Backend
- Java
- Spring MVC
- Java Servlets
- JPA

### Database
- MySQL

### Security
- Passwords are encrypted using advanced techniques.
- Spring Security is used for authentication and authorization.

### Email Integration
- Java Mail Sender for email notifications and password reset functionalities.

## Documentation
Documented project functionalities and setup instructions for ease of understanding and replication.

## GitHub Project Link
[Click here](https://github.com/yourusername/yourrepository) to view the project on GitHub.
