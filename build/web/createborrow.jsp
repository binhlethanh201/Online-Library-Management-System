<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>

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

    <title>FastFood</title>
    <style>
        /* Custom CSS */
        body {
            font-family: 'Cairo', sans-serif;
            background-color: #f5f7fa;
            margin: 0;
        }
        .container {
            max-width: 1100px;
            margin: 0 auto;
            padding: 0 15px;
        }
        .form-container {
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            padding: 30px;
            margin: 50px auto;
            transition: transform 0.3s;
        }
        .form-container:hover {
            transform: translateY(-2px);
        }
        .form-container h2 {
            text-align: center;
            color: #343a40;
            margin-bottom: 20px;
            font-size: 28px;
            font-weight: bold;
        }
        .form-container label {
            display: block;
            margin-bottom: 8px;
            color: #495057;
            font-weight: 500;
        }
        .form-container input[type="text"],
        .form-container input[type="email"],
        .form-container input[type="date"],
        .form-container select,
        .form-container input[type="number"] {
            width: calc(100% - 22px);
            padding: 12px;
            margin-bottom: 20px;
            border: 1px solid #ced4da;
            border-radius: 5px;
            box-sizing: border-box;
            font-size: 16px;
            transition: border-color 0.3s;
        }
        .form-container input[type="text"]:focus,
        .form-container input[type="email"]:focus,
        .form-container input[type="date"]:focus,
        .form-container input[type="number"]:focus {
            border-color: #007bff;
            outline: none;
        }

        .form-container input[type="submit"] {
            width: 100%;
            padding: 12px;
            background-color: #007bff;
            border: none;
            border-radius: 5px;
            color: #ffffff;
            font-size: 18px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        .form-container input[type="submit"]:hover {
            background-color: #0056b3;
        }

        .checkbox-label {
            display: flex;
            align-items: center;
        }

        .search-container {
            background-color: #f8f9fa;
            padding: 20px;
            margin-bottom: 30px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .search-container label {
            font-weight: bold;
            margin-bottom: 10px;
            display: block;
        }

        .search-container input[type="text"] {
            width: calc(100% - 110px);
            padding: 10px;
            border: 1px solid #ced4da;
            border-radius: 4px;
            box-sizing: border-box;
            font-size: 16px;
            transition: border-color 0.3s;
        }

        .search-container input[type="text"]:focus {
            border-color: #007bff;
            outline: none;
        }

        .search-container button {
            padding: 10px 20px;
            background-color: #007bff;
            border: none;
            border-radius: 4px;
            color: #ffffff;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .search-container button:hover {
            background-color: #0056b3;
        }

        table {
            width: 100%;
            margin-top: 20px;
            border-collapse: collapse;
            background-color: #ffffff;
        }

        table td, table th {
            padding: 12px;
            border: 1px solid #ced4da;
            text-align: left;
        }

        table th {
            background-color: #007bff;
            color: #ffffff;
            text-align: center;
        }

        table tr:hover {
            background-color: #f1f1f1;
        }
        
        .header-card {
                padding: 60px 20px;
                background-image: url('img/borrow2.jpg');
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
    </style>
</head>
<body>

    <jsp:include page="header.jsp"></jsp:include>
    <section class="hero">
        <div class="container">
            <div class="row">
                <jsp:include page="menu.jsp"></jsp:include>

                <div style="margin-left: 70px" class="col-lg-8">
                    <section class="header-card">
                        <div class="header-card-text">
                            <h2>Tạo Phiếu Mượn</h2>
                            <p>Nơi lưu giữ tốt nhất về những cuốn sách đã mượn</p>
                        </div>
                    </section>
                    <div class="form-container">
                        <h2><strong>Tạo Phiếu Mượn</strong></h2>
                        <p style="color: red">${error != null ? error : ""}</p>
                        <form id="borrowForm" method="post" action="borrowManager">
                            <label for="Name">Họ tên:</label>
                            <input type="text" name="Name" value="${reader.name}" readonly><br>
                            <input type="hidden" name="pid" value="${reader.personID}">

                            <label for="Gender">Giới tính:</label>
                            <input type="text" name="Gender" value="${reader.gender}" readonly><br>

                            <label for="DateOfBirth">Ngày sinh:</label>
                            <input type="date" name="DateOfBirth" value="${reader.dateOfBirth}" readonly><br>

                            <label for="Address">Địa chỉ:</label>
                            <input type="text" name="Address" value="${reader.address}" readonly><br>

                            <label for="Email">Email:</label>
                            <input type="email" name="Email" value="${reader.email}" readonly><br>

                            <label for="Phone">Số điện thoại:</label>
                            <input type="text" name="Phone" value="${reader.phone}" readonly><br>

                            <div class="search-container">
                                <label for="searchBook">Tìm kiếm sách:</label>
                                <input type="text" id="searchBook" onkeyup="searchBooks()" placeholder="Nhập tên sách...">
                                <button type="button" onclick="searchBooks()">Tìm kiếm</button><br>
                            </div>

                            <label for="Books">Danh sách Sách:</label>
                            <table id="bookTable">
                                <thead>
                                    <tr>
                                        <th style="text-align: center">Chọn</th>
                                        <th style="text-align: center">Tên Sách</th>
                                        <th style="text-align: center">Số Lượng</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${listB}" var="book">
                                        <tr>
                                            <td>
                                                <div class="checkbox-label">
                                                    <input style="margin: 10px auto" type="checkbox" name="bookid" id="book_${book.bookID}" value="${book.bookID}">
                                                </div>
                                            </td>
                                            <td><label style="margin: 10px auto" for="book_${book.bookID}">${book.bookName}</label></td>
                                            <td><input style="margin: 10px auto" type="number" name="amount_${book.bookID}" placeholder="Số lượng"></td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>

                            <input type="submit" value="Tạo Phiếu Mượn">
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
    <script>
        function searchBooks() {
            var input, filter, table, tr, td, i, txtValue;
            input = document.getElementById("searchBook");
            filter = input.value.toUpperCase();
            table = document.getElementById("bookTable");
            tr = table.getElementsByTagName("tr");

            for (i = 0; i < tr.length; i++) {
                td = tr[i].getElementsByTagName("td")[1]; // Index 1 for the Book Name column
                if (td) {
                    txtValue = td.textContent || td.innerText;
                    if (txtValue.toUpperCase().indexOf(filter) > -1) {
                        tr[i].style.display = "";
                    } else {
                        tr[i].style.display = "none";
                    }
                }
            }
        }
    </script>
</body>
</html>
