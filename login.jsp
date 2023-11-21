<%-- 
    Document   : login
    Created on : Nov 4, 2023, 8:24:46 PM
    Author     : hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Join Us</title>
        <link href="https://fonts.googleapis.com/css?family=ZCOOL+XiaoWei" rel="stylesheet">
        <link href="css/Loginstyle.css" rel="stylesheet" type="text/css" />
    </head>
    <body>
        <div class="container">
            <div class="box">
                <img class="avatar" src="img/user-avatar.png">
                <h1>Hesaba Giriş</h1>
                <form action="LoginServlet" method="post">
                    <p>Kullanıcı Adı</p>
                    <input type="text" placeholder="Kullanıcı Adı" name="email" required>
                    <p>Şifre</p>
                    <input type="password" placeholder="Şifre" name="password" required>
                    <input type="submit" value="Giriş Yap">
                    <a href="#">Şifrenizi mi unuttunuz?</a><br>
                    <a href="registration.jsp">Yeni Hesap Oluştur</a>
                </form>
            </div>


        </div>
    </body>
</html>