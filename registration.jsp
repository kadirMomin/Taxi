<%-- 
    Document   : registration
    Created on : Oct 22, 2023, 8:51:04 PM
    Author     : hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% String regError = (String) request.getAttribute("RegError");
     if (regError != null) {%>
<script>
                alert("<%= regError%>");
</script>
<% } else {
    String successMessage = (String) request.getAttribute("SuccessMessage");
    if (successMessage != null) {%>
<script>
                alert("<%= successMessage%>");
</script>
<% }
 }%>
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
                <h1>Hesap Oluştur</h1>
                <form action="RegisterServlet" method="post">
                    <p>Kullancı</p>
                    <input type="text" placeholder="Kullancı" name="name" required>
                    <p>Email</p>
                    <input type="text" placeholder="Email" name="email" required>
                    <p>Şifre</p>
                    <input type="password" placeholder="Password" name="password"
                           required> <input type="submit" value="kaydol"> <a
                           href="login.jsp">Daha önce kaydoldunuz mu?</a>
                </form>
            </div>

        </div>
    </body>

</html>
