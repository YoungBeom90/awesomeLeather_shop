<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
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
		<style type="text/css">
			.listResult { padding:20px; background:#eee; }
			.listResult .sum { float:left; width:45%; font-size:22px; }
			
			.listResult .orderOpne { float:right; width:45%; text-align:right; }
			.listResult .orderOpne button { font-size:18px; padding:5px 10px; border:1px solid #999; background:#fff;}
			.listResult::after { content:""; display:block; clear:both; }
		</style>
	
		<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
		<script type="text/javascript" src="/resources/include/js/common.js"></script>
		<script type="text/javascript" src="/resources/include/dist/js/bootstrap.min.js"></script>
		<script type="text/javascript">
			$(function(){
				$("#orderBtn").click(function(){
					$("#basketListForm").attr({
						"method":"post",
						"action":"/ordertable/orderForm"
					});
					$("#basketListForm").submit(); 
					
				});
			});			
			
			$("#allCheck").click(function(){
				var chk = $("#allCheck").prop("checked");
				if(chk) {
					$(".chkBox").prop("checked", true);
				} else {
					$(".chkBox").prop("checked", false);
				}
			});
			
			$(".chkBox").click(function(){
				$("#allCheck").prop("checked", false);
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
        		
	
	
	
		<div class="cart-page">
        <div class="container">
            <div>
            	<form id="form">
            		<input type="hidden" id="o_num" name="o_num" >
            	</form>
            	<form id="basketListForm">
            	
            	
            	<c:choose>
							<c:when test="${not empty list }">
							<c:set var="sum" value="0" />
								<c:forEach var="vo" items="${list}" varStatus="status">
								<input type="hidden" name="list" value="${vo.b_num}">
								</c:forEach>
							</c:when>
							
						</c:choose>						
            	
            	
                <table class="table">
                    <thead>
                        <tr>
                            <th><input type="checkbox" id="allCheck"></th>
                            <th>상품정보</th>                            
                            <th>금액</th>
                            <th>수량</th>
                           
                            
                        </tr>
                    </thead>
                    <tbody id ="list">
                    
                    <!-- 데이터 출력 -->
						<c:choose>
							<c:when test="${not empty list }">
							<c:set var="sum" value="0" />
								<c:forEach var="vo" items="${list}" varStatus="status">
									<tr class=" product-col" data-num="${vo.b_num }">
										<td><input type="checkbox" name="chkBox" class="chkBox"></td>
										<td class=" product-col">
											${vo.p_name}<br />
											${vo.b_color}<br />
											${vo.b_size}
										</td>
										<td class=" product-col" >${vo.b_price }원</td>
										<td class=" product-col">
											<button type="button" class="plus">+</button>
											<input type="number" class="numBox" min="1" max="5" value="${vo.b_cnt }" />
											<button type="button" class="minus">-</button>
										</td>
															
									</tr>
									<c:set var="sum" value="${sum + (vo.b_price * vo.b_cnt )}" />
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="4"  class="tac text-center">장바구니가 비어 있습니다.</td>
								</tr>	
							</c:otherwise>
						</c:choose>						
					</tbody>
                </table>
                <div class="listResult">
					 <div class="sum">
					  총 금액 : <fmt:formatNumber pattern="###,###,###" value="${sum}" />원 (배송비: 2,500원 포함)
					 </div>
					 <div class="orderOpne">
					  <button type="button" class="orderOpne_bnt">주문 정보 입력</button>
					 </div>
					</div>
                </form>
                <input type="button" value="주문하기" id="orderBtn">
            </div>
          </div>
         </div> 
	</body>
</html>