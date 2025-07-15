# JAVA Project

This repository contains a Java project that demonstrates Object-Oriented Programming (OOP) principles through an **Online Library Management System** application. The project showcases encapsulation, inheritance, and polymorphism, and is designed for educational purposes to illustrate how OOP concepts can be applied to real-world scenarios such as managing books, users, borrowing, and library operations.

## Prerequisites

- Java Development Kit (JDK) 8 or higher
- (Optional) An IDE like IntelliJ IDEA, Eclipse, NetBeans, or VS Code for easier code navigation
- Apache Tomcat or any compatible Java EE servlet container (for running the web application)
- (Optional) MySQL or SQL Server for the database (see `DB_PRJ301_G2.sql` for schema)

## Installation

1. **Clone the repository** (if not already downloaded):
   ```sh
   git clone <repository-url>
   cd Online-Library-Management-System-main
   ```
2. **Set up the database:**
   - Import the `DB_PRJ301_G2.sql` file into your database server to create the necessary tables and sample data.
3. **Configure the database connection:**
   - Edit the database connection settings in `src/java/Dal/DBContext.java` to match your local database configuration (username, password, URL).
4. **Build and deploy the project:**
   - You can use NetBeans or another IDE to open the project and deploy it to your servlet container (e.g., Tomcat).
   - Alternatively, use Apache Ant with the provided `build.xml` to build the project.

## How to Run

After building and deploying the project to your servlet container:

1. Start your servlet container (e.g., Tomcat).
2. Access the application in your web browser at:
   ```
   http://localhost:8080/Online-Library-Management-System-main/
   ```
   (The context path may vary depending on your deployment settings.)

## Project Structure

```
Online-Library-Management-System-main/
├── build.xml
├── DB_PRJ301_G2.sql
├── lib/                # External libraries (JARs)
├── nbproject/          # NetBeans project files
├── src/
│   ├── conf/
│   └── java/
│       ├── Controller/ # Servlets for handling requests
│       ├── Dal/        # Data Access Layer (DAO classes)
│       ├── Filter/     # Servlet filters for access control
│       └── Model/      # JavaBeans and model classes
├── web/
│   ├── *.jsp           # JSP pages for the web interface
│   ├── css/            # CSS stylesheets
│   ├── img/            # Images
│   ├── js/             # JavaScript files
│   └── WEB-INF/        # Web application configuration (web.xml)
└── README.md
```

- The `src/java/Controller/` directory contains servlet classes for handling user and admin actions.
- The `src/java/Dal/` directory contains DAO classes for database operations.
- The `src/java/Model/` directory contains JavaBeans representing entities like Book, User, Borrow, etc.
- The `web/` directory contains JSP pages, static assets, and web configuration files.

## Learn More

- [Java EE Documentation](https://jakarta.ee/specifications/)
- [Servlet and JSP Tutorial](https://www.oracle.com/java/technologies/jsptutorial.html)
- [How to Deploy Java Web Apps](https://tomcat.apache.org/tomcat-9.0-doc/appdev/index.html)
- For questions or contributions, please open an issue or pull request.
