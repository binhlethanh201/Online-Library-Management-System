<%@page import="Model.Book"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Cập nhật thông tin sách</title>

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

        <!-- Custom CSS -->
        <style>
            /* Table Styling */
            table {
                width: 100%;
                border-collapse: collapse;
                margin-bottom: 20px;
            }

            th,
            td {
                text-align: left;
                padding: 10px;
            }

            th {
                background-color: #f2f2f2;
            }
        </style>
    </head>
    <body>

        <%-- Include header --%>
        <jsp:include page="header.jsp" />

        <!-- Hero Section Begin -->
        <section class="hero">
            <div class="container">
                <div class="row">
                    <%-- Include menu --%>
                    <jsp:include page="menu.jsp" />

                    <div class="col-lg-9">
                        <h2 style="margin-bottom: 20px">Cập nhật thông tin sách</h2>
                        <%
                            Book b = (Book) request.getAttribute("book");
                            if(b != null){
                        %>
                        <%-- Form for updating book information --%>
                        <form action="updateBookInfo" method="post">
                            <div class="form-group">
                                <input type="hidden" name="bookID" value="${book.bookID}">
                            </div>

                            <div class="form-group">
                                <label for="author">Author:</label>
                                <input type="text" class="form-control" id="author" name="author" value="${book.author}">
                            </div>

                            <div class="form-group">
                                <label for="category">Category:</label><br/>
                                <select class="form-control" id="category" name="category">
                                    <c:forEach var="cat" items="${categories}">
                                        <option value="${cat.categoryId}" ${cat.categoryId == book.categoryID ? 'selected' : ''}>
                                            ${cat.categoryName}
                                        </option>
                                    </c:forEach>
                                </select>
                            </div><br/>

                            <div style="margin-top: 10px" class="form-group">
                                <label for="description">Description:</label>
                                <textarea class="form-control" id="description" name="description" rows="4" cols="50">${book.description}</textarea>
                            </div>

                            <button type="submit" class="btn btn-primary">Update</button>
                        </form>

                        <%
                            }
                        %>
                    </div>
                </div>
                <div style="float: right">
                    <a href="javascript:history.back()" class="btn btn-primary">Back to Previous</a>
                </div>
            </div>
        </section>
        <!-- Hero Section End -->

        <!-- Scripts -->
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
