<%-- 
    Document   : listPublisher
    Created on : 24 Jun 2024, 10:32:54
    Author     : admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">    <meta charset="UTF-8">
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
        <title>ThuVien</title>
    </head>
    <script type="text/javascript">
        // Hàm để ẩn thông báo sau 2 giây
        function hideMessage() {
            var messageElement = document.getElementById("message");
            if (messageElement) {
                setTimeout(function () {
                    messageElement.style.display = "none";
                }, 2000); // 2 giây
            }
        }

        // Gọi hàm hideMessage khi trang đã tải xong
        window.onload = hideMessage;
    </script>
    <body>


        <jsp:include page="header.jsp"></jsp:include>
            <!-- Hero Section Begin -->
            <section class="hero">
                <div class="container">
                    <div class="row">
                    <jsp:include page="menu.jsp"></jsp:include>
                        <div class="col-lg-9">
                            <h3><strong>Tổng Số lượng sách</strong></h3> 
                           <br/>
                            <h6 id="message">${requestScope.mess}</h6>
                       
                        <table class="table table-striped table-hover">
                            <thead>
                                <tr>
                                    <th>Số Lượng Sách</th>
                                    <th>Đơn Vị</th>
                                    
                                </tr>
                            </thead>

                            <tbody>
                                <c:forEach items="${listd}" var="u">
                                    <tr>
                                        <td>${u.getCategoryName()}</td>
                                        <td>${u.getBookCount()}</td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
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