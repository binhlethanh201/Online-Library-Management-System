<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
        <link rel="stylesheet" href="/login.css">
        <title>Log in</title>
        <style>
            body, html {
                margin: 0;
                padding: 0;
                height: 100%;
                font-family: Arial, Helvetica, sans-serif;
            }

            .login {
                height: 100vh;
                background-image: url('img/login.jpg');
                background-repeat: no-repeat;
                background-size: cover;
                display: flex;
                justify-content: center;
                align-items: center;
            }

            .login_detail {
                width: 30%;
                background: rgba(0, 0, 0, 0.7);
                padding: 40px;
                border-radius: 10px;
                box-shadow: 0px 0px 10px 0px #000;
            }

            #logreg-forms {
                width: 100%;
            }

            .form-signin {
                width: 100%;
            }

            .form-signin h1 {
                color: #fff;
                margin-bottom: 30px;
            }

            .form-signin input {
                margin-bottom: 20px;
                border-radius: 20px;
            }

            .form-signin .form-check-label {
                color: #fff;
            }

            .form-signin a {
                color: #17a2b8;
            }

            .form-signin button {
                border-radius: 20px;
            }

            .form-signin .btn-block {
                margin-top: 20px;
            }

            .form-signin hr {
                border-color: rgba(255, 255, 255, 0.1);
            }

            .alert-message {
                color: red;
                text-align: center;
                margin-top: 20px;
            }
        </style>
    </head>
    <body>
        <div class="login">
            <div class="login_detail">
                <div id="logreg-forms">
                    <form class="form-signin" action="login" method="post">
                        <h1 class="h3 mb-3 font-weight-normal text-center">Đăng Nhập</h1>
                        <input name="user" type="text" id="inputEmail" class="form-control" value="${cookie.cname.value}" placeholder="Tên đăng nhập" required autofocus>
                        <input name="pass" type="password" id="inputPassword" class="form-control" placeholder="Mật khẩu" value="${cookie.cpass.value}" required>
                        <div class="form-group form-check">
                            <input name="remember" value="1" type="checkbox" ${cookie.crem!=null?'checked':''} class="form-check-input" id="exampleCheck1">
                            <label class="form-check-label" for="exampleCheck1">Nhớ mật khẩu</label>
                            <a href="forgot.jsp" class="form-check-label float-right">Quên mật khẩu?</a>
                        </div>
                        <div class="alert-message">${requestScope.mess}</div>
                        <button class="btn btn-success btn-block" type="submit"><i class="fas fa-sign-in-alt"></i> Đăng nhập</button>
                        <hr>
                        <a href="signup.jsp" class="btn btn-primary btn-block" role="button"><i class="fas fa-user-plus"></i> Tạo tài khoản mới</a>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
