<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
	
	
		<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
		<script type="text/javascript" src="/resources/include/js/common.js"></script>
		<script type="text/javascript" src="/resources/include/dist/js/bootstrap.min.js"></script>
				<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("o_address4").value = extraAddr;
                
                } else {
                    document.getElementById("o_address4").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('o_address1').value = data.zonecode;
                document.getElementById("o_address2").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("o_address3").focus();
            }
        }).open();
    }
</script>
		
		<script type="text/javascript">
			$(function(){
				/* var total = {bvo.b_price} +2500;   
				$("#totalPrice").val(total); */
				$("#addressBtn").click(function(){
					$("#o_address1").val("${cvo.c_address1 }");
					$("#o_address2").val("${cvo.c_address2 }");
					$("#o_address3").val("${cvo.c_address3 }");
					$("#o_address4").val("${cvo.c_address4 }");
				});
				
				if($("#o_pay1").is(":checked")){
					
					$("#o_pay").val(0);
					
				}
				if($("#o_pay2").is(":checked")){
					$("#o_pay").val(1);
					
				}
				
				$("#goBasketBtn").click(function(){
					
					
						
						 $("#basketForm").attr({
							"method":"get",
							"action":"/basket/basketList"
						});
						$("#basketForm").submit(); 
					});
					
				$("#orderBtn").click(function(){
					if(!chkData("#c_name","수령인 이름을")) return;
					if(!chkData("#c_phone","수령인 전화번호를")) return;
					if(!chkData("#o_address3","주소를")) return;
					if($("#o_pay").val()==null){
						alert("결제수단을 선택해 주세요");
						return;
					}
					$("#basketForm").attr({
						"method":"post",
						"action":"/ordertable/orderInsert"
					});
					$("#basketForm").submit(); 
					
					
					alert("주문이 완료되었습니다.");
					location.href="/";
					
				});	
					
				
			});
		</script>
	</head>
	<body>
		<div>
			<form id="basketForm">
				<%-- <input type="hidden" id="b_num" name="b_num" value="${bvo.b_num }"> --%>
			</form>
			<form id="orderForm">			
				<div>
					<h2>주문 정보</h2>
				</div>
				 <table class="table">
                    <thead>
                        <tr>
                           
                            <th>상품정보</th>                            
                            <th>금액</th>
                            <th>수량</th>
                           
                            
                        </tr>
                    </thead>
                    <tbody id ="list">
                    
                    <!-- 데이터 출력 -->
						<c:choose>
							<c:when test="${not empty bvo }">
								<c:set var="sum" value="2500" />
								<c:forEach var="vo" items="${bvo}" varStatus="status">
									<tr class=" product-col" data-num="${vo.b_num }">
										
										<td class=" product-col">
											${vo.p_name}<br />
											${vo.b_color}<br />
											${vo.b_size}
										</td>
										<td class=" product-col" >${vo.b_price }원</td>
										<td class=" product-col">
											
											<input type="number" class="numBox" min="1" max="5" value="${vo.b_cnt }" readonly="readonly"/>
											
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
				<div>
					<label>주문자</label>
					<input type="text" id="c_name" readonly="readonly" value="${cvo.c_name }">
					<input type="text" id="c_phone" readonly="readonly" value="${cvo.c_phone }">
				</div>
				<div>
					<label>수령인</label>
					<input type="text" id="o_name" value="${cvo.c_name }">
					<input type="text" id="o_phone" value="${cvo.c_phone }">
				</div>
				<div>
					<label>배송지 선택</label>
					<input type="button" id="addressBtn" value="기본 배송지">
					
				</div>
				<div>					
					<input type="text" id="o_address1" placeholder="우편번호"  >
					<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
					<input type="text" id="o_address2" placeholder="주소"   >
								<input type="text" id="o_address3" placeholder="상세주소" >
								<input type="text" id="o_address4" placeholder="참고항목" >
								
					
					
										
				</div>
				 <%--<div>
					<label>주문상품정보</label><br />
						<table>
							<tr>
								<td>상품정보/수량</td>
								<td>상품금액</td>
								<td>배송비</td>
							</tr>
							<tr>
								<td><input type="text" id="p_name" value="${bvo.p_name }" readonly="readonly"></td>
							
								<td><input type="text" id="b_price" value="${bvo.b_price}" readonly="readonly"></td>
								<td><input type="text" value="2,500원" readonly="readonly"></td>						
								
								
						</table>
				</div>	
				--%>	 
				<div>
					<label>결제 수단 선택</label><br />
					<label>계좌이체</label><input type="checkbox" id="o_pay1"/><br />
					<label>카드결제</label><input type="checkbox" id="o_pay2" /><br />
					<input type="hidden" id="o_pay" name="o_pay">
					
				</div>
				<div>
					<label>총 결제 금액</label><fmt:formatNumber pattern="###,###,###" value="${sum}" />원(배송비 :2,500원 포함)
					<input type="button" id="goBasketBtn" value="상품수정하기" />
					<input type="button" id="orderBtn" value="주문하기" />
				</div>
						
					
				
			</form>
		</div>
	</body>
</html>