<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
      
		<title>Insert title here</title>
      	
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
	</head>
	<body>
		<div>
			<h4>회원 관리</h4>
		</div>
	
		<div class="contentContainer container">						
			<div class="contentTB text-center">
				<table class="table table-bordered">
					<colgroup>
						<col width="10%" />
						<col width="10%" />
						<col width="10%" />
						<col width="10%" />
						<col width="10%" />
						<col width="10%" />
					</colgroup>
					<tbody id="detail" class="table-striped">
						<tr>
							<td>회원 번호</td>
							<td class="text-left" colspan="5">${adminCustomerDetail.c_num}</td>
						</tr>
						<tr>	
							<td>회원 이름</td>
							<td class="text-left" colspan="5">${adminCustomerDetail.c_name}</td>
						</tr>
						<tr>
							<td>회원 ID</td>
							<td class="text-left" colspan="5">${adminCustomerDetail.c_id}</td>
						</tr>
						<tr>
							<td>회원 주소</td>
							<td class="text-left" colspan="5">
								(${adminCustomerDetail.c_address1})
								${adminCustomerDetail.c_address2}
								${adminCustomerDetail.c_address3}
								${adminCustomerDetail.c_address4}
							</td>
						</tr>
						<tr>
							<td>회원 연락처</td>
							<td class="text-left" colspan="5">${adminCustomerDetail.c_phone}</td>
						</tr>
						<tr>
							<td>회원 가입일</td>
							<td class="text-left" colspan="5">${adminCustomerDetail.c_date}</td>
						</tr>
						<tr>
							<td>총 구매액</td>
							<td class="text-left" colspan="5">원</td>
						</tr>
						<tr>
							<td rowspan="2">구매 상품</td>
							<td>주문 번호</td>
							<td>상품 번호</td>
							<td>구매 날짜</td>
							<td>상품명</td>
							<td>구매 금액</td>
						</tr>
						
						<!-- 데이터 출력 -->
							<c:choose>
								<c:when test="${not empty list}">
									<c:forEach var="vo" items="${list}" varStatus="status">									
										<tr class="text-center" data-num="${vo.o_num}">
										<td class="text-left">${vo.o_num}</td>
											<td class="text-left">${vo.p_num}</td>
											<td class="text-left">${vo.o_date}</td>
											<td class="text-left">${vo.p_name}</td>
											<td class="text-left">${vo.l_price}</td>											
										</tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr>
										<td colspan="5" class="tac text-center">구매내역이 존재하지 않습니다.</td>
									</tr>
								</c:otherwise>
							</c:choose>						
					</tbody>
				</table>
			</div>
			<!-- ========== 상세 정보 보여주기 종료 ========== -->
			
		</div>
	</body>
</html>