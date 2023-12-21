<%-- 
    Document   : Driverlogin
    Created on : Dec 3, 2023, 9:36:20 PM
    Author     : hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    if (session != null && session.getAttribute("isValidDriver") != null) {
        response.sendRedirect("Driver.jsp"); // Oturum varsa ve kullanıcı girişi yapılmışsa, başka bir sayfaya yönlendir
    } else {
        // Oturum yoksa veya giriş yapılmamışsa normal işlemlere devam et
%>
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
                <form action="driverServet" method="post">
                    <p>Kullanıcı Adı</p>
                    <input type="text" placeholder="Kullanıcı Adı" name="name" required>
                    <p>Plate</p>
                    <input type="password" placeholder="Plakan gir" name="plate" required>
                    <input type="submit" value="Giriş Yap">
                    <br>
                </form>
            </div>
        </div>
        <%
            } // JSP kod bloğunun sonu
        %>
    </body>
</html>
