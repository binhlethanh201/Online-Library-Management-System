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
                        <h2>Thông tin cá nhân</h2>
                        <p>Quản lý thông tin cá nhân của bạn một cách dễ dàng</p>
                    </div>
                </div>
            </section>

            <div class="container">
                <div class="row">
                    <div class="col-lg-8 offset-lg-2">
                        <div class="form-container">
                        <% 
                            String msg = (String) session.getAttribute("msg");
                            if (msg != null) { 
                        %>
                        <div class="alert alert-info">
                            <%= msg %>
                        </div>
                        <%
                                session.removeAttribute("msg");  // Remove the message after displaying
                            } 
                        %>
                        <form method="post" action="profile" onsubmit="return validateForm()">
                            <label for="Name">Họ tên:</label>
                            <input type="text" name="Name" value="${r.name}"><br>
                            <input type="hidden" name="pid" value="${r.personID}">

                            <label for="Gender">Giới tính:</label>
                            <select name="Gender" id="Gender">
                                <option value="Nam" <c:if test="${r.gender == 'Nam'}">selected</c:if>>Nam</option>
                                <option value="Nữ" <c:if test="${r.gender == 'Nữ'}">selected</c:if>>Nữ</option>
                                </select><br>

                                <label style="margin-top: 40px" for="DateOfBirth">Ngày sinh:</label>
                                <input type="date" name="DateOfBirth" value="${r.getDateOfBirth()}"><br>

                            <label for="Address">Địa chỉ:</label>
                            <input type="text" name="Address" value="${r.address}"><br>

                            <label for="Email">Email:</label>
                            <input type="email" name="Email" value="${r.email}"><br>

                            <label for="Phone">Số điện thoại:</label>
                            <input type="text" name="Phone" value="${r.phone}"><br>
                            <input type="hidden" name="username" value="${username}"><br>
                            <input type="submit" value="Cập nhật thông tin" name="update">
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
