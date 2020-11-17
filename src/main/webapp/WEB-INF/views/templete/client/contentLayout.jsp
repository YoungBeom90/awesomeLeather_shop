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
	<!-- Fixed navbar -->
	<nav class="navbar navbar-default navbar-fixed-top">
	    <tiles:insertAttribute name="header" />
	</nav>
  <!-- CONTENT -->
  <!-- Hero Slider Begin -->
   		<div class="container">
            <div class="page-header">
                <h1><tiles:getAsString name="title" /></h1>
            </div>
            <tiles:insertAttribute name="body" />
        </div>
    <!-- Hero Slider End -->
    <!-- CONTENT End -->
    <footer class="footer">
     
        <tiles:insertAttribute name="footer" />
    </footer>
</body>
<!-- Js Plugins -->
<script src="/resources/include/js/jquery-3.3.1.min.js"></script>
<script src="/resources/include/js/bootstrap.min.js"></script>
<script src="/resources/include/js/jquery.magnific-popup.min.js"></script>
<script src="/resources/include/js/jquery.slicknav.js"></script>
<script src="/resources/include/js/owl.carousel.min.js"></script>
<script src="/resources/include/js/jquery.nice-select.min.js"></script>
<script src="/resources/include/js/mixitup.min.js"></script>
<script src="/resources/include/js/main.js"></script>