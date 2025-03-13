<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
        <title>Home</title>
        <style>
            body {
                font-family: 'Cairo', sans-serif;
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
            .hero__search__container {
                display: flex;
                align-items: center;
                justify-content: space-between;
                margin-bottom: 20px;
            }
            .hero__search__form {
                flex-grow: 1;
                margin-right: 20px;
                display: flex;
            }
            .hero__search__form input {
                flex-grow: 1;
                border: 1px solid #ddd;
                padding: 10px;
                border-radius: 4px 0 0 4px;
            }
            .hero__search__form button {
                padding: 10px 20px;
                border: none;
                background-color: #4CAF50;
                color: white;
                cursor: pointer;
                border-radius: 0 4px 4px 0;
                transition: background-color .3s;
            }
            .hero__search__form button:hover {
                background-color: #45a049;
            }
            .hero__search__phone {
                display: flex;
                align-items: center;
            }
            .hero__search__phone__icon {
                margin-right: 10px;
            }
            .pagination {
                display: flex;
                justify-content: center;
                padding: 0;
                list-style: none;
            }
            .pagination a {
                color: black;
                float: left;
                padding: 8px 16px;
                text-decoration: none;
                transition: background-color .3s;
                border: 1px solid #ddd;
                margin: 0 4px;
            }
            .pagination a.active {
                background-color: #4CAF50;
                color: white;
                border: 1px solid #4CAF50;
            }
            .pagination a:hover:not(.active) {
                background-color: #ddd;
            }
            .featured__item {
                margin-bottom: 30px;
            }
            .featured__item__pic {
                position: relative;
                background-size: cover;
                background-position: center;
                height: 250px;
                overflow: hidden;
            }
            .featured__item__pic img {
                width: 100%;
                height: 100%;
                object-fit: cover;
                transition: transform .3s;
            }
            .featured__item__pic:hover img {
                transform: scale(1.1);
            }
            .featured__item__text h6 a {
                color: #333;
                display: block;
                overflow: hidden;
                text-overflow: ellipsis;
                white-space: nowrap;
            }
            .featured__item__text h6 {
                margin-bottom: 5px;
            }
            .featured__item__text .price {
                color: #f76b6a;
            }
        </style>
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>
        <!-- Hero Section Begin -->
        <section class="hero">
            <div class="container">
                <div class="row">
                    <jsp:include page="menu.jsp"></jsp:include>
                    <div class="col-lg-9">
                        <div class="hero__search__container">
                            <div class="hero__search__form">
                                <form action="home" method="post">
                                    <input type="text" value="${txt}" name="txt" placeholder="Bạn cần tìm gi?">
                                    <button type="submit" class="site-btn">Tìm Kiếm</button>
                                </form>
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
                        <section class="featured spad">
                            <div class="container">
                                <div class="row featured__filter">
                                    <c:forEach items="${listB}" var="p">
                                        <div class="col-lg-3 col-md-4 col-sm-6 mix oranges fresh-meat">
                                            <div class="featured__item">
                                                <div class="featured__item__pic" style="background-image: url('${p.getImages()}');">
                                                </div>
                                                <div class="featured__item__text">
                                                    <h6><a href="bookdetail?BookId=${p.getBookID()}">${p.getBookName()}</a></h6>
                                                    <h5 class="price">${p.getAuthor()}</h5>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </section>
                        <hr>
                        <!-- Số trang -->
                        <div class="clearfix">
                            <ul class="pagination">
                                <c:set var="page" value="${requestScope.page}" />
                                <c:forEach begin="${1}" end="${requestScope.num}" var="i">
                                    <a href="home?page=${i}" class="pagination-item__link ${page == i ? 'active' : ''}">${i}</a>
                                </c:forEach>
                            </ul>
                        </div>
                        <hr>
                        <div class="text-center"><h4>Sách Mới Nhất</h4></div><br>
                        <section class="featured spad">
                            <div class="container">
                                <div class="row featured__filter">
                                    <c:forEach items="${listN}" var="p">
                                        <div class="col-lg-3 col-md-4 col-sm-6 mix oranges fresh-meat">
                                            <div class="featured__item">
                                                <div class="featured__item__pic" style="background-image: url('${p.getImages()}');">
                                                </div>
                                                <div class="featured__item__text">
                                                    <h6><a href="bookdetail?BookId=${p.getBookID()}">${p.getBookName()}</a></h6>
                                                    <h5 class="price">${p.getAuthor()}</h5>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </section>
                    </div>
                </div>
            </div>
        </section>
        <!-- Hero Section End -->
        <jsp:include page="footer.jsp"></jsp:include>

        <!-- Js Plugins -->
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
