<%-- 
    Document   : LoginError
    Created on : Nov 21, 2023, 12:19:41 PM
    Author     : hp
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Giriş Hatası</title>
        <link href="https://fonts.googleapis.com/css?family=ZCOOL+XiaoWei" rel="stylesheet">
        <link href="css/Loginstyle.css" rel="stylesheet" type="text/css" />

        <style>
            .error-panel {
                background-color: #ffcccb;
                color: red;
                text-align: center;
                padding: 10px;
                margin-bottom: 20px;
                border-radius: 5px;
            }
        </style>
    </style>
</head>
<body>
    <div class="container">
        <div class="box">
            <img class="avatar" src="images/error-icon.png">
            <h1>Giriş Başarısız</h1>
            <p class="error-message">Yanlış kullanıcı adı veya şifre girdiniz. Lütfen tekrar deneyiniz.</p>
            <a href="login.jsp">Giriş Sayfasına Geri Dön</a>
        </div>
    </div>
      <script>
            window.onload = function () {
                var errorMessage = " <%=request.getAttribute('loginError')%>";
                if (errorMessage) {
                    document.getElementById('error-message').innerText = errorMessage;
                    document.querySelector('.error-panel').style.display = 'block';
                }
            }
        </script>
</body>
</html>

