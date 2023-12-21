<%-- 
    Document   : Taxicall
    Created on : 2 nov. 2023, 13:31:44
    Author     : hp
--%>

<%@page import="com.sun.jdi.connect.spi.Connection"%>
<%@page import="com.Calls"%>
<%@page import="newpackage.ConnectionPro"%>
<%@page import="newpackage.UserDatabase"%>
<%@page import="com.Driver"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>

<!DOCTYPE html>
<%
    if (session.getAttribute("user") == null) {
        // Kullanıcı giriş yapmamış, giriş sayfasına yönlendir
        response.sendRedirect("login.jsp");
        return;
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- basic -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- mobile metas -->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="viewport" content="initial-scale=1, maximum-scale=1">
        <!-- site metas -->
        <title>TAXI</title>
        <meta name="keywords" content="">
        <meta name="description" content="">
        <meta name="author" content="">	
        <!-- bootstrap css -->
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
        <!-- style css -->
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <!-- Responsive-->
        <link rel="stylesheet" href="css/responsive.css">
        <!-- fevicon -->
        <link rel="icon" href="images/fevicon.png" type="images/gif" />
        <!-- Scrollbar Custom CSS -->
        <link rel="stylesheet" href="css/jquery.mCustomScrollbar.min.css">
        <!-- Tweaks for older IEs-->
        <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
        <!-- owl stylesheets --> 
        <link rel="stylesheet" href="css/owl.carousel.min.css">
        <link rel="stylesheet" href="css/owl.theme.default.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.css" media="screen">
        <link rel="stylesheet" href="Taxicall.css"/>
    </head>
    <body>
        <!--<a href="registration.jsp">Go to registry</a>-->
        <!--header section start -->
        <div id="index.jsp" class="header_section">
            <div class="container">
                <div class="row">

                    <div class="col-sm-6 col-lg-9">
                        <div class="menu_text">
                            <ul>
                                <li><a href="index.jsp">AnaSayfa</a></li>                                                    
                                <li><a href="index.jsp">Hakkımızda</a></li>
                                <li><a href="#booking">Rezervasyon</a></li>
                                <li><a href="#contact">iletişim</a></li>
                                <li><a href="registration.jsp">Giriş Yap</a></li>
                                <li><a href="logout.jsp">Çıkış Yap</a></li>   

                                <div id="myNav" class="overlay">
                                    <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
                                    <div class="overlay-content">
                                        <a href="index.jsp">AnaSayfa</a>
                                        <a href="#about">Hakkımızda</a>
                                        <a href="#booking">Rezervasyon</a>
                                        <a href="#contact">iletişim</a>
                                        <a href="registration.jsp">Giriş Yap</a>
                                        <a href="logout.jsp">Çıkış Yap</a>

                                    </div>
                                </div>
                                <span  style="font-size:33px;cursor:pointer; color: #ffffff;" onclick="openNav()"> </span>
                        </div>  
                        </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div><br><br><br><br><br>
        <div class="taxi-form-container">

            <h2>Taksi Çağırmak için Aşağıdaki Formu yollanın </h2>
            <form action="CallServet" method="POST">
                <table class="table taxi-table">
                    <tr>
                        <td><strong>Adı ve Soyadınız:</strong></td>
                        <td><input type="text" id="clientName" name="clientName" placeholder="Adı ve Soyadınız"></td>
                    </tr>
                    <tr>
                        <td><strong>Tam Adresınız :</strong></td>
                        <td> <textarea class="form-input" id="contact-form-message-3" name="address" data-constraints="@Required" placeholder="Tam Adresınız "></textarea></td>
                    </tr>
                    <tr>
                        <td><strong>Müşteri Telefonu:</strong></td>
                        <td><input type="text" id="clientName" name="Phone" placeholder="Telefonunuz"></td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <button type="submit" class="btn btn-primary aziz_btn">Taksi Çağır</button>
                        </td>
                    </tr>

                </table>
            </form>
            <p>
                <%
                    String assignedDriverInfo = (String) session.getAttribute("assignedDriverInfo");
                    if (assignedDriverInfo != null) {
                        out.print(assignedDriverInfo);
                        session.removeAttribute("assignedDriverInfo");// Bilgiyi gösterdikten sonra kaldır
                    } else {
                        out.print("bos surucumuz yok olursa birazdan bildiriz");
                    }
                %>

            </p>
        </div>

    </body>
</html>
