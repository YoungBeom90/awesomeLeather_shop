<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
    <script type="text/javascript" src="/resources/include/js/html5shiv.js"></script>
	<script type="text/javascript" src="/resources/include/js/common.js"></script>
	<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
	<script type="text/javascript" src="/resources/include/dist/js/bootstrap.min.js"></script>
    <script type="text/javascript">
    	$(function(){
    		//상품 클릭 시 상세 페이지 이동을 위한 처리 이벤트
			$(".goDetail").click(function(){
				var p_num = $(this).parents("div").attr("data-num");
				$("#p_num").val(p_num);
				console.log("상품번호: " + p_num);
				//상세 페이지로 이동하기 위해  form 추가(id: detailForm)
				$("#detailForm").attr({
					"method" : "get",
					"action" : "/product/clientProductDetail"
				});
				$("#detailForm").submit();
			});
    	});
    
    </script>
</head>
<body>
	<form id="detailForm" name="detailForm">
			<input type="hidden" id="p_num" name="p_num"/>
	</form>
	

	<!-- Best Product section -->
    <section class="latest-products spad">
    	<!--Best Product + 카테고리 -->
        <div class="container">
        	<!-- 카테고리  -->
            <div class="product-filter">
                <div class="row">
                    <div class="col-lg-12 text-center">
                        <ul class="product-controls">
                            <li data-filter="*">All</li>
                            <li data-filter=".WALLET">WALLET</li>
                            <li data-filter=".CARD　WALLET">CARD　WALLET</li>
                            <li data-filter=".POUCH">POUCH (파우치)</li>
                            <li data-filter=".BELT">BELT (벨트)</li>
                            <li data-filter=".PEN POUCH">PEN POUCH (필통)</li>
                            <li data-filter=".NOTE COVER">NOTE COVER(노트 커버)</li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- ProductList -->
           
            <!-- 상품 리스트 출력 -->
			<div class="showProduct" >
				<c:choose>
					<c:when test="${not empty productList}">
						<c:forEach var="product" items="${productList}" varStatus="status">
							<c:set var="doneLoop" value="false"/>
								<div class="text-center">
									<!-- 상품 목록 틀 -->
						            <div class="column" id="product-list"> 
						                <div class="col-lg-3 col-sm-6 mix all ${product.p_category}" >
						                    <div class="single-product-item" data-num="${product.p_num}">
						                        <figure>
							                        <c:forEach var="image" items="${imageList}" varStatus="status">
							                        	<c:if test="${not doneLoop}">
															<c:if test = "${product.p_num == image.p_num}">
															  	<a href="#" class="goDetail" ><img src="${image.i_address}" /></a>
																<!--<div class="goDetail"><img src="${image.i_address}"></div>-->
																<c:set var="doneLoop" value="true"/> 
															</c:if>
														</c:if>
						                            </c:forEach>
						                        </figure>
						                        <div class="product-text">
						                            <h5>${product.p_name}</h5>
						                            <h6>${product.p_price}</h6>
						                            <c:forTokens var="color" items="${product.p_color}" delims=",">
						                            	<div style="display:inline-block; width:15px; height: 5px; background: ${color}"></div>
						                            </c:forTokens>
						                        </div>
						                    </div>
						                </div>
						             </div>   <!-- 상품목록 틀 End --> 
								</div>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<div class="text-center">상품이 존재하지 않습니다.</div>
					</c:otherwise>
				</c:choose>
			</div>
        </div> <!-- Best Product + 카테고리  End-->
       
    </section>
    <!-- Best Product section End -->
</body>
</html>