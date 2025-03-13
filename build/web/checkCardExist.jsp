<%-- 
    Document   : checkCardExist.jsp
    Created on : Jun 27, 2024, 11:46:43 PM
    Author     : Duc Long
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="description" content="Ogani Template">
        <meta name="keywords" content="Ogani, unica, creative, html">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">

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

        <title>Create Borrow</title>
        <style>
            /* Custom CSS */
            body {
                font-family: 'Cairo', sans-serif;
                background-color: #f8f9fa;
                margin: 0;
            }
            .form-container {
                background-color: #ffffff;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                padding: 30px;
                max-width: 500px;
                margin: 50px auto;
            }
            .form-container h2 {
                text-align: center;
                color: #343a40;
                margin-bottom: 20px;
            }
            .form-container label {
                display: block;
                margin-bottom: 8px;
                color: #495057;
            }
            .form-container input[type="text"],
            .form-container input[type="email"],
            .form-container input[type="date"] {
                width: calc(100% - 22px);
                padding: 10px;
                margin-bottom: 20px;
                border: 1px solid #ced4da;
                border-radius: 4px;
                box-sizing: border-box;
                font-size: 16px;
            }
            .form-container input[type="submit"] {
                width: 100%;
                padding: 10px;
                background-color: #007bff;
                border: none;
                border-radius: 4px;
                color: #ffffff;
                font-size: 16px;
                cursor: pointer;
                transition: background-color 0.3s;
            }
            .form-container input[type="submit"]:hover {
                background-color: #0056b3;
            }
            
            .header-card {
                padding: 60px 20px;
                background-image: url('img/borrow1.jpg');
                background-size: cover;
                background-position: center;
                color: #ffffff;
                display: flex;
                align-items: center;
                justify-content: center;
                text-align: center;
                margin-bottom: 30px;
                border-radius: 8px;
                height: 140px;
            }
            .header-card h2 {
                font-size: 36px;
                font-weight: 700;
                color: white;
                margin-bottom: 10px;
            }
            .header-card p {
                font-size: 18px;
                color: white;
            }
            .error-message {
                color: red;
                font-style: italic;
                text-align: center;
            }
            /* End of Custom CSS */
        </style>
    </head>
    <body>

        <jsp:include page="header.jsp"></jsp:include>
            <section class="hero">
                <div class="container">
                    <div class="row">
                    <jsp:include page="menu.jsp"></jsp:include>

                        <div class="col-lg-9">
                            <section class="header-card">
                                <div class="header-card-text">
                                    <h2>Tạo Phiếu Mượn</h2>
                                    <p>Nơi lưu giữ tốt nhất về những cuốn sách đã mượn</p>
                                </div>
                            </section>
                            <div class="form-container">
                                <h2>Kiểm tra thẻ</h2>
                                <form action="checkCardExist" method="get">
                                    <label for="card">Mã thẻ: </label>
                                    <input type="text" id="card" name="cardid"><br>
                                    <p style="color: red">${error != null ? error : ""}</p>
                                <input type="submit" value="Tạo Phiếu Mượn">
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Hero Section End -->

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
