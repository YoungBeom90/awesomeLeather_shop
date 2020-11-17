<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html dir="ltr" lang="en">

	<head>
	    <meta charset="utf-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <!-- Tell the browser to be responsive to screen width -->
	    <meta name="viewport" content="width=device-width, initial-scale=1">
	    <meta name="description" content="">
	    <meta name="author" content="">
	    <!-- Favicon icon -->
	    <link rel="icon" type="image/png" sizes="16x16" href="/resources/images/icon.png">
	    <title>Awesome Leather Admin page</title>
	    <link href="/resources/include/dist/css/style.min.css" rel="stylesheet">
	    <script src="/resources/include/assets/libs/jquery/dist/jquery.min.js"></script>
	    <!-- Bootstrap tether Core JavaScript -->
	    <script src="/resources/include/assets/libs/popper.js/dist/umd/popper.min.js"></script>
	    <script src="/resources/include/assets/libs/bootstrap/dist/js/bootstrap.min.js"></script>
	    <script src="https://kit.fontawesome.com/55d26c8fd8.js" crossorigin="anonymous"></script>
	    <!-- slimscrollbar scrollbar JavaScript -->
	    <script src="/resources/include/assets/extra-libs/sparkline/sparkline.js"></script>
	    <!--Wave Effects -->
	    <script src="/resources/include/dist/js/waves.js"></script>
	    <!--Menu sidebar -->
	    <script src="/resources/include/dist/js/sidebarmenu.js"></script>
	    <!--Custom JavaScript -->
	    <script src="/resources/include/dist/js/custom.js"></script>
	    
	    <script type="text/javascript">
	    </script>
	</head>

	<body>
	    <!-- ============================================================== -->
	    <!-- Preloader - style you can find in spinners.css -->
	    <!-- ============================================================== -->
	    <div class="preloader">
	        <div class="lds-ripple">
	            <div class="lds-pos"></div>
	            <div class="lds-pos"></div>
	        </div>
	    </div>
	    <!-- ============================================================== -->
	    <!-- Main wrapper - style you can find in pages.scss -->
	    <!-- ============================================================== -->
	    <div id="main-wrapper" data-navbarbg="skin6" data-theme="light" data-layout="vertical" data-sidebartype="full" data-boxed-layout="full">
	        <header class="topbar" data-navbarbg="skin6">
	            <tiles:insertAttribute name="header"/>
	        </header>
	        <aside class="left-sidebar" data-sidebarbg="skin5">
	        	<tiles:insertAttribute name="aside"/>
	        </aside>
	        <div class="page-wrapper">
	        
	            <div class="container">
	            	<tiles:insertAttribute name="body" />
	            </div>
	            
	            <footer class="footer text-center">
	                <tiles:insertAttribute name="footer"/>
	            </footer>
	            
	        </div>
	        
	    </div>
	</body>

</html>