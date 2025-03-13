<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
        <style>
            /* Custom CSS */
            body {
                font-family: 'Cairo', sans-serif; /* Sử dụng font Cairo từ Google Fonts */
                line-height: 1.6;
            }

            .hero {
                background-color: #fff; /* Màu nền cho phần Hero */
                margin-bottom: 30px;
            }

            .hero h3 {
                font-size: 32px;
                font-weight: 600;
                color: #333;
            }

            table {
                width: 100%;
                border-collapse: collapse;
                margin-bottom: 20px;
                background-color: #fff; /* Màu nền cho bảng */
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* Đổ bóng cho bảng */
            }

            th, td {
                text-align: left;
                padding: 12px;
                border-bottom: 1px solid #ddd; /* Đường viền dưới cho từng dòng */
            }

            th {
                background-color: #f2f2f2;
            }

            /* Màu nền và màu chữ cho từng trạng thái */
            td.status-da-tra, td.status-dang-muon, td.status-chua-tra {
                color: #fff;
                border-radius: 40px; /* Bo tròn viền nhỏ hơn */
                padding: 8px 12px; /* Tăng độ dày và khoảng cách xung quanh nội dung */
            }

            td.status-da-tra {
                background-color: #28a745; /* Màu xanh lá cây cho Đã trả */
            }

            td.status-dang-muon {
                background-color: #007bff; /* Màu xanh dương cho Đang mượn */
            }

            td.status-chua-tra {
                background-color: #dc3545; /* Màu đỏ cho Chưa trả */
            }



            .btn-back {
                margin-top: 10px;
                padding: 10px 20px;
                background-color: #007bff;
                color: #fff;
                border: none;
                text-transform: uppercase;
                font-weight: bold;
                border-radius: 5px;
                text-decoration: none;
                display: inline-block;
                transition: background-color 0.3s ease;
            }

            .btn-back:hover {
                background-color: #0056b3;
            }

            /* Hiệu ứng hover cho các dòng trong bảng */
            table tbody tr:hover {
                background-color: #f9f9f9;
                transition: background-color 0.3s;
            }
            /* End of Custom CSS */

        </style>
        <title>History</title>
    </head>
    <body>

        <jsp:include page="header.jsp"></jsp:include>

            <!-- Hero Section Begin -->
            <section class="hero">
                <div class="container">
                    <div class="row">
                        <h3 style="margin: 20px auto; text-align: center;"><strong>Lịch Sử Mượn Sách</strong></h3>
                        <div style="width: 95%; margin: 0 auto">
                            <table>
                                <thead>
                                    <tr>
                                        <th>Mã Phiếu Mượn</th>
                                        <th>Tên Sách</th>
                                        <th>Số Lượng</th>
                                        <th>Ngày Mượn</th>
                                        <th>Ngày Trả</th>
                                        <th>Ngày Trả Thực Tế</th>
                                        <th>Trạng Thái</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${listB}" var="b">
                                    <tr>
                                        <td>${b.getBorrowID()}</td>
                                        <td>${b.getBookName()}</td>
                                        <td>${b.getAmount()}</td>
                                        <td>${b.getBorrowDate()}</td>
                                        <td>${b.getDeadline()}</td>
                                        <td>${b.getReturnDate()}</td>
                                        <td style="text-align: center" class="<c:choose>
                                                <c:when test="${b.getStatus() == 'Đã trả'}">status-da-tra
                                                </c:when>
                                                <c:when test="${b.getStatus() == 'Đang mượn'}">status-dang-muon
                                                </c:when>
                                                <c:when test="${b.getStatus() == 'Chưa trả'}">status-chua-tra
                                                </c:when>
                                            </c:choose>">${b.getStatus()}</td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                        <div style="float: right">
                            <a href="javascript:history.back()" class="btn-back">Quay lại</a>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Hero Section End -->

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
