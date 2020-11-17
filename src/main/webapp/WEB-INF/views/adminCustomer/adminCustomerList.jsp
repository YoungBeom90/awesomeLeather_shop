<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
      
		<title>adminCustomerList.jsp</title>
      
		<link rel="shortcut icon" href="/resources/image/icon.png" />
		<link rel="apple-touch-icon" href="/resources/image/icon.png" />

		<link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap.min.css" />
		<link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap-theme.css" />
		
		<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
		<script type="text/javascript" src="/resources/include/js/common.js"></script>
		<script type="text/javascript" src="/resources/include/dist/js/bootstrap.min.js"></script>
		
		<!--[if lt IE 9]>
		<script src="/resources/include/js/html5shiv.js"></script>
		<![endif]-->
		<script type="text/javascript">
			$(function(){

				/* 탈퇴 버튼 클릭 시 */
				$(".memberDeleteBtn").click(function(){
					var goUrl="";
					
					if(confirm("탈퇴 처리 하시겠습니까?")){
						var c_num = $(this).parents("tr").attr("data-num");
						$("#c_num").val(c_num);
						//console.log($("#c_num").val());
						$.ajax({
							url : "/adminCustomer/customerDeleteCheck",			// 전송 URL
							type : "post",										// 전송 시 method 방식
							data : $("#detailForm").serialize(),				// 폼 전체 데이터 전송
							dayaType : "text",
							error : function(){									// 실행 시 오류가 발생하였을 경우
								alert('시스템 오류 입니다. 관리자에게 문의 하세요');
							},
							success : function(resultData) {					// 정상적 실행이 되었을 경우
								var goUrl="";									// 이동할 경로를 저장할 변수
								if(resultData==0){								// 일치하지 않는 경우
									goUrl="/adminCustomer/customerDelete";
								} else if(resultData>=1) {						// 일치할 경우
									goUrl="/adminCustomer/customerDeleteName";
								}									
								$("#detailForm").attr("action",goUrl);
								$("#detailForm").submit(); 
							}
						});
					}
				});
							
				
				/* 아이디 클릭 시 상세 페이지 이동을 위한 처리 이벤트 */
				$(".goDetail").click(function(){
					var c_num = $(this).parents("tr").attr("data-num");
					$("#c_num").val(c_num);
					console.log("글번호 : " + c_num);
					// 상세 페이지로 이동하기 위해 form 추가(id : detailForm)
					$("#detailForm").attr({
						"method":"get",
						"action":"/adminCustomer/adminCustomerDetail"
					});
					$("#detailForm").submit();
				});
				
				/* 검색 대상이 변경될 때마다 처리 이벤트 */
				$("#search").change(function(){
					if($("#search").val()=="all"){
						$("#keyword").val("전체 데이터 조회");
					} else if($("#search").val()!="all"){
						$("#keyword").val("");
						$("#keyword").focus();
					}
				});
				
				/* 검색 버튼 클릭 시 처리 이벤트 */
				$("#searchData").click(function(){
					if($("#search").val()!="all"){
						if(!chkData("#keyword","검색어를")) return;
					}
					goPage();
				});
				
				/* 검색을 위한 실질적 처리 함수 */
				function goPage(){
					if($("#search").val()=="all"){
						$("#keyword").val("");
					}
					$("#f_search").attr({
						"method":"get",
						"action":"/adminCustomer/adminCustomerList"
					});
					$("#f_search").submit();
				}
			});
		</script>
	</head>
	<body>
		<div class="page-breadcrumb">
			<div class="row">
				<div class="col-5 align-self-center">
					<h4 class="page-title">회원 관리</h4>
				</div>
			</div>
		</div>
		  <br>
		<form name="detailForm" id="detailForm">
			<input type="hidden" name="c_num" id="c_num" />
		</form>		
		
		<div class="container-fluid">
			<div class="row">
			    <div class="col-12">
			        <div class="card card-body">
			            <form class="form-horizontal m-t-30">
							<!-- ========== 리스트 시작 ========== -->
							<div id="adminCustomerList">
								<table summary="회원 리스트" class="table table-striped">
									<thead>
										<tr>
											<th class="text-center">회원번호</th>
											<th class="text-center">아이디</th>
											<th class="text-center">회원명</th>
											<th class="text-center">연락처</th>
											<th class="text-center">주소</th>											
											<th class="text-center" data-value="c_date">가입일</th>
											<th class="text-center">탈퇴처리</th>
										</tr>
									</thead>
									
									<tbody id="list" class="table-striped">						
										<!-- 데이터 출력 -->
										<c:choose>
											<c:when test="${not empty adminCustomerList}">
												<c:forEach var="adminCustomer" items="${adminCustomerList}" varStatus="status">
													<tr class="text-center" data-num="${adminCustomer.c_num}">
														<td class="goDetail">${adminCustomer.c_num}</td>
														<td class="goDetail text-left">${adminCustomer.c_id}</td>
														<td class="name">${adminCustomer.c_name}</td>
														<td class="text-center">${adminCustomer.c_phone}</td>
														<td class="text-center">
															(${adminCustomer.c_address1})
															${adminCustomer.c_address2}
															${adminCustomer.c_address3}
															${adminCustomer.c_address4}
														</td>
														<td class="text-center">${adminCustomer.c_date}</td>
														<td class="text-center">
															<button type="button" class="memberDeleteBtn btn btn-default btn-xs" >탈퇴</button>
														</td>
													</tr>
												</c:forEach>
											</c:when>
											<c:otherwise>
												<tr>
													<td colspan="7" class="tac text-center">회원이 존재하지 않습니다.</td>
												</tr>
											</c:otherwise>
										</c:choose>
									</tbody>
								</table>
							</div>
							<!-- ======================== 리스트 종료 ======================== -->
						</form>
					</div>			
				</div>
			</div>
		</div>
	</body>
</html>