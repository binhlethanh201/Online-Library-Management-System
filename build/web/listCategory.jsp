<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
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
        <title>ThuVien</title>
    </head>
    <script type="text/javascript">
        function hideMessage() {
            var messageElement = document.getElementById("message");
            if (messageElement) {
                setTimeout(function () {
                    messageElement.style.display = "none";
                }, 2000); // 2 giây
            }
        }
        
        function doDelete(id, name) {
            if (confirm("Sau khi chọn OK sẽ xóa Loại Sách = " + name)) {
                window.location = "delete?id=" + id;
            }
        }

        window.onload = hideMessage;
    </script>
    <body>
        <jsp:include page="header.jsp"></jsp:include>
        <!-- Hero Section Begin -->
        <section class="hero py-5">
            <div class="container">
                <div class="row">
                    <jsp:include page="menu.jsp"></jsp:include>
                    <div class="col-lg-9">
                        <h3 class="mb-4"><strong>Quản Lý Loại Sách</strong></h3>
                        <div class="mb-3">
                            <a href="#addModal" class="btn btn-success" data-toggle="modal">
                                <span>Thêm</span>
                            </a>
                        </div>
                        <h6 id="message" class="text-danger">${requestScope.message}</h6>
                        <form action="listCategory" method="post" class="mb-4">
                            <div class="input-group">
                                <input required name="txt" class="form-control" type="text" value="${requestScope.txt}" placeholder="Search by CategoryName">
                                <div class="input-group-append">
                                    <input type="submit" class="btn btn-primary" value="Ok">
                                </div>
                            </div>
                        </form>
                       
                            <table class="table table-striped table-hover mt-4">
                                <thead >
                                    <tr>
                                        <th>Loại Sách</th>
                                        <th>Hành Động</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${listC}" var="u">
                                        <tr>
                                            <td>${u.getCategoryName()}</td>
                                            <td>
                                                <a href="#" class="btn btn-danger btn-sm" onclick="doDelete('${u.getCategoryId()}', '${u.getCategoryName()}')">Xóa</a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                       
                    </div>
                </div>
            </div>
        </section>
        <!-- Hero Section End -->

        <div id="addModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="addCategory" method="get">
                        <div class="modal-header">						
                            <h4 class="modal-title">Edit Category</h4>
                            <input type="hidden" name="ID" value="${requestScope.id}"/>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">					
                            <div class="form-group">
                                <label>CategoryName</label>
                                <input name="nameCat" type="text" class="form-control" required>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-secondary" data-dismiss="modal" value="Cancel">
                            <input type="submit" class="btn btn-success" value="Edit">
                        </div>
                    </form>
                </div>
            </div>
        </div>

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
