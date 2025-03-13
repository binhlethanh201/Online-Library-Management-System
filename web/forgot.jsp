<%-- 
    Document   : forgot
    Created on : Jun 23, 2024, 10:05:08 PM
    Author     : Duc Long
--%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
        <link rel="stylesheet" href="/login.css">
        <title>Forgot Password</title>
        <style>
            body, html {
                margin: 0;
                padding: 0;
                height: 100%;
                font-family: Arial, Helvetica, sans-serif;
            }

            .signup {
                height: 100vh;
                background-image: url('img/login.jpg');
                background-repeat: no-repeat;
                background-size: cover;
                display: flex;
                justify-content: center;
                align-items: center;
            }

            .login_detail {
                background: rgba(0, 0, 0, 0.7);
                padding: 40px;
                border-radius: 10px;
                box-shadow: 0px 0px 10px 0px #000;
                max-width: 400px;
                width: 100%;
            }

            .form-signup {
                width: 100%;
            }

            .form-signup h1 {
                color: #fff;
                margin-bottom: 30px;
            }

            .form-signup input {
                margin-bottom: 20px;
                border-radius: 20px;
            }

            .form-signup button {
                border-radius: 20px;
            }

            .form-signup .btn-block {
                margin-top: 20px;
            }

            .form-signup a {
                color: #17a2b8;
                display: block;
                text-align: center;
                margin-top: 10px;
            }

            .alert-message {
                color: red;
                text-align: center;
                margin-top: 20px;
                font-style: italic;
            }
        </style>
    </head>
    <body>
        <div class="signup">
            <div class="login_detail">
                <div id="logreg-forms">
                    <form action="forgot" method="get" class="form-signup">
                        <h1 class="h3 mb-3 font-weight-normal text-center">Forgot Password</h1>
                        <input name="user" type="text" id="user-name" class="form-control" placeholder="Username" required autofocus>
                        <input name="pass" type="password" id="user-pass" class="form-control" placeholder="Password" required>
                        <input name="repass" type="password" id="user-repeatpass" class="form-control" placeholder="Repeat Password" required>
                        <button class="btn btn-primary btn-block" type="submit"><i class="fas fa-user-plus"></i> Lay Lai Mat Khau</button>
                        <a href="login.jsp" id="cancel_signup"><i class="fas fa-angle-left"></i> Back</a>
                    </form>
                    <%
                        String error1 = (String) request.getAttribute("error1");
                        String error2 = (String) request.getAttribute("error2");
                    %>
                    <div class="alert-message"><%= error1 != null ? error1 : "" %></div>
                    <div class="alert-message"><%= error2 != null ? error2 : "" %></div>
                </div>
            </div>
        </div>
    </body>
</html>
