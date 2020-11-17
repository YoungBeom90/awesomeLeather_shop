<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
      
		<!-- 모바일 웹 페이지 설정 -->
		<link rel="shortcut icon" href="/resources/images/icon.png" />
		<link rel="apple-touch-icon" href="/resources/images/icon.png" />
		<!-- 모바일 웹 페이지 설정 끝 -->
		
		<!--[if lt IE 9]>
		<script src="/resources/include/js/html5shiv.js"></script>
		<![endif]--><title>Insert title here</title>
		<link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap.min.css" />
		<link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap-theme.min.css" />
		
		 <!-- Google Font -->
	    <link href="https://fonts.googleapis.com/css?family=Amatic+SC:400,700&display=swap" rel="stylesheet">
	    <link href="https://fonts.googleapis.com/css?family=Montserrat:100,200,300,400,500,600,700,800,900&display=swap" rel="stylesheet">
		
	    <!-- Css Styles -->
	    <link rel="stylesheet" href="/resources/include/dist/css/bootstrap.min.css" type="text/css">
	    <link rel="stylesheet" href="/resources/include/dist/css/font-awesome.min.css" type="text/css">
	    <link rel="stylesheet" href="/resources/include/dist/css/nice-select.css" type="text/css">
	    <link rel="stylesheet" href="/resources/include/dist/css/owl.carousel.min.css" type="text/css">
	    <link rel="stylesheet" href="/resources/include/dist/css/magnific-popup.css" type="text/css">
	    <link rel="stylesheet" href="/resources/include/dist/css/slicknav.min.css" type="text/css">
	    <link rel="stylesheet" href="/resources/include/dist/css/style.css" type="text/css">
		
	
		<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
		<script type="text/javascript" src="/resources/include/js/common.js"></script>
		<script type="text/javascript" src="/resources/include/dist/js/bootstrap.min.js"></script>
		
		<script type="text/javascript">
			$(function(){
				if($("#l_state").val()>=2){
					$(".orderCancleBtn").hide();
					var confirmBtn = $("<input>");
					confirmBtn.attr({"type":"button","id":"reviewBtn","value":"리뷰작성"});
					$("#buttonArea").append(confirmBtn);
				}
				$("#reviewBtn").click(function(){
					
				});
				
				$("#orderDetailBtn").click(function(){
					var o_num = $(this).parents("tr").attr("data-num");
					$("#o_num").val(o_num);
					$("#form").attr({
						"method":"post",
						"action":"/ordertable/orderDetail"
					});
					$("#form").submit();
					
				});
				
				$(".orderCancleBtn").click(function(){
					if(confirm("정말 주문을 취소하시겠습니까?")){
						var o_num = $(this).parents("tr").attr("data-num");
						$("#o_num").val(o_num);
						$("#form").attr({
							"method":"post",
							"action":"/ordertable/orderDelete"
						});
						$("#form").submit();
					}
					
				});
			});
		</script>
	</head>
	<body>	
		<!-- ============================================================== -->
		<!-- Left Sidebar - style you can find in sidebar.scss  -->
		<!-- ============================================================== -->
        <aside class="left-sidebar" data-sidebarbg="skin5">
            <!-- Sidebar scroll-->
            <div class="scroll-sidebar">
                <!-- Sidebar navigation-->
                <nav class="sidebar-nav">
                    <ul id="sidebarnav">
                        <li class="sidebar-item">
                            <a class="sidebar-link waves-effect waves-dark sidebar-link" href="/ordertable/ordertableList" aria-expanded="false">
                                <i class="mdi mdi-av-timer"></i>
                                <span class="hide-menu">주문확인</span>
                            </a>
                        </li>
                         <li class="sidebar-item">
                            <a class="sidebar-link waves-effect waves-dark sidebar-link" href="/basket/basketList" aria-expanded="false">
                                <i class="mdi mdi-arrange-bring-forward"></i>
                                <span class="hide-menu">장바구니</span>
                            </a>
                        </li>
                        <li class="sidebar-item">
                            <a class="sidebar-link waves-effect waves-dark sidebar-link" href="/customer/updateForm" aria-expanded="false">
                                <i class="mdi mdi-border-none"></i>
                                <span class="hide-menu">회원정보수정</span>
                            </a>
                        </li>	                        
                    </ul>
                </nav>
                <!-- End Sidebar navigation -->
            </div>
            <!-- End Sidebar scroll-->
        </aside>	        
        <!-- ============================================================== -->
        <!-- End Left Sidebar - style you can find in sidebar.scss  -->
        <!-- ============================================================== -->
        	
	<!-- Cart Page Section Begin -->
    <div class="cart-page">
        <div class="container">
            <div>
            	<form id="form">
            		<input type="hidden" id="o_num" name="o_num" >
            	</form>
                <table class="table">
                    <thead>
                        <tr>
                            <th>주문번호</th>
                            <th>주문일자</th>
                            <th>상품정보</th>                            
                            <th>수량</th>
                            <th>구매금액</th>
                            <th>주문처리상태</th>
                            <th>주문취소</th>
                        </tr>
                    </thead>
                    <tbody id ="list">
                    
                    <!-- 데이터 출력 -->
						<c:choose>
							<c:when test="${not empty list}">
								<c:forEach var="vo" items="${list }" varStatus="status">
									<tr class=" product-col" data-num="${vo.o_num }">
										<td class="">${vo.o_num }<br />
											<input type="button" id="orderDetailBtn" value="주문상세내역" />
										</td>										
										<td class=" product-col">${vo.o_date }
											
										</td>										
										<td class=" product-col">${vo.l_name } / ${vo.l_color }/${vo.l_size }</td>
										<td class=" product-col">${vo.l_cnt }개</td>
										<td class=" product-col" >${vo.l_price }원</td>
										<td class=" product-col" id="l_state">
											<c:if test="${vo.o_state==0 }">입금확인</c:if>
											<c:if test="${vo.o_state==1 }">배송준비중</c:if>
											<c:if test="${vo.o_state==2 }">배송중</c:if>											
											<c:if test="${vo.o_state==3 }">배송완료</c:if>											
										</td>
										<td id="buttonArea"><input type="button" class="orderCancleBtn" value="주문취소"></td>
									</tr>	
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="8"  class="tac text-center">상품 주문 내역이 존재하지 않습니다.</td>
								</tr>	
							</c:otherwise>
						</c:choose>
					</tbody>
                </table>
            </div>
          </div>
         </div>   
	
		<%-- <div>
			
			<table class="table table-striped">
					<thead>
						<tr>
							<th class="text-center">주문번호</th>
							<th class="text-center">주문일자</th>
							
							<th class="text-center">상품정보</th>
							<th class="text-center">수량</th>
							<th class="text-center">구매금액</th>
							<th class="text-center">주문처리상태</th>
							<th class="text-center">주문취소</th>
							
						</tr>	
					</thead>
					<tbody id ="list" class="table-striped">
						<!-- 데이터 출력 -->
						<c:choose>
							<c:when test="${not empty list }">
								<c:forEach var="vo" items="${list }" varStatus="status">
									<tr class="text-center" data-num=${vo.o_num }>
										<td class="text-center">${vo.o_num }<br />
											<input type="button" id="orderDetailBtn" value="주문상세내역" />
										</td>
										<td class="text-center">${vo.o_date }
											<c:if test="${vo.r_cnt>0 }"><span class="cnt">[${vo.r_cnt}]</span></c:if>
										</td>
										
										<td class="text-center">${vo.l_name } / ${vo.l_color }/${vo.l_size }</td>
										<td class="text-center">${vo.l_cnt }</td>
										<td class="text-center">${vo.l_price }</td>
										<td class="text-center" id="l_state">
											<c:if test="${vo.o_state==0 }">입금확인</c:if>
											<c:if test="${vo.o_state==1 }">배송준비중</c:if>
											<c:if test="${vo.o_state==2 }">배송중</c:if>											
											<c:if test="${vo.o_state==3 }">배송완료</c:if>
											
										</td>
										<td id="buttonArea"><input type="button" id="orderCancleBtn" value="주문취소"></td>
									</tr>	
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="8"  class="tac text-center">상품 주문 내역이 존재하지 않습니다.</td>
								</tr>	
							</c:otherwise>
						</c:choose>
					</tbody>	
						
				</table>
		</div> --%>
	</body>
</html>