<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
        <title>Bootstrap 4 Signup Form</title>
        <style>
            body {
                background-image: url('img/background.jpg');
                background-size: cover;
                background-repeat: no-repeat;
                background-position: center center;
                height: 100vh;
                display: flex;
                justify-content: center;
                align-items: center;
                color: #fff;
                margin: 0;
            }
            .form-signup {
                margin-top: 100px;
                background-color: rgba(0, 0, 0, 0.7);
                border-radius: 10px;
                padding: 40px;
                box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
                color: #fff;
                width: 100%;
                max-width: 500px;
            }
            .form-signup h1 {
                margin-bottom: 20px;
                font-size: 1.8rem;
                font-weight: bold;
                color: #fff;
            }
            .form-signup .form-control {
                border-radius: 20px;
                margin-bottom: 15px;
                background-color: rgba(255, 255, 255, 0.1);
                color: #fff;
                border: 1px solid rgba(255, 255, 255, 0.3);
            }
            .form-signup .form-control::placeholder {
                color: rgba(255, 255, 255, 0.7);
            }
            .form-signup .btn {
                border-radius: 20px;
                padding: 10px;
                font-size: 1rem;
                background-color: #007bff;
                border: none;
            }
            .form-signup .btn i {
                margin-right: 5px;
            }
            .form-signup .text-muted {
                display: block;
                margin-top: 20px;
                text-align: center;
                color: #bbb;
            }
            .form-signup h4 {
                margin-top: 20px;
                font-size: 1rem;
                color: red;
                text-align: center;
                font-style: italic;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-6">
                    <div class="form-signup">
                        <h1 class="text-center">Đăng Ký</h1>
                        <form action="signup" method="post">
                            <input name="user" type="text" id="user-name" class="form-control" placeholder="Tên đăng nhập" required autofocus>
                            <input name="pass" type="password" id="user-pass" class="form-control" placeholder="Mật khẩu" required>
                            <input name="repass" type="password" id="user-repeatpass" class="form-control" placeholder="Nhập lại mật khẩu" required>
                            <input name="name" type="text" id="user-fullname" class="form-control" placeholder="Họ tên" required>
                            <select name="gender" id="user-gender" class="form-control" required>
                                <option value="" disabled selected>Giới tính</option>
                                <option value="Male">Nam</option>
                                <option value="Female">Nữ</option>
                            </select>
                            <input name="date" type="date" id="user-date" class="form-control" placeholder="Ngày sinh" required>
                            <input name="address" type="text" id="user-address" class="form-control" placeholder="Địa chỉ" required>
                            <input name="email" type="email" id="user-email" class="form-control" placeholder="Email: example@gmail.com" required>
                            <input name="phone" type="tel" id="user-phone" class="form-control" placeholder="Số điện thoại" required>
                            <button class="btn btn-primary btn-block" type="submit"><i class="fas fa-user-plus"></i> Đăng ký</button>
                            <a href="login.jsp" class="text-muted"><i class="fas fa-angle-left"></i> Quay lại</a>
                        </form>
                        <%-- You can keep your error message display here --%>
                        <%
                            String error = (String) request.getAttribute("error");
                        %>
                        <h4><%= error != null ? error : "" %></h4>
                    </div>
                </div>
            </div>
        </div>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    </body>
</html>
