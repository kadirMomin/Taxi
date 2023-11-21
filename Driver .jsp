<%-- 
    Document   : Taxicall
    Created on : 11 nov. 2023, 13:31:44
    Author     : hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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

                                <div id="myNav" class="overlay">
                                    <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
                                    <div class="overlay-content">
                                        <a href="index.jsp">AnaSayfa</a>
                                        <a href="#about">Hakkımızda</a>
                                        <a href="#booking">Rezervasyon</a>
                                        <a href="#contact">iletişim</a>
                                        <a href="registration.jsp">Giriş Yap</a>

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
            <h2>Çağırmalar Gör</h2>
            <form>
                <table class="table taxi-table">
                    <tr>
                        <td><strong>Müşterini Adı:</strong></td>
                        <td><input type="text" id="clientName" name="clientName" placeholder="Adınız"></td>
                    </tr>
                    <tr>
                        <td><strong>Adres:</strong></td>
                        <td> <textarea class="form-input" id="contact-form-message-3" name="Adresiniz" data-constraints="@Required"></textarea></td>
                    </tr>
                                        <tr>
                        <td><strong>Müşteri Telefonunu:</strong></td>
                        <td><input type="text" id="clientName" name="clientName" placeholder="Telefonunuz"></td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <button type="submit" class="btn btn-primary">Kabul Et</button>
                        </td>
                    </tr>
                </table>
            </form>
        </div>

    </body>
</html>
