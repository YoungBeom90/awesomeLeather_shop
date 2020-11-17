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
	    <link rel="icon" type="image/png" sizes="16x16" href="resources/images/icon.png">
	    <title>Awesome Leather Admin page</title>
	    <link href="/resources/include/assets/libs/chartist/dist/chartist.min.css" rel="stylesheet">
	    <link href="/resources/include/dist/css/style.min.css" rel="stylesheet">
	    <script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
	    <script type="text/javascript">
	    	$(function() {
	    		$("#pd_inserFormBtn").click(function() {
	    			location.href = "/admin/productInsertForm";
	    		});
	    	})
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
	        <!-- ============================================================== -->
	        <!-- Page wrapper  -->
	        <!-- ============================================================== -->
	        <div class="page-wrapper">
	            <!-- ============================================================== -->
	            <!-- Bread crumb and right sidebar toggle -->
	            <!-- ============================================================== -->
	            <div class="page-breadcrumb">
	                <div class="row">
	                    <div class="col-5 align-self-center">
	                        <h4 class="page-title">통 계</h4>
	                    </div>
	                </div>
	            </div>
	            <!-- ============================================================== -->
	            <!-- End Bread crumb and right sidebar toggle -->
	            <!-- ============================================================== -->
	            <!-- ============================================================== -->
	            <!-- Container fluid  -->
	            <!-- ============================================================== -->
	            <div class="container-fluid">
	                <!-- ============================================================== -->
	                <!-- Email campaign chart -->
	                <!-- ============================================================== -->
	                <form class="form-horizontal m-t-30">
	                <div class="row">	                    
	                    <div class="col-md-2">
	                        <div class="card">
	                            <div class="card-body">
	                                <h5 class="card-title m-b-5">총 회원수</h5>
	                                <h3 class="font-light">${data.customer_total} 명</h3>
	                            </div>
	                        </div>
                        </div>
                        <div class="col-md-2">	                        
	                        <div class="card">
	                            <div class="card-body">
	                                <h5 class="card-title m-b-5">총 매출액</h5>
	                                <h3 class="font-light">￦ ${data.price_total}</h3>	                                
	                            </div>
	                        </div>
                        </div>
                        <div class="col-md-2">
	                        <div class="card">
	                            <div class="card-body">
	                                <h5 class="card-title m-b-5">총 주문 건수</h5>
	                                <h3 class="font-light">${data.list_total} 건</h3>	                                
	                            </div>
	                        </div>
                        </div>
                        <div class="col-md-2">
	                        <div class="card">
	                            <div class="card-body">
	                                <h5 class="card-title m-b-5">판매중인 상품 수</h5>
	                                <h3 class="font-light">${data.product_total} 개</h3>	                                
	                            </div>
	                        </div>
                        </div>
                     </div>
                     
                     <div class="row">
                        <div class="col-md-2">
	                        <div class="card">
	                            <div class="card-body">
	                                <h5 class="card-title m-b-5">오늘 가입자 수</h5>
	                                <h3 class="font-light">${data.customer_today} 명</h3>	                                
	                            </div>
	                        </div>
                        </div>
                        <div class="col-md-2">
	                        <div class="card">
	                            <div class="card-body">
	                                <h5 class="card-title m-b-5">오늘 매출액</h5>
	                                <h3 class="font-light">￦ ${data.price_today}</h3>	                                
	                            </div>
	                        </div>
                        </div>
                        <div class="col-md-2">
	                        <div class="card">
	                            <div class="card-body">
	                                <h5 class="card-title m-b-5">오늘 주문 건수</h5>
	                                <h3 class="font-light">${data.list_today} 건</h3>	                                
	                            </div>
	                        </div>
                        </div>
                        <div class="col-md-2">
	                        <div class="card">
	                            <div class="card-body">
	                                <h5 class="card-title m-b-5">배송 대기 건수</h5>
	                                <h3 class="font-light">${data.delivery_wait} 건</h3>	                                
	                            </div>
	                        </div>
                        </div>
                   	 </div>                   	
	                <div class="row">	                
		                <div class="col-md-8">
	                        <div class="card">
	                            <div class="card-body">
	                                <h4 class="card-title">월별 가입자 수</h4>
	                                <div class="sales ct-charts mt-3"></div>
	                            </div>
	                        </div>
	                    </div>
                    </div>
                    </form>
	                 
                </div>
	            <!-- ============================================================== -->
	            <!-- footer -->
	            <!-- ============================================================== -->
	            <footer class="footer text-center">
	                <tiles:insertAttribute name="footer"/>
	            </footer>
	            <!-- ============================================================== -->
	            <!-- End footer -->
	            <!-- ============================================================== -->
	        </div>
	        <!-- ============================================================== -->
	        <!-- End Page wrapper  -->
	        <!-- ============================================================== -->
	    </div>
	    <!-- ============================================================== -->
	    <!-- End Wrapper -->
	    <!-- ============================================================== -->
	    <!-- ============================================================== -->
	    <!-- All Jquery -->
	    <!-- ============================================================== -->
	    <script src="/resources/include/assets/libs/jquery/dist/jquery.min.js"></script>
	    <!-- Bootstrap tether Core JavaScript -->
	    <script src="/resources/include/assets/libs/popper.js/dist/umd/popper.min.js"></script>
	    <script src="/resources/include/assets/libs/bootstrap/dist/js/bootstrap.min.js"></script>
	    <!-- slimscrollbar scrollbar JavaScript -->
	    <script src="/resources/include/assets/extra-libs/sparkline/sparkline.js"></script>
	    <!--Wave Effects -->
	    <script src="/resources/include/dist/js/waves.js"></script>
	    <!--Menu sidebar -->
	    <script src="/resources/include/dist/js/sidebarmenu.js"></script>
	    <!--Custom JavaScript -->
	    <script src="/resources/include/dist/js/custom.min.js"></script>
	    <!--This page JavaScript -->
	    <!--chartis chart-->
	    <script src="/resources/include/assets/libs/chartist/dist/chartist.min.js"></script>
	    <script src="/resources/include/assets/libs/chartist-plugin-tooltips/dist/chartist-plugin-tooltip.min.js"></script>
	    <script src="/resources/include/dist/js/pages/dashboards/dashboard1.js"></script>
	</body>

</html>