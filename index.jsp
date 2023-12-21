<%-- 
    Document   : index
    Created on : Oct 22, 2023, 8:50:04 PM
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
        <style>
            /* Açılır Menü İçin CSS */ 
            
            .dropdown {
                position: relative;
                display: inline-block;
                vertical-align: middle;
            }
            .menu_text > ul > li {
                vertical-align: middle; /* Diğer menü öğeleriyle hizalamak için */
            }

            .dropdown-content {
                display: none;
                position: absolute;

                min-width: 160px;
                box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
                z-index: 1;
            }

            .dropdown-content a {
                color: black;
                padding: 12px 16px;
                text-decoration: none;
                display: block;
            }



            .dropdown:hover .dropdown-content {
                display: block;
            }

            .dropbtn {
                display: inline-block;
                text-decoration: none;
                padding: 16px;
                font-size: 16px;
                border: none;
                cursor: pointer;
            }

        </style>
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
                                <li><a href="#about">Hakkımızda</a></li>
                                <li class="dropdown">
                                    <a href="#booking" class="dropbtn">Rezervasyon &#9662;</a>
                                    <div class="dropdown-content">
                                        <a href="Driverlogin.jsp">Şöfer kısımı</a>

                                    </div>
                                </li>
                                <li><a href="#contact">iletişim</a></li>
                                <li><a href="login.jsp">Giriş Yap</a></li>
                                   

                                <div id="myNav" class="overlay">
                                    <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
                                    <div class="overlay-content">
                                        <a href="index.jsp">AnaSayfa</a>
                                        <a href="#about">Hakkımızda</a>
                                        <a href="#booking">Rezervasyon</a>
                                        <a href="#contact">iletişim</a>
                                        <a href="login.jsp">Giriş Yap</a>

                                    </div>
                                </div>
                                <span  style="font-size:33px;cursor:pointer; color: #ffffff;" onclick="openNav()"> </span>
                        </div>  
                        </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <!-- header section end -->
        <!-- banner section start  <div class="book_now">

                                        <h1 class="call_text"><a href="Driver .jsp">Şöfer kısımı</a></h1>
                                    </div>-->
        <div class="banner_section">
            <div class="container-fluid">
                <div id="main_slider" class="carousel slide" data-ride="carousel">
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <div class="row">
                                <div class="col-md-6">

                                    <div class="image_1"><img src="images/img-1.png"></div>
                                </div>
                                <div class="col-md-6">
                                    <div class="contact_bg">
                                        <div class="input_main">
                                            <div class="container">
                                                <h2 class="request_text">Taksi çagırmak için Aşağıdaki buttonu tıklayın</h2>
                                                <div class="send_bt"><a href="Taxicall.jsp">Taksi çagır</a></div>
                                            </div>
                                        </div>

                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>

                </div>

            </div>
        </div>
        <!-- banner section end -->
        <!-- our taxis section start -->
        <div id="taxis" class="taxis_section layout_padding">
            <div class="container">
                <h1 class="our_text">Çeşitli<span style="color: #f4db31;"> Takslerimiz</span></h1>
                <div class="taxis_section_2">
                    <div class="row">
                        <div class="col-sm-4">
                            <div class="taxi_main">
                                <div class="round_1">01</div>
                                <h2 class="carol_text">Vip Taksi</h2>
                                <p class="reader_text">V.I.P. taksi hizmetimizle, seyahatinizi lüks ve konforlu<br> 
                                    Size geçtirir </p>
                                <div class="images_2"><a href="#"><img src="images/img-2.png"></a></div>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="taxi_main">
                                <div class="round_1">02</div>
                                <h2 class="carol_text">Orta Taksi</h2>
                                <p class="reader_text">Orta sınıf taksi seçeneğimiz, bütçenizi korurken <br> 
                                    konforlu bir yolculuk sunar. </p>
                                <div class="images_2"><img src="images/img-2.png"></a></div>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="taxi_main">
                                <div class="round_1">03</div>
                                <h2 class="carol_text">Normal Taksi</h2>
                                <p class="reader_text">Normal taksi hizmetimizle her zaman güvenilir ve uygun fiyatlı<br> 
                                    bir ulaşım seçeneğine sahip olun. </p>
                                <div class="images_2"><img src="images/img-2.png"></a></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- our taxis section end -->
        <!-- why ride section start -->
        <div id="booking" class="ride_section layout_padding">
            <div class="container">
                <div class="ride_main">
                    <h1 class="ride_text"><span style="color: #f4db31;">Hakkımız</span></h1>
                </div>
            </div>
        </div>
        <div class="ride_section_2 layout_padding" id="about">

            <div class="container">
                <div class="row">
                    <div class="col-sm-4">
                        <div class="image_3"><img src="images/img-5.png"></div>
                    </div>
                    <div class="col-sm-8">
                        <h1 class="cabe_text">Her Bütçeye Uygun Taksi</h1>
                        <p class="long_text">Biz <span style="font-family: sans-serif; font-weight: 900"> Kadir Taksi</span> olarak, seyahatlerinizi güvenli ve konforlu hale getirmek için buradayız. [Şirket Adı], yılların verdiği deneyimle sizlere en iyi taksi hizmetini sunmaktadır. Müşteri memnuniyeti ve güvenliği bizim önceliğimizdir. Sürücülerimiz profesyonel ve deneyimlidir. Her yolculuğunuzda sizi istediğiniz yere güvenli bir şekilde ulaştırmak için buradayız. Bizimle seyahat ederek konforlu ve hızlı bir yolculuk deneyimi yaşayın. 
                            İhtiyacınız olduğunda bize ulaşın ve hizmetlerimizin tadını çıkarın.</p>
                        <div class="send_bt"><a href="Taxicall.jsp">Hemen Taksi çagır</a></div>
                    </div>
                </div>
            </div>

        </div>
        <!-- why ride section end -->
        <!-- location section start -->
        <div id="contact" class="location_sectin layout_padding">
            <div class="container-fluid">
                <div class="location_main">
                    <div class="row">
                        <div class="col-sm-4"></div>
                        <div class="col-sm-5">
                            <div class="download_text">Indir<br><span style="color: #fffcf4;">UYGULAMAMIZ</span></div>
                        </div>
                        <div class="col-sm-3">
                            <div class="image_7"><img src="images/img-7.png"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- download section end -->
        <!-- section footer start -->
        <div class="section_footer ">
            <div class="container"> 
                <div class="footer_section_2">
                    <div class="row">
                        <div class="col-sm-6 col-md-6 col-lg-3">
                            <h2 class="account_text">Adres</h2>
                            <p class="ipsum_text">Ostim, 100. Yıl Blv 55/F, 06374 Ostim Osb/Yenimahalle/Ankara</p>
                        </div>
                        <div class="col-sm-6 col-md-6 col-lg-4">
                            <h2 class="account_text">Bağlantılar</h2>
                            <div class="image-icon"><img src="images/bulit-icon.png"><span class="fb_text"><a href="#">Ana Sayfa</span></a></div>
                            <div class="image-icon"><img src="images/bulit-icon.png"><span class="fb_text"><a href="#">Hakkında</span></a></div>
                            <div class="image-icon"><img src="images/bulit-icon.png"><span class="fb_text"><a href="#">Rezervasyon</span></a></div>
                            <div class="image-icon"><img src="images/bulit-icon.png"><span class="fb_text"><a href="#">Bize Ulaşın</span></a></div>
                        </div>
                        <div class="col-sm-6 col-md-6 col-lg-4">
                            <h2 class="account_text">Bizi Takip Edin</h2>
                            <div class="image-icon"><img src="images/fb-icon.png"><span class="fb_text"><a href="#">Facebook</a></span></div>
                            <div class="image-icon"><img src="images/twitter-icon.png"><span class="fb_text"><a href="#">Twitter</a></span></div>            
                            <div class="image-icon"><img src="images/instagram-icon.png"><span class="fb_text"><a href="#">Instagram</a></span></div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Javascript files-->
    <script src="js/jquery.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.bundle.min.js"></script>
    <script src="js/jquery-3.0.0.min.js"></script>
    <script src="js/plugin.js"></script>
    <!-- sidebar -->
    <script src="js/jquery.mCustomScrollbar.concat.min.js"></script>
    <script src="js/custom.js"></script>
    <!-- javascript --> 
    <script src="js/owl.carousel.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.js"></script>
    <script>
                                    $(document).ready(function () {
                                        $(".fancybox").fancybox({
                                            openEffect: "none",
                                            closeEffect: "none"
                                        });

                                        $(".zoom").hover(function () {

                                            $(this).addClass('transition');
                                        }, function () {

                                            $(this).removeClass('transition');
                                        });
                                    });
    </script> 
    <script>
        function openNav() {
            document.getElementById("myNav").style.width = "100%";
        }

        function closeNav() {
            document.getElementById("myNav").style.width = "0%";
        }
    </script>   

</body>

</html>
