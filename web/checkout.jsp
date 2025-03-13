<%-- 
    Document   : checkout
    Created on : Jun 24, 2024, 5:37:57 PM
    Author     : Duc Long
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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

        <title>Check Out</title>

        <style>
            .body {
                font-family: 'Arial', sans-serif;
            }
            .title {
                font-weight: 700;
                margin-bottom: 20px;
            }
            .item-property p {
                margin-bottom: 10px;
            }
            .btn-back {
                margin-bottom: 20px;
            }
            .col-sm-5.border-right {
                padding-right: 20px;
            }
            .img-big-wrap {
                text-align: center;
            }
            .img-big-wrap img {
                max-width: 100%;
                max-height: 300px;
            }
            .col-sm-7 {
                padding-left: 20px;
            }

            .featured__item__pic__hover li:nth-child(2) a i {
                display: none;
            }
            .featured__item__pic__hover li:nth-child(2) a::after {
                content: "Buy";
            }
            .featured__item__text h6 a {
                font-weight: bold;
                text-decoration: none;
            }
            .featured__item__text h6 a:hover {
                text-decoration: underline;
            }
            .featured__item__text .price {
                font-weight: normal;
            }
            .checkout__order {
                background: #f5f5f5;
                padding: 40px;
                padding-top: 30px;
                width: 40%;
                border-radius: 20px;
            }
            
            .row{
                justify-content: center;
            }
        </style>
    </head>
    <body>
        <script type="text/javascript">
            function sendDataToServlet() {
                // Sử dụng Ajax để gửi dữ liệu form đến servlet
                $.ajax({
                    type: "GET",
                    url: "checkout",
                    data: $("#borrowForm").serialize(), // Serialize form data
                    success: function (response) {
                        // Xử lý phản hồi từ servlet
                        alert("Bạn đã mượn sách thành công"); // Hiển thị alert khi thành công
                        window.location.href = "history?user=${sessionScope.user.username}";
                    },
                    error: function (xhr, status, error) {

                    }
                });
            }
        </script>
        <jsp:include page="header.jsp"></jsp:include>
        <section style="margin-bottom: -60px" class="hero">
                <div class="container">
                    <div class="row">
                        
                        <div class="col-lg-12">
                            <div class="hero__search">
                                <div class="hero__search__form" style="color: lightgreen">
                                    <h4>THÔNG TIN CHI TIẾT</h4>
                                </div>
                                <div class="hero__search__phone">
                                    <div class="hero__search__phone__icon">
                                        <i class="fa fa-phone"></i>
                                    </div>
                                    <div class="hero__search__phone__text">
                                        <h5>0969.969.969</h5>
                                        <span>support 24/7 time</span>
                                    </div>
                                </div>
                            </div>
                            <section style="margin-bottom: -30px" class="breadcrumb-section set-bg" data-setbg="img/checkoutss.jpg">
                                <div class="container">
                                    <div class="row">
                                        <div class="col-lg-12 text-center">
                                            <div class="breadcrumb__text">
                                                <h2>Phiếu mượn</h2>
                                                <div class="breadcrumb__option">
                                                    <a href="content">Home</a>
                                                    <span>Phiếu mượn</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </section>

                            <section class="checkout spad">
                                <div class="container">
                                    <div class="row">
                                        <div class="col-lg-4">
                                            <img style="border-radius: 20px" src="img/LM-WEB.png">
                                        </div>
                                        <div class="checkout__order">
                                            <h4 class="checkout__order-title">Phiếu Mượn</h4>
                                            <p style="font-weight: bold">Mã Phiếu Mượn: <input value="${requestScope.BorrowID}" name="borrowId" readonly></p>
                                        <p style="font-weight: bold">Mã Thẻ : <input value="${requestScope.CardID}" name="cardId" readonly></p>

                                        <form id="borrowForm" method="get" action="checkout">
                                            <table style="width: 100%">
                                                <tr>
                                                    <th style="text-align: center">Tên Sách</th>
                                                    <th style="text-align: center">Số lượng</th>
                                                </tr>
                                                <c:forEach items="${cart}" var="p">
                                                    <tr>
                                                    <input value="${requestScope.pid}" name="pid" type="hidden">
                                                    <input value="${p.getBook().getBookID()}" name="bid" type="hidden">
                                                    <td><input style="width: 317px" type="text" name="bookname" value="${p.getBook().getBookName()}" readonly class="checkout__order-item-name"></td>
                                                    <td style="text-align: center; margin: 0px"><input style="width: 72px; text-align: center" type="text" name="amount_${p.getBook().getBookID()}" value="${p.getAmount()}" readonly class="checkout__order-item-price"></td>
                                                    </tr>
                                                </c:forEach>
                                            </table>
                                            <p style="font-weight: bold; margin-top: 20px">Ngày Mượn: <input value="${requestScope.validFromStr}" name="validFrom" readonly></p>
                                            <p style="font-weight: bold">Ngày Trả: <input value="${requestScope.validThruStr}" name="validThru" readonly></p>
                                            <button type="button" id="borrowButton" onclick="sendDataToServlet()" class="site-btn">Mượn Ngay</button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </section>
                    </div>
                </div>
            </div>
        </section>
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