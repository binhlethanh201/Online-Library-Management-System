<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Library Management</title>
        <!-- Add your CSS links here -->
        <style>
            /* Add your custom CSS styles here */
            .header__top {
                background-color: #f2f2f2;
                padding: 10px 0;
            }
            .header__top__left {
                margin-right: 20px;
            }
            .header__top__right {
                text-align: right;
            }
            .header__top__right__auth {
                margin-left: 10px;
            }
            .header__logo {
                margin-top: 10px;
            }
            .header__cart {
                text-align: right;
            }

            .header__menu ul li .header__menu__dropdown li {
                margin-right: 0;
                display: block;
            }

            .header__menu ul li .header__menu__dropdown li:hover>a {
                color: #7fad39;
            }

            .header__menu ul li .header__menu__dropdown li a {
                text-transform: capitalize;
                color: #ffffff;
                font-weight: 400;
                padding: 5px 15px;
            }

            .header__menu ul li.active a {
                color: #7fad39;
            }

            .header__menu ul li:hover .header__menu__dropdown {
                top: 30px;
                opacity: 1;
                visibility: visible;
            }
            /* Add more styles as needed */
        </style>
    </head>
    <body>

        <!-- Page Preloder -->
        <div id="preloder">
            <div class="loader"></div>
        </div>

        <!-- Header Section Begin -->
        <header class="header">
            <div class="header__top">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-6 col-md-6">
                            <div class="header__top__left">
                                <ul>
                                    <li><i class="fa fa-envelope"></i> Quản Lý Thư Viện</li>
                                        <c:if test="${sessionScope.user != null}">
                                        <li><i class="fa fa-user"></i> Chào mừng: ${sessionScope.user.username}</li>
                                        </c:if>
                                </ul>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-6">
                            <div class="header__top__right">
                                <div class="header__top__right__social">
                                    <a href="https://www.facebook.com/phamduclong27092004"><i class="fa fa-facebook"></i></a>
                                    <a href="https://www.facebook.com/phamduclong27092004"><i class="fa fa-twitter"></i></a>
                                    <a href="https://www.facebook.com/phamduclong27092004"><i class="fa fa-linkedin"></i></a>
                                </div>
                                <div class="header__top__right__language">
                                    <c:if test="${sessionScope.user != null && (sessionScope.user.getRoleID() == 2)}">
                                        <div style="margin-right: 10px;"><a href="userexist.jsp" style="color: black; text-decoration: none;">Làm thẻ</a></div>
                                        <div class="header__menu__dropdown">
                                            <a href="#" style="color: black; text-decoration: none;">Phiếu mượn</a>
                                            <ul style="list-style-type: none; padding: 0; background-color: #f2f2f2;">
                                                <li><a href="checkCardExist.jsp" style="color: black; text-decoration: none;">Tạo </a></li>
                                                <li><a href="borrowManager" style="color: black; text-decoration: none;">Quản lý</a></li>
                                            </ul>
                                        </div>
                                        <div><a href="profile?username=${sessionScope.user.username}" style="color: black; text-decoration: none;">Thông tin</a></div>
                                        <div><a href="changepass.jsp" style="color: black; text-decoration: none;">Tài khoản</a></div>                                   
                                        <div><a href="logout" style="color: black; text-decoration: none;">Đăng xuất</a></div>

                                    </c:if>
                                    <c:if test="${sessionScope.user != null && sessionScope.user.getRoleID() == 1}">
                                        <div><a href="history?user=${sessionScope.user.getUsername()}" style="color: black;">Lịch sử</a></div>
                                        <div><a href="profile?username=${sessionScope.user.username}" style="color: black; text-decoration: none;">Thông tin</a></div>
                                        <div><a href="changepass.jsp" style="color: black; text-decoration: none;">Tài khoản</a></div>                                               
                                        <div><a href="logout" style="color: black;">Đăng xuất</a></div>
                                    </c:if>

                                    <c:if test="${sessionScope.user != null && sessionScope.user.getRoleID() == 3}">
                                        <div><a href="logout" style="color: black; text-decoration: none;"></a></div>                                            <div><a href="logout" style="color: black;">Đăng xuất</a></div>
                                    </c:if>

                                    <c:if test="${sessionScope.user == null}">
                                        <div class="header__top__right__auth">
                                            <a href="login.jsp"><i class="fa fa-user"></i>Đăng nhập</a>
                                        </div>
                                    </c:if>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-lg-3">
                        <div class="header__logo">
                            <a href="home"><h2 style="color: #7fad39; font-weight: bolder">Thư Viện G2</h2></a>
                        </div>
                    </div>
                    <div class="col-lg-6">
                    </div>
                    <div class="col-lg-3">
                        <div class="header__cart">
                            <ul>
                                <c:if test="${sessionScope.user.getRoleID()==1}">
                                    <li><a href="borrowdetail.jsp"><i class="fa fa-shopping-bag"></i> <span>${numItems}</span></a></li>
                                    </c:if>
                                    <c:if test="${sessionScope.user == null}">
                                    <li><a href="login.jsp"><i class="fa fa-shopping-bag"></i></a></li>
                                        </c:if>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="humberger__open">
                    <i class="fa fa-bars"></i>
                </div>
            </div>
        </header>

        <!-- Add your content here -->

        <!-- Add your JavaScript links and scripts here -->

    </body>
</html>
