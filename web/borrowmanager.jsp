<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
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

        <title>Quản Lý Phiếu Mượn</title>
        <style>
            /* Custom CSS */
            body {
                font-family: 'Cairo', sans-serif;
                background-color: #f8f9fa;
                margin: 0;
            }
            .form-container {
                background-color: #ffffff;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                padding: 30px;
                max-width: 700px;
                margin: 50px auto;
            }
            .form-container h2 {
                text-align: center;
                color: #343a40;
                margin-bottom: 20px;
            }
            .borrow-item {
                border: 1px solid #ced4da;
                border-radius: 4px;
                padding: 15px;
                margin-bottom: 10px;
                background-color: #fff;
            }
            .borrow-item-header {
                display: flex;
                justify-content: space-between;
                align-items: center;
            }
            .borrow-item-header p {
                margin: 0;
                font-size: 20px;
                font-weight: bold;
                color: #2980B9;
                margin-bottom: 10px;
            }
            .actions {
                display: flex;
                gap: 10px;
            }
            .actions button {
                margin-left: 5px;
            }
            .borrow-item-header button {
                background: none;
                border: none;
                font-size: 16px;
                cursor: pointer;
            }
            .borrow-item-detail {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-bottom: 10px;
            }
            .borrow-item-detail p {
                margin: 0;
                flex: 1;
            }
            .borrow-item-detail .remove-item {
                margin-left: 10px;
            }
            .highlight {
                font-weight: bold;
            }
            .borrow-item-detail hr {
                width: 100%;
                border: 0;
                border-top: 1px solid #ced4da;
                margin: 10px 0;
            }

            .search-form {
                display: flex;
                align-items: center;
                justify-content: flex-start;
                margin-bottom: 20px;
                background-color: #f8f9fa;
                padding: 15px;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }

            .search-form label {
                margin-right: 10px;
                font-weight: bold;
            }

            .search-form input[type="date"] {
                padding: 8px;
                font-size: 14px;
                border: 1px solid #ccc;
                border-radius: 4px;
                margin-right: 10px;
                outline: none; /* Optional: Remove default focus outline */
            }

            .search-form button {
                padding: 8px 16px;
                font-size: 14px;
                background-color: #007bff;
                color: white;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                transition: background-color 0.3s ease;
            }

            .search-form button:hover {
                background-color: #0056b3;
            }

            .header-card {
                padding: 60px 20px;
                background-image: url('img/borrow1.jpg');
                background-size: cover;
                background-position: center;
                color: #ffffff;
                display: flex;
                align-items: center;
                justify-content: center;
                text-align: center;
                margin-bottom: 30px;
                border-radius: 8px;
                height: 140px;
            }
            .header-card h2 {
                font-size: 36px;
                font-weight: 700;
                color: white;
                margin-bottom: 10px;
            }
            .header-card p {
                font-size: 18px;
                color: white;
            }
            /* End of Custom CSS */
        </style>
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>
            <section class="hero">
                <div class="container">
                    <div class="row">
                    <jsp:include page="menu.jsp"></jsp:include>
                        <div class="col-lg-9">
                            <section class="header-card">
                                <div class="header-card-text">
                                    <h2>Quản Lý Phiếu Mượn</h2>
                                    <p>Hãy theo dõi mỗi ngày để biết và cập nhật ngày trả sách</p>
                                </div>
                            </section>
                            <div class="form-container">
                                <h2>Quản Lý Phiếu Mượn</h2>
                                <form method="get" action="borrowManager" class="search-form">
                                    <label for="deadlineDate">Search by Deadline:</label>
                                    <input type="date" id="deadlineDate" name="deadlineDate">
                                    <button type="submit" name="action" value="search">Search</button>
                                </form>
                            <c:forEach var="entry" items="${borrowMap}">
                                <div class="borrow-item">
                                    <div class="borrow-item-header">
                                        <p>PersonID: ${entry.key}</p>
                                        <div class="actions">
                                            <form method="get" action="remove_Updatefore" onsubmit="return confirmDeleteAll();">
                                                <input type="hidden" name="pid" value="${entry.key}">
                                                <button type="submit" class="btn btn-danger btn-sm" name="action" value="removeall">Remove All</button>
                                            </form>
                                            <button class="toggle-details">&#9660;</button>
                                        </div>
                                    </div>
                                    <div class="borrow-item-details" style="display: none;">
                                        <c:set var="previousBorrowID" value="" />
                                        <c:forEach var="borrow" items="${entry.value}">
                                            <c:choose>
                                                <c:when test="${previousBorrowID == borrow.borrowID}">
                                                    <div class="borrow-item-detail">
                                                        <div>
                                                            <!-- BorrowID omitted here for repeated entities -->
                                                            <p>BookName: ${borrow.bookName}</p>
                                                            <p>Amount: ${borrow.amount}</p>
                                                            <p>BorrowDate: <fmt:formatDate value="${borrow.borrowDate}" pattern="dd-MM-yyyy"/></p>
                                                            <p>Deadline: <fmt:formatDate value="${borrow.deadline}" pattern="dd-MM-yyyy"/></p>
                                                            <p>ReturnDate: <fmt:formatDate value="${borrow.returnDate}" pattern="dd-MM-yyyy"/></p>

                                                            <p>Status: ${borrow.status}</p>
                                                        </div>
                                                        <div style="display: flex">
                                                            <div>
                                                                <a href="updateBorrow.jsp?borrowid=${borrow.borrowID}&bookid=${borrow.bookID}&bookname=${borrow.bookName}&amount=${borrow.amount}&borrowdate=${borrow.borrowDate}&deadline=${borrow.deadline}&returndate=${borrow.returnDate}&status=${borrow.status}">
                                                                    <input class="btn btn-success btn-sm remove-item" type="button" value="Update">
                                                                </a>

                                                            </div>
                                                            <form method="get" action="remove_Updatefore" onsubmit="return confirmDelete();">
                                                                <input type="hidden" name="borrowid" value="${borrow.borrowID}">
                                                                <input type="hidden" name="bookid" value="${borrow.bookID}">
                                                                <input type="submit" class="btn btn-danger btn-sm remove-item" value="Remove" name="action">
                                                            </form>
                                                        </div>
                                                    </div>
                                                </c:when>
                                                <c:otherwise>
                                                    <c:if test="${not empty previousBorrowID}">
                                                        <hr>
                                                    </c:if>
                                                    <div class="borrow-item-detail">
                                                        <div>
                                                            <P class="highlight">BorrowID: ${borrow.borrowID}</P>
                                                            <p>BookName: ${borrow.bookName}</p>
                                                            <p>Amount: ${borrow.amount}</p>
                                                            <p>BorrowDate: <fmt:formatDate value="${borrow.borrowDate}" pattern="dd-MM-yyyy"/></p>
                                                            <p>Deadline: <fmt:formatDate value="${borrow.deadline}" pattern="dd-MM-yyyy"/></p>
                                                            <p>ReturnDate: <fmt:formatDate value="${borrow.returnDate}" pattern="dd-MM-yyyy"/></p>
                                                            <p>Status: ${borrow.status}</p>
                                                        </div>
                                                        <div style="text-align: center; height: 200px">
                                                            <form style="margin-top: 23px; margin-bottom: 50px" method="get" action="remove_Updatefore" onsubmit="return confirmDeleteBorrow();">
                                                                <input type="hidden" name="borrowid" value="${borrow.borrowID}">
                                                                <button type="submit" class="btn btn-danger btn-sm" name="action" value="removeborrow">Remove Borrow</button>
                                                            </form>
                                                            <div style="display: flex">
                                                                <div>
                                                                    <a href="updateBorrow.jsp?borrowid=${borrow.borrowID}&bookid=${borrow.bookID}&bookname=${borrow.bookName}&amount=${borrow.amount}&borrowdate=${borrow.borrowDate}&deadline=${borrow.deadline}&returndate=${borrow.returnDate}&status=${borrow.status}">
                                                                        <input class="btn btn-success btn-sm remove-item" type="button" value="Update">
                                                                    </a>

                                                                </div>
                                                                <form method="get" action="remove_Updatefore" onsubmit="return confirmDelete();">
                                                                    <input type="hidden" name="borrowid" value="${borrow.borrowID}">
                                                                    <input type="hidden" name="bookid" value="${borrow.bookID}">
                                                                    <input type="submit" class="btn btn-danger btn-sm remove-item" value="Remove" name="action">
                                                                </form>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </c:otherwise>
                                            </c:choose>
                                            <c:set var="previousBorrowID" value="${borrow.borrowID}" />
                                        </c:forEach>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <jsp:include page="footer.jsp"></jsp:include>


        <script>


            // Hàm để hiển thị và ẩn chi tiết mượn
            document.querySelectorAll('.toggle-details').forEach(button => {
                button.addEventListener('click', () => {
                    const details = button.closest('.borrow-item').querySelector('.borrow-item-details');
                    if (details.style.display === 'none' || details.style.display === '') {
                        details.style.display = 'block';
                        button.innerHTML = '&#9650;';
                    } else {
                        details.style.display = 'none';
                        button.innerHTML = '&#9660;';
                    }
                });
            });

            function confirmDelete() {
                return confirm("Are you sure you want to remove this item?");
            }

            function confirmDeleteAll() {
                return confirm("Are you sure you want to remove all items?");
            }

            function confirmDeleteBorrow() {
                return confirm("Are you sure you want to remove this borrow record?");
            }
        </script>

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
