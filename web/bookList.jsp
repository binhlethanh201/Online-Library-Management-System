<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
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
    <style>
    /* Chỉnh kích thước tối đa của ảnh */
    img {
        max-width: 100px; /* Thiết lập chiều rộng tối đa */
        max-height: 100px; /* Thiết lập chiều cao tối đa */
    }

    /* Custom CSS */

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

    input[type=number]::-webkit-outer-spin-button,
    input[type=number]::-webkit-inner-spin-button {
        -webkit-appearance: none;
        margin: 0;
    }

    input[type=number] {
        -moz-appearance: textfield;
    }

    /* Adjust Description and other form elements to be on the same line */
    .modal-body {
        display: flex;
        flex-wrap: wrap;
    }

    .modal-body .form-group {
        width: 100%;
        margin-bottom: 10px;
    }

    .modal-body .form-group label {
        flex-basis: 150px; /* Width of label */
        flex-shrink: 0;
        margin-right: 10px;
    }

    .modal-body .form-group textarea {
        flex-grow: 1; /* Take up remaining space */
    }

    /* End of Custom CSS */
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
                <h3><strong>Product Manager</strong></h3>
                <div>
                    <a href="#addModal" class="btn btn-success" data-toggle="modal"> <span>Add Product</span></a>
                </div>
                <h6>${requestScope.mess}</h6>
                <form action="bookList" method="post">
                    <div class="menu_box_2">
                        <input required name="txt" class="form_1" type="text" value="${txt}" placeholder="Search by productname">
                        <input type="submit" value="Ok">
                    </div>
                </form>
                <div>
                    <table>
                        <thead>
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Image</th>
                            <th>Author</th>
                            <th colspan="6">Actions</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${listB}" var="p" varStatus="status">
                            <tr>
                                <td>${p.getBookID()}</td>
                                <td>${p.getBookName()}</td>
                                <td><img src="${p.getImages()}"></td>
                                <td>${p.getAuthor()}</td>
                                <td>
                                    <a href="bookdetail?BookId=${p.getBookID()}">Detail |</a>
                                    <a href="bookedit?ID=${p.getBookID()}">Edit |</a>
                                    <a href="deleteBook?ID=${p.getBookID()}" onclick="return confirm('DO you want to delete')">Delete</a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
                <!-- Phan trang-->
                <div class="clearfix">
                    <ul class="pagination">
                        <c:set var="page" value="${requestScope.page}" />
                        <c:forEach begin="${1}" end="${requestScope.num}" var="i">
                            <a href="bookList?page=${i}" class="pagination-item__link ${page == i ? 'active' : ''}">${i}</a>
                        </c:forEach>
                    </ul>
                </div>
                <hr>
            </div>
        </div>
    </div>
</section>

<div id="addModal" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <form action="addBook" method="get">
                <div class="modal-header">
                    <h4 class="modal-title">Add Product</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                </div>
                <div class="modal-body">
                   <div class="form-group">
                        <label>Product Name</label>
                        <input name="name" value="${p.getBookName()}" type="text" class="form-control" required>
                    </div>
                    <input type="hidden" name="id" value="${p.getBookID()}">
                    <div class="form-group">
                        <label>Image</label>
                        <input value="${p.getImages()}" name="image" type="file" class="form-control" required>
                        <input type="hidden" id="oldImage" name="oldImage" value="${p.getImages()}">
                    </div>
                    <div class="form-group">
                        <label>Author</label>
                        <input value="${p.getAuthor()}" name="author" type="text" class="form-control" required>
                    </div> 
                    <div class="form-group">
                        <label>PublishingYear</label>
                        <input value="${p.getPublishingYear()}" name="publishingYear" id="editPublishingYear" type="number" class="form-control" required oninput="validateYearInputEdit()">
                    </div>
                    <div class="form-group">
                        <label>Description</label>
                        <textarea name="des" class="form-control" required>${p.getDescription()}</textarea>
                    </div>
                    <label>Category</label>
                    <div class="form-group">
                        <select name="category" class="form-select" aria-label="Default select example">
                            <c:forEach items="${listCa}" var="c">
                                <option value="${c.categoryId}">${c.categoryName}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <br/>
                    <label>Publisher</label>
                    <div class="form-group">
                        <select name="publisher" class="form-select" aria-label="Default select example">
                            <c:forEach items="${listPu}" var="c">
                                <option value="${c.publisherID}">
                                    ${c.publisherName}
                                </option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="modal-footer">
                    <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                                        <input type="submit" class="btn btn-success" value="Add">
                </div>
            </form>
        </div>
    </div>
</div>

<div id="editModal" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <form action="bookedit" method="post">
                <div class="modal-header">						
                    <h4 class="modal-title">Edit Product</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                </div>
                <div class="modal-body">					
                    <div class="form-group">
                        <label>Product Name</label>
                        <input name="name" value="${p.getBookName()}" type="text" class="form-control" required>
                    </div>
                    <input type="hidden" name="id" value="${p.getBookID()}">
                    <div class="form-group">
                        <label>Image</label>
                        <input value="${p.getImages()}" name="image" type="file" class="form-control" required>
                        <input type="hidden" id="oldImage" name="oldImage" value="${p.getImages()}">
                    </div>
                    <div class="form-group">
                        <label>Author</label>
                        <input value="${p.getAuthor()}" name="author" type="text" class="form-control" required>
                    </div> 
                    <div class="form-group">
                        <label>PublishingYear</label>
                        <input value="${p.getPublishingYear()}" name="publishingYear" id="editPublishingYear" type="number" class="form-control" required oninput="validateYearInputEdit()">
                    </div>
                    <div class="form-group">
                        <label>Description</label>
                        <textarea name="des" class="form-control" required>${p.getDescription()}</textarea>
                    </div>
                    <label>Category</label>
                    <div class="form-group">
                        <select name="category" class="form-select" aria-label="Default select example">
                            <c:forEach items="${listCa}" var="c">
                                <option value="${c.categoryId}" ${c.categoryId == p.categoryID ? "selected" : ""}>${c.categoryName}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <br/>
                    <label>Publisher</label>
                    <div class="form-group">
                        <select name="publisher" class="form-select" aria-label="Default select example">
                            <c:forEach items="${listPu}" var="c">
                                <option value="${c.publisherID}" ${c.publisherID == p.publisherID ? "selected" : ""}>
                                    ${c.publisherName}
                                </option>
                            </c:forEach>
                        </select>
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

<script src="js/jquery-3.3.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.nice-select.min.js"></script>
<script src="js/jquery-ui.min.js"></script>
<script src="js/jquery.slicknav.js"></script>
<script src="js/mixitup.min.js"></script>
<script src="js/owl.carousel.min.js"></script>
<script src="js/main.js"></script>

<script>
    // check publishing year input in Add Product modal
    function validateYearInput() {
        var inputYear = document.getElementById('publishingYear').value;
        var currentYear = new Date().getFullYear();
        
        if (inputYear >= 2025) {
            alert("Publishing year must be less than 2025.");
            document.getElementById('publishingYear').value = ''; // Clear the input field
        }
    }

    // check year input in Edit Product modal
    function validateYearInputEdit() {
        var inputYear = document.getElementById('editPublishingYear').value;
        var currentYear = new Date().getFullYear();
        
        if (inputYear >= 2025) {
            alert("Publishing year must be less than 2025.");
            document.getElementById('editPublishingYear').value = '';
        }
    }

    // Show edit modal automatically if URL contains 'bookedit'
    $(document).ready(function () {
        if (window.location.href.includes('bookedit')) {
            $('#editModal').modal('show');
        }
    });
</script>
</body>
</html>

