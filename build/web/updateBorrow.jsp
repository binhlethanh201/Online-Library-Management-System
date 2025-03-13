<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="description" content="FastFood Template">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Cập Nhật Thông Tin Mượn Sách</title>

        <!-- Google Font -->
        <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">

        <!-- Css Styles -->
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/font-awesome.min.css">
        <link rel="stylesheet" href="css/elegant-icons.css">
        <link rel="stylesheet" href="css/nice-select.css">
        <link rel="stylesheet" href="css/jquery-ui.min.css">
        <link rel="stylesheet" href="css/owl.carousel.min.css">
        <link rel="stylesheet" href="css/slicknav.min.css">
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/custom-style.css"> <!-- New custom style sheet -->

        <style>
            /* Custom CSS */
            body {
                font-family: 'Arial';
                background-color: #f8f9fa;
                margin: 0;
            }
            .form-container {
                background-color: #ffffff;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                padding: 30px;
                max-width: 600px;
                margin: 50px auto;
            }
            .form-container h2 {
                text-align: center;
                color: #343a40;
                margin-bottom: 20px;
            }
            .form-container label {
                display: block;
                margin-bottom: 8px;
                color: #495057;
                font-weight: 600;
            }
            .form-container input[type="text"],
            .form-container input[type="email"],
            .form-container input[type="number"],
            .form-container input[type="date"] {
                width: calc(100% - 22px);
                padding: 10px;
                margin-bottom: 20px;
                border: 1px solid #ced4da;
                border-radius: 4px;
                box-sizing: border-box;
                font-size: 16px;
            }
            .form-container input[type="submit"] {
                width: 100%;
                padding: 10px;
                background-color: #007bff;
                border: none;
                border-radius: 4px;
                color: #ffffff;
                font-size: 16px;
                cursor: pointer;
                transition: background-color 0.3s;
            }
            .form-container input[type="submit"]:hover {
                background-color: #0056b3;
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
                        <div class="form-container">
                            <h2>Cập Nhật Thông Tin Mượn</h2>
                            <form action="remove_Updatefore" method="post">
                                <label for="updateBorrowID">Mã Phiếu Mượn :</label>
                                <input type="number" id="updateBorrowID" name="borrowID" value="${param.borrowid}" readonly><br>
                                <label for="updateBookID">Mã Sách Mượn:</label>
                                <input type="number" id="updateBookID" name="bookID" value="${param.bookid}" readonly><br>
                                <label for="updateBookName">Tên Sách:</label>
                                <input type="text" id="updateBookName" name="bookName" value="${param.bookname}"><br>
                                <label for="updateAmount">Số Lượng:</label>
                                <input type="number" id="updateAmount" name="amount" value="${param.amount}"><br>
                                <label for="updateBorrowDate">Ngày Mượn:</label>
                                <input type="date" id="updateBorrowDate" name="borrowDate" value="${param.borrowdate}" readonly><br>
                                <label for="updateDeadline">Hạn Trả:</label>
                                <input type="date" id="updateDeadline" name="deadline" value="${param.deadline}"><br>
                                <label for="updateReturnDate">Ngày Trả:</label>
                                <input type="date" id="updateReturnDate" name="returnDate" value="${param.returndate}"><br>
                                <label for="updateStatus">Trạng Thái:</label>
                                <select id="updateStatus" name="status">
                                    <option value="Chưa trả" ${param.status == 'Chưa trả' ? 'selected' : ''}>Chưa trả</option>
                                    <option value="Đã trả" ${param.status == 'Đã trả' ? 'selected' : ''}>Đã trả</option>
                                </select><br>
                                <input type="submit" class="btn btn-success btn-sm btn-update" value="Update">
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Hero Section End -->

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

        <!-- Custom JavaScript -->
        <script>
            document.getElementById('updateReturnDate').addEventListener('change', function() {
                var borrowDate = new Date(document.getElementById('updateBorrowDate').value);
                var returnDate = new Date(this.value);
                
                // Clear the field if return date is earlier than borrow date
                if (returnDate < borrowDate) {
                    alert('Ngày trả không được trước ngày mượn');
                    this.value = '';
                }
            });
        </script>
    </body>
</html>
