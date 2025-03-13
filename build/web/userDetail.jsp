<%-- 
    Document   : UserDetail
    Created on : 19 Jun 2024, 07:40:43
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
    <body>

        <jsp:include page="header.jsp"></jsp:include>
            <!-- Hero Section Begin -->
            <section class="hero">
                <div class="container">
                    <div class="row">
                    <jsp:include page="menu.jsp"></jsp:include>
                        <div class="col-lg-9">
                            <h3><strong>Thông tin người dùng</strong></h3>                            
                            <table class="table table-striped table-hover">
                                <thead>
                                    <tr>
                                        <th>Thông Tin</th>
                                        <th>Giá Trị</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>Tài Khoản</td>
                                        <td>${person.username}</td>
                                </tr>
                                <tr>
                                    <td>Tên</td>
                                    <td>${person.name}</td>
                                </tr>
                                <tr>
                                    <td>Giới Tính</td>
                                    <td>${person.gender}</td>
                                </tr>
                                <tr>
                                    <td>Ngày Sinh</td>
                                    <td>${person.birth}</td>
                                </tr>
                                <tr>
                                    <td>Địa Chỉ</td>
                                    <td>${person.address}</td>
                                </tr>
                                <tr>
                                    <td>Email</td>
                                    <td>${person.email}</td>
                                </tr>
                                <tr>
                                    <td>SDT</td>
                                    <td>${person.phone}</td>
                                </tr>
                                <tr>
                                    <td>Vai TRò</td>
                                    <td>${person.roleName}</td>
                                </tr>
                            </tbody>
                        </table>
                        <form action="userDetail" method="post">
                              <input name="id" value="${requestScope.id}" type="hidden"/>
                            <label>Vai Trò</label>
                            <div class="form-container">
                                <div class="form-group">
                                    <select name="roleID" class="form-select" aria-label="Default select example">
                                        <c:forEach items="${listR}" var="c">
                                            <option value="${c.getRoleID()}" ${c.getRoleID() == person.roleID ? "selected" : ""}>
                                                ${c.getRoleName()}
                                            </option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <input type="submit" value="Thay Đổi"/>
                            </div>
                        </form>
                             <a href="javascript:history.back()" class="btn btn-primary">Quay Về</a>

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


