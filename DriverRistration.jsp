<%-- 
    Document   : Driverlogin
    Created on : Dec 3, 2023, 9:22:00 PM
    Author     : hp
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Hesap Oluştur</title>
        <link href="https://fonts.googleapis.com/css?family=ZCOOL+XiaoWei"
              rel="stylesheet">
        <link href="css/Loginstyle.css" rel="stylesheet" type="text/css" />
    </head>
    <body>
        <div class="container">
            <div class="regbox box">
                <img class="avatar" src="images/collaboration.png">
                <h1>Driver Hesabın Oluştur</h1>
                <form action="RegisterServlet" method="post">
                    <p>Name</p>
                    <input type="text" placeholder="Kullancı" name="name" required>
                    <p>Plate</p>
                    <input type="text" placeholder="Email" name="plate" required>
                    <input type="submit" value="kaydol"> <a
                           href="index.jsp">Daha önce kaydoldunuz mu?</a>
                </form>
            </div>
        </div>
    </body>
</html>