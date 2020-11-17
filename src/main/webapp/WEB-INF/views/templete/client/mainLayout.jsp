<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Yoga Studio Template">
    <meta name="keywords" content="Yoga, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>AwesomeLeather</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css?family=Amatic+SC:400,700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:100,200,300,400,500,600,700,800,900&display=swap"
        rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="/resources/include/dist/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="/resources/include/dist/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="/resources/include/dist/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="/resources/include/dist/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="/resources/include/dist/css/magnific-popup.css" type="text/css">
    <link rel="stylesheet" href="/resources/include/dist/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="/resources/include/dist/css/style.css" type="text/css">
</head>

<body>
   <!-- Header -->
    <header class="header-section">
		<tiles:insertAttribute name="header" />
	</header>
    <!-- Header End -->

	<!-- CONTENT -->
    <!-- Hero Slider Begin -->
    <section class="hero-slider" >
        <div class="hero-items owl-carousel" >
            <div class="single-slider-item set-bg" data-setbg="/resources/images/main/main1-1.jpg">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <h1>2020</h1>
                            <h2>AwesomeLeather.</h2>
                            <h2>&nbsp;</h2>
                         <!-- <a href="#" class="primary-btn">See More</a> --> 
                        </div>
                    </div>
                </div>
            </div>
            <div class="single-slider-item set-bg" data-setbg="/resources/images/main/main1-2.jpg">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <h1>&nbsp;</h1>
                            <h2>&nbsp;</h2>
                            <h2>&nbsp;</h2>
                        </div>
                    </div>
                </div>
            </div>
            <div class="single-slider-item set-bg" data-setbg="/resources/images/main/main1-3.jpg">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <h1>&nbsp;</h1>
                            <h2>&nbsp;</h2>
                            <h2>&nbsp;</h2>
                        </div>
                    </div>
                </div>
            </div>
           
        </div>
    </section>
    <!-- Hero Slider End -->
    
    <!-- Newest Product Begin -->
    <section class="latest-products spad">
        <div class="container">
            <div class="product-filter">
                <div class="row">
                    <div class="col-lg-12 text-center">
                        <div class="section-title">
                            <h2>New</h2>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row" id="product-list">
                <div class="col-lg-3 col-sm-6 mix all dresses bags">
                    <div class="single-product-item">
                        <figure>
                            <a href="#"><img src="" alt="">상품 이미지</a>
                        </figure>
                        <div class="product-text">
                            <h6>상품 이름</h6>
                            <p>상품 가격</p>
                        </div>
                    </div>
                </div>
                
            </div><!-- ProductList End -->
        </div>
    </section>
    <!-- Newest Product End -->
    
    
    
    
    <!-- CONTENT End -->

	<!-- Footer  -->
	<footer class="footer-section spad">
    	<tiles:insertAttribute name="footer" />
    </footer>
    
    <!-- Footer End -->

    <!-- Js Plugins -->
    <script src="/resources/include/js/jquery-3.3.1.min.js"></script>
    <!-- <script src="/resources/include/js/bootstrap.min.js"></script> -->
    <script src="/resources/include/js/jquery.magnific-popup.min.js"></script>
    <script src="/resources/include/js/jquery.slicknav.js"></script>
    <script src="/resources/include/js/owl.carousel.min.js"></script>
    <script src="/resources/include/js/jquery.nice-select.min.js"></script>
    <script src="/resources/include/js/mixitup.min.js"></script>
    <script src="/resources/include/js/main.js"></script>
</body>

</html>