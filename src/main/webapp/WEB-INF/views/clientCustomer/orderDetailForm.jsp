<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
      
		<!-- ����� �� ������ ���� -->
		<link rel="shortcut icon" href="/resources/images/icon.png" />
		<link rel="apple-touch-icon" href="/resources/images/icon.png" />
		<!-- ����� �� ������ ���� �� -->
		
		<!--[if lt IE 9]>
		<script src="/resources/include/js/html5shiv.js"></script>
		<![endif]--><title>Insert title here</title>
		<link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap.min.css" />
		<link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap-theme.min.css" />
	
	
		<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
		<script type="text/javascript" src="/resources/include/js/common.js"></script>
		<script type="text/javascript" src="/resources/include/dist/js/bootstrap.min.js"></script>
		<script type="text/javascript">
			$(function(){
				$("#orderListBtn").click(function(){
					location.href="/ordertable/ordertableList";
				});
				
			});
		</script>
	</head>
	<body>
		<table class="table table-striped">
					<thead>
						<tr>
							<th class="text-center">�ֹ���ȣ</th>
							<th class="text-center">�ֹ�����</th>
							
							<th class="text-center">��ǰ����</th>
							<th class="text-center">����</th>
							<th class="text-center">���űݾ�</th>
							<th class="text-center">�ֹ�ó������</th>
							
							
						</tr>	
					</thead>
					<tbody id ="list" class="table-striped">
						
									<tr class="text-center" data-num=${ovo.o_num }>
										<td class="text-center">${ovo.o_num }</td>
										<td class="text-center">${ovo.o_date }</td>
										
										<td class="text-center">${ovo.l_name } / ${ovo.l_color }/${ovo.l_size }</td>
										<td class="text-center">${ovo.l_cnt }</td>
										<td class="text-center">${ovo.l_price }</td>
										<td class="text-center" id="l_state">
											<c:if test="${ovo.o_state==0 }">�Ա�Ȯ��</c:if>
											<c:if test="${ovo.o_state==1 }">����غ���</c:if>
											<c:if test="${ovo.o_state==2 }">�����</c:if>											
											<c:if test="${ovo.o_state==3 }">��ۿϷ�</c:if>
											
										</td>
										
									</tr>	
								
			</table>	
			<h2>����� ����</h2>	
			<div><label>�ֹ���</label>${ovo.o_name } </div>
			<div><label>��ȭ��ȣ</label>${ovo.o_phone } </div>
			<div><label>����� �ּ�</label>${ovo.o_address1 } ${ovo.o_address2 } ${ovo.o_address3 } ${ovo.o_address4 }</div>
			<input type="button" id="orderListBtn" value="���">
	</body>
</html>