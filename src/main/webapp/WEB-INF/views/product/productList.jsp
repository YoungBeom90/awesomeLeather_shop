<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			#excelDiv {
				display: inline-block;
				margin: 20px;
			}
			.fa-file-excel {
				font-size: 20px;
			}
		</style>
		<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
		<script type="text/javascript" src="/resources/include/js/common.js"></script>
		<script type="text/javascript" src="/resources/include/dist/js/bootstrap.min.js"></script>
		<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
		<script type="text/javascript">
			$(function() {
				//탑 버튼 기능 
				$( '#topImage' ).click( function() {
				    var htmloffset = $( 'html' ).offset();
				    $( 'html, body' ).animate( { scrollTop : htmloffset.top }, 400 );
				});
				
				/*검색 대상이 변결될 때마다 처리 이벤트*/
				$("#search").change(function() {
					if($("#search").val() == "all") {
						$("#keyword").val("전체 데이터 조회");
					} else if($("#search").val() != "all") {
						$("#keyword").val("");
						$("#keyword").focus();
					}
				});
				
				/* 검색버튼 클릭 시 처리 이벤트 */
				$("#searchData").click(function() {
					if($("#search").val() != "all") {
						if(!chkData("#keyword", "검색어를")) return;
					}
					goPage();
				});
				
				// 상품 상세 정보 이동
				$(".goDetail").click(function() {
					var p_num = $(this).parents("tr").attr("data-num");
					$("#p_num").val(p_num);
					console.log("수정 선택 글번호 : " + p_num);
					$("#detailForm").attr({
						"method" : "post",
						"action" : "/product/productDetail"
					});
					$("#detailForm").submit()
				});
				
				// 상품 판매상태 중지 변경
				$(".pdState").click(function() {
					var stateURL = "";
					var cnf = "";
					var state = $(this).val();
					var ajaxData = $(this).parents("tr").attr("data-num");
					if(state == "중지") {
						stateURL = "/product/statePause";
						cnf = "이 상품판매를 중지하시겠습니까?";
					} else if(state == "판매"){
						stateURL = "/product/stateSell";
						cnf = "이 상품을 판매하시겠습니까?";
					}
					console.log(stateURL);
					if(confirm(cnf)) {
						$.ajax({
							url : stateURL,
							type : "POST",
							data : "p_num=" + ajaxData,
							dataType: "text",
							success : function(result) {
								if(result=="success") {
									if(state=="중지") {
										alert("판매중지 상품으로 변경되었습니다.");
									} else {
										alert("판매상품으로 변경되었습니다.");
									}
									location.href = "/product/productList";
								} else {
									alert("데이터베이스 오류.");
								}								
							},
							error : function() {
								alert("시스템에 오류. 관리자에게 문의하세요.");
							}
						});
					}
				});
				
				//엑셀 다운로드 클릭 시 처리 이벤트
				$("#excelDownBtn").click(function() {
					if($("#search").val()=="all") {
						$("#keyword").val("");
					}
					$("#f_search").attr({
						"method" : "get",
						"action" : "/product/productExcel"
					});
					$("#f_search").submit();
				})
				
			});
			
			/* 검색을 위한 실질적인 처리 함수 */
			function goPage() {
				if($("#search").val()=="all") {
					$("#keyword").val("");
				}
				$("#f_search").attr({
					"method" : "get",
					"action" : "/product/productList"
				});
				$("#f_search").submit();
			}
		</script>
		<style type="text/css">
			#productSearch {
				float: right;
				margin-bottom: 20px;
			}
		</style>
	</head>
	<body>
		<div class="page-breadcrumb">
            <div class="row">
                <div class="col-5 align-self-center">
                    <h4 class="page-title">상품 관리</h4>
                </div>
            </div>
        </div>
       	<form id="detailForm" name="detailForm">
			<input type="hidden" id="p_num" name="p_num" />
		</form>
		<div id="excelDiv" class="text-left">
			<button type="button" class="btn btn-outline-success btn-sm" id="excelDownBtn"><i class="far fa-file-excel"></i>&nbsp;&nbsp;&nbsp;&nbsp;다운로드</button>
		</div>
		<div id="productSearch" class="text-right">
			<form id="f_search" name="f_search" class="form-inline">
				<div class="form-group">
					<select class="form-control" id="search" name="search">
						<option value="all">전체</option>
						<option value="p_num">상품번호</option>
						<option value="p_name">상품이름</option>
						<option value="p_category">카테고리</option>
						<option value="p_price">상품가격</option>
					</select>
					<input type="text" class="form-control" value="검색어를 입력하세요" id="keyword" name="keyword">
					<input type="button" class="btn btn-outline-primary btn-sm" id="searchData" value="검색" />
				</div>
			</form>
		</div>
		<div class="container-fluid">
			<div id="boardList">
				<table summary="게시판 리스트" class="table table-hover">
					<thead>
						<tr>
							<th class="text-center">상품 번호</th>
							<th class="text-center">카테고리</th>
							<th class="text-center">상품명</th>
							<th class="text-center">가격</th>
							<th class="text-center">수정</th>
							<th class="text-center">판매 중지</th>
						</tr>
					</thead>
					<tbody id="list" class="table=striped">
						<c:choose>
							<c:when test="${not empty list}">
								<c:forEach var="item" items="${list}" varStatus="status">
									<tr class="text-center" data-num="${item.p_num}">
										<td class="goDetail text-center">${item.p_num}</td>
										<td class="text-center">${item.p_category}</td>
										<td class="text-center">${item.p_name}</td>
										<td class="text-center">${item.p_price}</td>
										<td class="goDetail text-center">
											<input type="button" class="btn btn-outline-secondary btn-sm" id="productInfoBtn" value="확인" />
										</td>
										<c:if test="${item.p_state == 1}">
											<td class="text-center">
												<input type="button" class="pdState btn btn-outline-danger btn-sm" id="pause" name="pause" value="중지" />
											</td> 
										</c:if>
										<c:if test="${item.p_state == 2}">
											<td class="text-center">
												<input type="button" class="pdState btn btn-outline-success btn-sm" id="sell" name="sell" value="판매" />
											</td> 
										</c:if>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="6" class="text-center">등록된 상품이 존재하지 않습니다.</td>
								</tr>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
				<div id="topIcon" class="text-center">
					<img id="topImage" alt="탑버튼" src="/resources/images/topImage.png" style="cursor: pointer;" />
				</div>
			</div>
    	</div>
	</body>
</html>