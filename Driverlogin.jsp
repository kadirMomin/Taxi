<%-- 
    Document   : Driverlogin
    Created on : Dec 3, 2023, 9:36:20 PM
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
                <h1>Driver Hesabın Giriş</h1>
                <form action="LoginServlet" method="post">
                    <p>Kullanıcı Adı</p>
                    <input type="text" placeholder="Kullanıcı Adı" name="name" required>
                    <p>Plate</p>
                    <input type="password" placeholder="Plakan gir" name="plate" required>
                    <input type="submit" value="Giriş Yap">
                    <br>
                    <a href="DriverRistration.jsp">Yeni Hesap Oluştur</a>
                </form>
            </div>


        </div>
    </body>
</html>
