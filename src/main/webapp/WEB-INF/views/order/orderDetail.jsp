<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
			.page-breadcrumb {
				margin-bottom: 20px;
			}
			
			input[type='text'] {
				font-size: 14px;
			}
		</style>
		<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
		<script type="text/javascript" src="/resources/include/dist/js/bootstrap.min.js"></script>
		<script type="text/javascript">
			$(function(){
				//상품 목록 이동
				$("#orderListBtn").click(function() {
					location.href = "/order/orderList";
				});
			});
		</script>
	</head>
	<body>
		<div class="page-breadcrumb">
            <div class="row">
                <div class="col-5 align-self-center">
                    <h4 class="page-title">주문 상세</h4>
                </div>
            </div>
        </div>
		<div class="card card-body printableArea">
		    <h5><b>주문 내역</b></h5>
		    <hr>
	        <div class="col-md-12">
	            <div class="table-responsive m-t-40" style="clear: both;">
	                <table class="table table-hover">
	                    <thead>
	                        <tr>
	                            <th class="text-center">상품 번호</th>
	                            <th class="text-center">상품명</th>
	                            <th class="text-center">상품 색상</th>
	                            <th class="text-center">상품 수량</th>
	                            <th class="text-center">상품 단가</th>
	                            <th class="text-center">상품 총액</th>
	                        </tr>
	                    </thead>
	                    <tbody>
                    		<c:set var = "listTotal" value = "0" />
		                    <c:forEach var="list" items="${detail}" varStatus="status">
		                        <tr>
		                            <td class="count${status.count} text-center">${status.count}</td>
		                            <td class="text-center">${list.l_name}</td>
		                            <td class="text-center">
		                            	<div id="colors">${list.l_color}</div>
		                            	<div id="colorPicked"></div>
		                            </td>
		                            <td class="cnt text-center">
		                            	${list.l_cnt}
		                            </td>
		                            <td class="l_price text-center">
		                            	<fmt:parseNumber var="price" type="number" value="${list.l_price}" />
		                            	&#8361;&nbsp;${list.l_price}
		                            </td>
		                            <td class="totalPrice text-center" id="totalPrice">
		                            	&#8361;&nbsp;${price * list.l_cnt}
		                            </td>
		                        </tr>
		                        <c:set var="listTotal" value="${listTotal + (price * list.l_cnt)}" />
		                    </c:forEach>
	                    </tbody>
	                </table>
	            </div>
	        </div>
			<div class="col-md-12">
				<hr>
			    <div class="pull-right m-t-30 text-right">
			        <h3><b>Total :</b>&nbsp;&#8361;&nbsp;<c:out value="${listTotal}" /></h3>
			    </div>
			    <div class="clearfix"></div>
			</div>
	    </div>
	    <div class="card card-body printableArea">
			<h5><b>배송지 정보</b></h5>
			<label>수령인 성함 : </label>
			<input type="text" value="${detail[0].o_name }" class="col-md-4" /><br/>
			<label>수령인 전화번호 : </label>
			<input type="text" value="${detail[0].o_phone }" class="col-md-4" /><br/>
			<label>수령인 주소 : </label>
			<input type="text" value="${detail[0].o_address1 + detail[0].o_address2 + detail[0].o_address3 + detail[0].o_address4 }" class="col-md-6" />
			<div class="text-right">
				<button type="button" id="orderListBtn" class="btn btn-outline-success">목록</button>
			</div>
		</div>
		
		
	</body>
</html>