<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="description" content="Ogani Template">
        <meta name="keywords" content="Ogani, unica, creative, html">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Profile</title>

        <!-- Google Font -->
        <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">

        <!-- Css Styles -->
        <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
        <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
        <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
        <link rel="stylesheet" href="css/nice-select.css" type="text/css">
        <link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
        <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
        <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
        <link rel="stylesheet" href="css/style.css" type="text/css">

        <style>
            /* Custom CSS */
            body {
                font-family: 'Cairo', sans-serif;
                background-color: #f8f9fa;
                margin: 0;
                padding: 0;
            }

            .container {
                max-width: 1100px;
                margin: 0 auto;

            }

            .form-container {
                background-color: #ffffff;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                padding: 30px;
                margin: 50px auto;
                width: 80%;
            }

            .form-container h2 {
                text-align: center;
                color: #343a40;
                margin-bottom: 20px;
                font-size: 28px;
                font-weight: 600;
            }

            .form-container label {
                display: block;
                margin-bottom: 8px;
                color: #495057;
                font-weight: 500;
            }

            .form-container input[type="text"],
            .form-container input[type="password"],
            .form-container input[type="email"],
            .form-container input[type="date"],
            .form-container select {
                width: calc(100% - 20px);
                padding: 10px;
                margin-bottom: 20px;
                border: 1px solid #ced4da;
                border-radius: 4px;
                box-sizing: border-box;
                font-size: 16px;
            }

            .form-container input[type="submit"] {
                width: 100%;
                padding: 15px;
                background-color: #007bff;
                border: none;
                border-radius: 4px;
                color: #ffffff;
                font-size: 16px;
                font-weight: 600;
                cursor: pointer;
                transition: background-color 0.3s;
            }

            .form-container input[type="submit"]:hover {
                background-color: #0056b3;
            }

            .alert {
                padding: 15px;
                margin-bottom: 20px;
                border: 1px solid transparent;
                border-radius: 4px;
                text-align: center;
                font-weight: 500;
            }

            .alert-info {
                color: #0c5460;
                background-color: #d1ecf1;
                border-color: #bee5eb;
            }

            .hero {
                padding: 50px 0;
                background-image: url('img/checkoutss.jpg');
                background-size: cover;
                background-position: center;
                color: #ffffff;
                margin-left: 20px;
                margin-right: 20px;
            }

            .hero .hero-text {
                text-align: center;
            }

            .hero .hero-text h2 {
                font-size: 36px;
                font-weight: 700;
                color: white;
            }

            .hero .hero-text p {
                font-size: 18px;
                color: white;
            }
        </style>
    </head>
    <body>

        <jsp:include page="header.jsp"></jsp:include>

            <section class="hero">
                <div class="container">
                    <div class="hero-text">
                        <h2>Thay Đổi Mật Khẩu</h2>
                        <p>Quản lý thông tin cá nhân của bạn một cách dễ dàng</p>
                    </div>
                </div>
            </section>

            <div class="container">
                <div class="row">
                    <div class="col-lg-8 offset-lg-2">
                        <div class="form-container">
                            <h2>Đổi mật khẩu</h2>
                            <form method="get" action="changepass">
                                <label for="user">Tên đăng nhập: </label>
                                <input type="text" name="user" required><br>
                                <label for="oldpass">Mật khẩu cũ:</label>
                                <input type="password" name="oldpass" required><br>
                                <label for="newpass">Mật khẩu mới:</label>
                                <input type="password" name="newpass" required><br>
                                <label for="repass">Nhập lại mật khẩu mới:</label>
                                <input type="password" name="repass" required><br>
                            <% 
                    String error = (String) request.getAttribute("error");
                    if (error != null) { 
                            %>
                            <div style="color: red" class="alert alert-info">
                                <%= error %>
                            </div>
                            <%
                                } 
                            %>    
                            <% 
                        String msg = (String) request.getAttribute("msg");
                        if (msg != null && error == null) { 
                            %>
                            <div class="alert alert-info">
                                <%= msg %>
                            </div>
                            <%
                                } 
                            %>    

                            <input type="submit" value="Đổi mật khẩu">
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <jsp:include page="footer.jsp"></jsp:include>

        <!-- JavaScript Files -->
        <script src="js/jquery-3.3.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.nice-select.min.js"></script>
        <script src="js/jquery-ui.min.js"></script>
        <script src="js/jquery.slicknav.js"></script>
        <script src="js/mixitup.min.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/main.js"></script>
    </body>
</html>
