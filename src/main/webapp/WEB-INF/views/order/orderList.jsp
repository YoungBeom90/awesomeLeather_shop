<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
		<link rel="apple-touch-icon" href="/resources/image/icon.png" />
		<title></title>
		<!--[if lt IE 9]>
		<script src="../js/html5shiv.js"></script>
		<![endif]-->
		<style type="text/css">
			input[type='button'] {
				border-radius: 3px 3px;
				margin: 5px;
			}
			#topImage {
				width: 30px;
			}
			.btn-link {
			    font-weight: 400;
			    color: #7460ee;
			    background-color: transparent;
			}
			#sp {
				font-size: 9px;
			}
		</style>
		<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
		<script type="text/javascript" src="/resources/include/dist/js/bootstrap.min.js"></script>
		<script type="text/javascript">
			$(function() {
				 
				
				//탑 버튼 기능 
				$( '#topImage' ).click( function() {
				    var htmloffset = $( 'html' ).offset();
				    $( 'html, body' ).animate( { scrollTop : htmloffset.top }, 400 );
				});
				// 결제 완료 버튼 제어
				$(".stateUpdate").click(function() {
					var updateURL = "";
					var button_val = $(this).val();
					var message = "";
					var resultChk = 0;
					var o_num = $(this).parents("tr").attr("data-num");
					if(button_val == "입금확인") {
						updateURL = "/order/statePayUpdate";
						message = "입금확인 처리하시겠습니까?";
						resultChk = 1;
					} else if(button_val == "배송처리") {
						updateURL = "/order/stateDeliUpdate";
						message = "배송처리 처리하시겠습니까?";
						resultChk = 2;
					} else if(button_val == "주문취소") {
						updateURL = "/order/stateCancelUpdate";
						message = "주문취소 처리하시겠습니까?";
						resultChk = 3;
					} 
					
					if(confirm(message)) {
						if(o_num != "") {
							
							$.ajax({
								url : updateURL,
								type : "post",
								data : "o_num="+o_num,
								dataType : "text",
								error : function() {
									alert("시스템 오류. 관리자에게 문의하세요.");
								},
								success : function(complete) {
									if(complete=="success") {
										if(resultChk == 1) {
											alert("결제완료 처리되었습니다.");
										} else if(resultChk == 2) {
											alert("배송완료 처리되었습니다.");
										} else if(resultChk == 3) {
											alert("주문취소 처리되었습니다.");
										}
										
										location.href= "/order/orderList";
									} else {
										alert("결제 확인중 데이터베이스에 오류가 발생하였습니다. 관리자에게 문의하세요.");
									}
								},
								error : function() {
									alert("시스템 오류가 발생 하였습니다. 관리자에게 문의하세요.");
								}
							});
						}
					}
				});
				
				
				//주문 상세 페이지 이동
				$(".detailBtn").click(function() {
					var o_num = $(this).parents("tr").attr("data-num");
					console.log(1);
					$("#o_num").val(o_num); 
					$("#orderInfoForm").attr({
						"method" : "post",
						"action" : "/order/orderDetail"
					});
					$("#orderInfoForm").submit();
				}); 
			});
		</script>
		<script type="text/javascript">
			$(function() {
				
			})
		</script>
		<title>Insert title here</title>
		<style type="text/css">
			#container {
				margin-top: 20px;
			}
		</style>
	</head>
	<body>
		<div id="formDiv">
			<form id="orderInfoForm">
				<input type="hidden" name="o_num" id="o_num" />
			</form>
		</div>
		<div class="page-breadcrumb">
            <div class="row">
                <div class="col-5 align-self-center">
                    <h4 class="page-title">주문 관리</h4>
                </div>
            </div>
        </div>
		<div id="container">
			<form id="listForm">
				<table class="table table-striped">
					<thead>
						<tr>
							<th class="text-center">주문번호<br><span id="sp">(주문상세)</span></th>
							<th class="text-center">주문일자</th>
							<th class="text-center">고객이름</th>
							<th class="text-center">결제방법</th>
							<th class="text-center">결제확인</th>
							<th class="text-center">배송상태</th>
							<th class="text-center">취소처리</th>
						</tr>
					</thead>
					<tbody id="orderList">
						<c:choose>
							<c:when test="${not empty orderList}">
								<c:forEach var="list" items="${orderList}" varStatus="status">
									<tr class="text-center" data-num="${list.o_num}">
										<td class="detailBtn" data-toggle="modal" data-target=".bs-example-modal-lg">
											<button type="button" class="detailBtn btn btn-link">${list.o_num }</button>
										</td>
										<td>${list.o_date }</td>
										<td>${list.c_name }</td>
										<td>${list.o_pay }</td>
										<c:if test="${list.o_state == 1 }">
											<td><input type="button" class="stateUpdate btn btn-outline-primary btn-sm" value="입금확인" /></td>
										</c:if>
										<c:if test="${list.o_state == 2 || list.o_state == 3 || list.o_state == 4}">   
											<td>결제완료</td>
										</c:if>
										<c:if test="${list.o_state == 2 }">
											<td><input type="button" class="stateUpdate btn btn-outline-success btn-sm" value="배송처리" /></td>
										</c:if>
										<c:if test="${list.o_state == 3 }">   
											<td>배송완료</td>
										</c:if>
										<c:if test="${list.o_state == 1 || list.o_state == 4}">   
											<td></td>
										</c:if>
										<c:if test="${list.o_state == 1 || list.o_state == 2}">
											<td><input type="button" class="stateUpdate btn btn-outline-danger btn-sm" value="주문취소" /></td>
										</c:if>
										<c:if test="${list.o_state == 4 }">
											<td>취소완료</td>
										</c:if>
										<c:if test="${list.o_state == 3 }">
											<td></td>
										</c:if>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="8" class="text-center">등록된 주문이 존재하지 않습니다.</td>
								</tr>
							</c:otherwise>
						</c:choose>
						
					</tbody>
				</table>
				<div id="topIcon" class="text-center">
					<img id="topImage" alt="탑버튼" src="/resources/images/topImage.png" style="cursor: pointer;" />
				</div>
			</form>
		</div>
	</body>
</html>