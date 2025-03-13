<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

        <title>Book Detail</title>

        <style>
            body {
                font-family: 'Cairo', sans-serif;
                background-color: #F7F7F7;
                color: white;
            }
            .hero {
                background-color: #F7F7F7;
                color: white;
                padding: 20px 0;
            }
            .hero__search__form h4 {
                font-weight: 600;
            }
            
            .card-body {
                background-color: #ffffff;
                border-radius: 10px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                padding: 20px;
                margin-bottom: 30px;
            }
            .title {
                font-weight: 700;
                color: #333;
            }
            .item-property p {
                margin-bottom: 10px;
                font-size: 16px;
                color: #666;
            }
            .btn-primary {
                background-color: #4caf50;
                border-color: #4caf50;
                color: white;
                font-weight: 600;
                transition: background-color 0.3s, border-color 0.3s;
            }
            .btn-primary:hover {
                background-color: #45a049;
                border-color: #45a049;
            }
            .btn-back {
                background-color: #ffcc00;
                border-color: #ffcc00;
                color: white;
                font-weight: 600;
                transition: background-color 0.3s, border-color 0.3s;
            }
            .btn-back:hover {
                background-color: #ff9900;
                border-color: #ff9900;
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
                border-radius: 10px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
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
                color: #333;
            }
            .featured__item__text h6 a:hover {
                text-decoration: underline;
            }
            .featured__item__text .price {
                font-weight: normal;
                color: #4caf50;
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
                background-color: #4caf50;
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
                background-color: #4caf50;
                color: white;
                border: 1px solid #4caf50;
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
                border-radius: 10px;
                overflow: hidden;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
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
                font-weight: bolder;
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
        <section class="hero">
            <div class="container">
                <div class="row">
                    <jsp:include page="menu.jsp"></jsp:include>
                    <div class="col-lg-9">
                        <div class="hero__search">
                            <div class="hero__search__form">
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
                        <!-- Featured Section Begin -->
                        <div class="row">
                            <aside class="col-sm-5 border-right">
                                <article class="gallery-wrap"> 
                                    <div class="img-big-wrap">
                                        <div> <a href="#"><img src="${i.getImages()}" alt="Book Image"></a></div>
                                    </div>
                                </article>
                            </aside>
                            <aside class="col-sm-7">
                                <article class="card-body p-5">
                                    <h3 class="title mb-3">${i.getBookName()}</h3>
                                    <dl class="item-property">
                                        <dd><p>Tác Giả: ${i.getAuthor()}</p></dd>
                                        <dd><p>Thể Loại: ${cate.getCategoryName()}</p></dd>
                                       <!-- <dd><p>Nhà Xuất Bản: ${i.getPublisherName()}</p></dd> -->
                                        <dd><p>Nhà xuất bản: <a href="publisherinfor?publisherID=${pu.getPublisherID()}">${pu.getPublisherName()}</a></p></dd>
                                        <dd><p>Năm Xuất Bản: ${i.getPublishingYear()}</p></dd>
                                        <dd><p>Thông Tin: ${i.getDescription()}</p></dd>

                                        <dd>     
                                            <c:choose>
                                                <c:when test="${empty sessionScope.user}">
                                                    <button class="btn btn-primary" onclick="alert('Bạn cần đăng nhập để mượn sách')">Mượn</button>
                                                    <a href="javascript:history.back()" class="btn btn-back">Back</a>
                                                </c:when>
                                                <c:otherwise>
                                                    <c:choose>
                                                        <c:when test="${sessionScope.user.username eq 'employee1' || sessionScope.user.username eq 'employee2'}">
                                                            <a href="updateBookInfo?bookID=${i.getBookID()}" class="btn btn-primary">Cập nhật thông tin sách</a>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <a href="borrowdetail?bookID=${i.getBookID()}" class="btn btn-primary">Mượn</a>
                                                        </c:otherwise>
                                                    </c:choose>
                                                    <a href="javascript:history.back()" class="btn btn-back">Quay lại</a>
                                                </c:otherwise>
                                            </c:choose>
                                        </dd>
                                    </dl>
                                </article>
                            </aside>
                        </div>
                        <!-- Featured Section End -->
                        <div class="text-center"><h4>Sách Liên Quan</h4></div><br>
                        <section class="featured spad">
                            <div class="container">
                                <div class="row featured__filter">
                                    <c:forEach items="${listN}" var="p"> 
                                        <div class="col-lg-3 col-md-4 col-sm-6 mix oranges fresh-meat">
                                            <div class="featured__item">
                                                <div class="featured__item__pic set-bg" data-setbg="${p.getImages()}">
                                                    <img src="${p.getImages()}" alt="${p.getBookName()}">
                                                </div>  
                                                <div class="featured__item__text">
                                                    <h6>
                                                        <a href="bookdetail?BookId=${p.getBookID()}">
                                                            ${p.getBookName()}
                                                        </a>
                                                    </h6>
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
