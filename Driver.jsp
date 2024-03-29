<%-- 
    Document   : Taxicall
    Created on : 11 nov. 2023, 13:31:44
    Author     : hp
--%>


<%@page import="java.util.List"%>
<%@page import="com.Calls"%>
<%@page import="newpackage.ConnectionPro"%>
<%@page import="newpackage.UserDatabase"%>
<%@page import="com.sun.jdi.connect.spi.Connection"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<%
    if (session.getAttribute("isValidDriver") == null) {
        // Kullanıcı giriş yapmamış, giriş sayfasına yönlendir
        response.sendRedirect("Driverlogin.jsp");
        return;
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
                                        <li><a style="color: #cb2027; margin-left: 20px;" href="logout.jsp">Çıkış Yap</a></li>

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
            <h2 style="text-align: center; font-family: sans-serif; font-size: 40px; ">Çağırmalar Gör</h2><br><br>
            <div class="container text-center">
                <%
                    String assignedCustomerName = (String) request.getSession().getAttribute("assignedCustomerName");
                    String assignedCustomerAddress = (String) request.getSession().getAttribute("assignedCustomerAddress");
                    String assignedCustomerPhone = (String) request.getSession().getAttribute("assignedCustomerPhone");
                %>
                <% if (assignedCustomerName != null && assignedCustomerAddress != null && assignedCustomerPhone != null) {%>
                <h3>Atanan Müşteri Bilgileri</h3>
                <p id="assignedCustomerName">Adı: <%= assignedCustomerName%></p>
                <p id="assignedCustomerAddress">Adres: <%= assignedCustomerAddress%></p>
                <p id="assignedCustomerPhone">Telefon: <%= assignedCustomerPhone%></p>
                <% } else { %>
                <p>Henüz atanmış bir müşteri yok.</p>
                <% }%>
                <br><br><br>

                <button type="button" class="btn btn-primary"  onclick="updateDriverStatus()">Boştayım</button>
            </div>
        </div>
    </body>
    <script>
        function updateDriverStatus() {
            var xhr = new XMLHttpRequest();
            var url = 'http://localhost:8082/webproject/Driver.jsp';
            xhr.open('POST', url, true);
            xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');

            xhr.onreadystatechange = function () {
                if (xhr.readyState === XMLHttpRequest.DONE) {
                    if (xhr.status === 200) {
                        alert('Durum başarıyla güncellendi.');

                        // Kullanıcı bilgilerini sıfırla
                        document.getElementById("assignedCustomerName").innerText = "Adı: ";
                        document.getElementById("assignedCustomerAddress").innerText = "Adres: ";
                        document.getElementById("assignedCustomerPhone").innerText = "Telefon: ";
                    } else {
                        alert('Durum güncellenemedi.');
                    }
                }
            };

            var params = '0';
            xhr.send(params);
        }

    </script>

</html>
