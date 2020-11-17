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
   
	
	<script type="text/javascript">
		$(function(){
			//주문수량 제어
			$("#order").click(function(){
				console.log($("#p_cnt").val());
				if($("#p_cnt").val() <= 0 || $("#p_cnt").val() >= 6 ) {
					
					alert("주문 가능 수량은 1~5개 입니다.");
					$("#p_cnt").val("1");
					return;
				} 
				
				/* var ad = p_rkname.split(","); */
				
			});
			/* $("#colorback").click(function() {
				var selectDiv = $("<div>");
				selectDiv.addClass("selcDiv");
				
				("#.class").add(selectDiv);
			}) */
			
			
			
		})
	</script>
</head>
<body>
		<form name="f_data" id="f_data" method="post">
			<input type="hidden" name="p_num" value="${p_num}"/>
		</form>
		<div style="height: 70px; background:white"> </div>
	<!-- Product Page Section Beign -->
    <section class="product-page"> 
        <div class="container">
            <div class="row">
                <div class="col-lg-6">
                	<!-- 상품 이미지 -->
                    <div class="product-slider owl-carousel">
                    	<!--  -->
                       
		                        <c:forEach var="image" items="${images}" varStatus="status">
			                         <c:if test="${image.i_type == 'main'}">
		                        		<div class="product-img">
                       						<figure>
			                        			<img src="${image.i_address}" />
			                        		</figure>
                   			  			</div>
				                     </c:if>
			                      
		                        	<c:if test="${image.i_type == 'sub'}">
		                        		<div class="product-img">
                       						<figure>
			                        			<img src="${image.i_address}" />
			                        		</figure>
                   			  			</div>
		                        	</c:if>
		                        	   
	                            </c:forEach> 
	                     
                    </div><!-- 상품 이미지 END-->
                    
                </div>
                <div style="height: 50px; background:white"> </div>
                <!-- 상품 상단설명  -->
                <div class="col-lg-6">
                    <div class="product-content" style="color:#1C1C1C">
                        <p><h6>${detail.p_name}</h6></p>
                        <p><h6>${detail.p_price}</h6><p>
                        <p>${detail.p_size}</p>
                        
                         <div class="product-text" style="color:#1C1C1C">
                           <c:forTokens var="ex_top" items="${detail.p_ex_top}" delims="/">
                           	<p> ${ex_top}</p>
                           </c:forTokens>
                        </div> 
                      
                        <div class="${detail.p_color}" >
                           <c:forTokens var="color" items="${detail.p_color}" delims=",">
                           		<div style="display:inline-block; width:35px; height: 35px; background: ${color}"></div>
                           		<p></p>
                           </c:forTokens>
                        </div> 
                         
                        <div style="height: 10px; background:white"> </div>
                        <!-- 수량선택, 장바구니버튼 -->
                        <div class="product-quantity">
                            <div class="pro-qty">
                            	<input id="p_cnt" name="p_cnt" type="text" value="1">
                            </div>
                        </div>
                        <a href="#" class="primary-btn pc-btn" id="order">주문하기</a>
                        <a href="#" class="primary-btn pc-btn" id="cart">장바구니</a>
                        <div style="height: 100px; background:white"> </div>
                    </div>
                </div><!-- 상품 상단설명 END -->
            </div>
        </div>
    </section>
    <!-- Product Page Section End -->
			<div class="showProduct">
				<c:choose>
					<c:when test="${not empty detail}">
							<div class="text-center">
								<!-- 상품 목록 틀 -->
					            <div class="column" id="product-list"> 
				                    <div class="single-product-item" data-num="${detail.p_num}">
				                        <figure>
					                        <c:set var="count" value="0" />
						                        <c:forEach var="image" items="${images}" varStatus="status1">
													<c:if test = "${image.i_type=='sub'}">
														<c:set var="count" value="${count+1}" />
													  	<img src="${image.i_address}" />
													  	<div style="height: 50px; background:white"> </div>
													  	<c:forTokens var="ex_bottom" items="${detail.p_ex_bottom}" delims="/" varStatus="status2">
														  	<c:if test="${count == status2.count}">
															  	<div class="ex_bottom">
																	<p>${ex_bottom}</p>
																</div>
															</c:if>
														</c:forTokens>
														<div style="height: 30px; background:white"> </div>
													</c:if>
					                            </c:forEach>
				                        </figure>
				                    </div>
					             </div>  
							</div>
					   </c:when>
				</c:choose>
			</div>
			<div>
				<p>[제작안내]</p>
				<div style="height: 20px; background:white"> </div>
				<p>가죽공방 AwesomeLeather는 수작업 주문제작 방식입니다.</p>
				<p>모든 제품은 주문 접수 후 제작을 시작하여 발송까지 평균 일주일정도 소요됩니다.</p>
				<p>제품마다 제작 기간이 다르니 주문 전 반드시 확인해 주시기 바랍니다.</p>
				<div style="height: 20px; background:white"> </div>
				<p>1. 주문 접수</p>
				<p>2. 제품 제작</p>
				<p>- 지갑, 노트커버 등 소형 제품 제작 4~5일 소요/가방류 최대 4주소요</p>
				<p>- 각인작업 1일 소요</p>
				<p>3. 검수 및 발송</p>
				<p>4. 배송 : 우체국택배 상황에 따라 1~2일 정도 소요됩니다. (토, 일, 공휴일 휴무)</p>
				<div style="height: 40px; background:white"> </div>
				
				
				<p>[주의사항]</p>
				<div style="height: 20px; background:white"> </div>
				<p>주문제작 방식 이기 때문에 주문 후 제품을 받아 보실 때까지 시간이 다소 걸립니다. 내용을 꼭 확인하시고 주문해 주시기 바랍니다. 제작 기간을 이유로 환불하실 경우, 반드시 각인 작업 전에 해주셔야 합니다.</p>
				<p>(고객센터 문의 : 02-2238-0322)</p>
				<div style="height: 40px; background:white"> </div>
				
				
				<p>[교환 & 환불 & A/S]</p>
				<div style="height: 20px; background:white"> </div>
				<p>품질 보증</p>
				<p>구입하신 제품의 보증기간은 구입일로부터 1년입니다.보증기간 내에는 무상수리가 원칙이며, 불량품이나 동일한 하자가 3회 이상 반복될 경우교환, 환불 순으로 보상하여 드립니다. 소비자 과실로 제품을 수선하는 경우 수선 비용이 청구될 수 있습니다.</p>
				<div style="height: 40px; background:white"> </div>
				
				<p>교환 및 환불</p>
				<div style="height: 20px; background:white"> </div>
				<p>전자상거래법 제17조에 의거, 배송일로부터 7일 이내에교환 및 환불이 가능합니다. 또한 제품의 내용이 광고 내용과 다르거나 계약 내용이 다르게 이행된 경우, 배송일로부터 3개월 이내, 혹은 그 사실을 안 날로부터 30일 이내에 청약을 철회할 수 있습니다.</p>
				<div style="height: 20px; background:white"> </div>
				<p>그러나 다음의 경우에는 교환 및 환불이 불가능합니다.</p>
				<p>1. 소비자에게 책임이 있는 사유로 재화 등이 멸실되거나 훼손된 경우(포장은 제외)</p>
				<p>2. 소비자의 사용 또는 일부 소비로 재화 등의 가치가 현저히 감소한 경우</p>
				<p>3. 시간이 지나 다시 판매하기 곤란할 정도로</p>
				<div style="height: 20px; background:white"> </div>
				<p>재화 등의 가치가 현저히 감소한 경우</p>
				<div style="height: 40px; background:white"> </div>
				
				<p>교환 및 환불이 어려운 경우</p>
				<p>*제품에 하자가 없다면, 개인각인을 하신 경우</p>
				<p>*장시간 사용하여 자연적으로 가죽이 늘어나거나 낡은 경우</p>
				<p>*단순 변심의 경우, 소비자의 사용에 의해 가죽에 사용감이 생겼을 경우</p>
				<div style="height: 20px; background:white"> </div>
				<p>베지터블 가죽은 하루 정도 사용하시면 다시 판매할 수 없는 상태가 되므로, 신중히 구매 결정을 해주시기 바랍니다.</p>
			
			</div>
			<div style="height: 60px; background:white"> </div>
</body>
</html>