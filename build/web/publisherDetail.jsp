<%-- 
    Document   : publisherDetail
    Created on : 24 Jun 2024, 10:38:26
    Author     : admin
--%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html >
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
        <title>ThuVien</title>
    </head>
    <style>
        .form-container {
            display: flex;
            align-items: center;
        }

        .form-container label {
            margin-right: 10px;
        }

        .form-container .form-group {
            margin-right: 10px;
        }
    </style>
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
                            <h3><strong>Thông tin Nhà Xuất Bản</strong></h3>  
                            <table class="table table-striped table-hover">
                                <thead>

                                </thead>
                                <tbody>
                                    <tr>
                                        <td>Nhà Xuất Bản</td>
                                        <td>${pu.publisherName}</td>
                                    </tr>
                                    <tr>
                                        <td>Địa Chỉ</td>
                                        <td>${pu.address}</td>
                                    </tr>
                                    <tr>
                                        <td>Website</td>
                                        <td><a href="https://${pub.website}" target="_blank" rel="noopener noreferrer">${pu.website}</a></td>
                                    </tr>
                                    <tr>
                                        <td>Email</td>
                                        <td>${pu.email}</td>
                                    </tr>
                                    <tr>
                                        <td>SDT</td>
                                        <td>${pu.phone}</td>
                                    </tr>

                            </tbody>
                        </table>
                        <a href="listPublisher" class="btn btn-primary">Quay Về</a>

                    </div>
                </div>
            </div>

            <div id="editModal" class="modal fade">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form action="publisherDetail" method="post">
                            <div class="modal-header">						
                                <h4 class="modal-title">Edit Publisher</h4>
                                <input type="hidden" name="ID" value="${requestScope.id}"/>
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            </div>
                            <div class="modal-body">					
                                <div class="form-group">
                                    <label>Nhà Xuất Bản</label>
                                    <input name="name" value="${pub.publisherName}" type="text" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Địa Chỉ</label>
                                    <input value="${pub.address}" name="address" type="text" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Website</label>
                                    <input value="${pub.website}" name="website" type="text" class="form-control" required>
                                </div> 
                                <div class="form-group">
                                    <label>Email</label>
                                    <input value="${pub.email}" name="email"  type="text" class="form-control" required ">
                                </div>
                                <div class="form-group">
                                    <label>Phone</label>
                                    <input value="${pub.phone}" name="phone" type="number" class="form-control" required>
                                </div>

                            </div>
                            <div class="modal-footer">
                                <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                                <input type="submit" class="btn btn-success" value="Edit">
                            </div>
                        </form>
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
