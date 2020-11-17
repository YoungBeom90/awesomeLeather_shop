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
				<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // �˾����� �˻���� �׸��� Ŭ�������� ������ �ڵ带 �ۼ��ϴ� �κ�.

                // �� �ּ��� ���� ��Ģ�� ���� �ּҸ� �����Ѵ�.
                // �������� ������ ���� ���� ��쿣 ����('')���� �����Ƿ�, �̸� �����Ͽ� �б� �Ѵ�.
                var addr = ''; // �ּ� ����
                var extraAddr = ''; // �����׸� ����

                //����ڰ� ������ �ּ� Ÿ�Կ� ���� �ش� �ּ� ���� �����´�.
                if (data.userSelectedType === 'R') { // ����ڰ� ���θ� �ּҸ� �������� ���
                    addr = data.roadAddress;
                } else { // ����ڰ� ���� �ּҸ� �������� ���(J)
                    addr = data.jibunAddress;
                }

                // ����ڰ� ������ �ּҰ� ���θ� Ÿ���϶� �����׸��� �����Ѵ�.
                if(data.userSelectedType === 'R'){
                    // ���������� ���� ��� �߰��Ѵ�. (�������� ����)
                    // �������� ��� ������ ���ڰ� "��/��/��"�� ������.
                    if(data.bname !== '' && /[��|��|��]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // �ǹ����� �ְ�, ���������� ��� �߰��Ѵ�.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // ǥ���� �����׸��� ���� ���, ��ȣ���� �߰��� ���� ���ڿ��� �����.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // ���յ� �����׸��� �ش� �ʵ忡 �ִ´�.
                    document.getElementById("o_address4").value = extraAddr;
                
                } else {
                    document.getElementById("o_address4").value = '';
                }

                // �����ȣ�� �ּ� ������ �ش� �ʵ忡 �ִ´�.
                document.getElementById('o_address1').value = data.zonecode;
                document.getElementById("o_address2").value = addr;
                // Ŀ���� ���ּ� �ʵ�� �̵��Ѵ�.
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
					if(!chkData("#c_name","������ �̸���")) return;
					if(!chkData("#c_phone","������ ��ȭ��ȣ��")) return;
					if(!chkData("#o_address3","�ּҸ�")) return;
					if($("#o_pay").val()==null){
						alert("���������� ������ �ּ���");
						return;
					}
					$("#basketForm").attr({
						"method":"post",
						"action":"/ordertable/orderInsert"
					});
					$("#basketForm").submit(); 
					
					
					alert("�ֹ��� �Ϸ�Ǿ����ϴ�.");
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
					<h2>�ֹ� ����</h2>
				</div>
				 <table class="table">
                    <thead>
                        <tr>
                           
                            <th>��ǰ����</th>                            
                            <th>�ݾ�</th>
                            <th>����</th>
                           
                            
                        </tr>
                    </thead>
                    <tbody id ="list">
                    
                    <!-- ������ ��� -->
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
										<td class=" product-col" >${vo.b_price }��</td>
										<td class=" product-col">
											
											<input type="number" class="numBox" min="1" max="5" value="${vo.b_cnt }" readonly="readonly"/>
											
										</td>
														
									</tr>
									<c:set var="sum" value="${sum + (vo.b_price * vo.b_cnt )}" />
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="4"  class="tac text-center">��ٱ��ϰ� ��� �ֽ��ϴ�.</td>
								</tr>	
							</c:otherwise>
						</c:choose>
						
					</tbody>
                </table>
				<div>
					<label>�ֹ���</label>
					<input type="text" id="c_name" readonly="readonly" value="${cvo.c_name }">
					<input type="text" id="c_phone" readonly="readonly" value="${cvo.c_phone }">
				</div>
				<div>
					<label>������</label>
					<input type="text" id="o_name" value="${cvo.c_name }">
					<input type="text" id="o_phone" value="${cvo.c_phone }">
				</div>
				<div>
					<label>����� ����</label>
					<input type="button" id="addressBtn" value="�⺻ �����">
					
				</div>
				<div>					
					<input type="text" id="o_address1" placeholder="�����ȣ"  >
					<input type="button" onclick="sample6_execDaumPostcode()" value="�����ȣ ã��">
					<input type="text" id="o_address2" placeholder="�ּ�"   >
								<input type="text" id="o_address3" placeholder="���ּ�" >
								<input type="text" id="o_address4" placeholder="�����׸�" >
								
					
					
										
				</div>
				 <%--<div>
					<label>�ֹ���ǰ����</label><br />
						<table>
							<tr>
								<td>��ǰ����/����</td>
								<td>��ǰ�ݾ�</td>
								<td>��ۺ�</td>
							</tr>
							<tr>
								<td><input type="text" id="p_name" value="${bvo.p_name }" readonly="readonly"></td>
							
								<td><input type="text" id="b_price" value="${bvo.b_price}" readonly="readonly"></td>
								<td><input type="text" value="2,500��" readonly="readonly"></td>						
								
								
						</table>
				</div>	
				--%>	 
				<div>
					<label>���� ���� ����</label><br />
					<label>������ü</label><input type="checkbox" id="o_pay1"/><br />
					<label>ī�����</label><input type="checkbox" id="o_pay2" /><br />
					<input type="hidden" id="o_pay" name="o_pay">
					
				</div>
				<div>
					<label>�� ���� �ݾ�</label><fmt:formatNumber pattern="###,###,###" value="${sum}" />��(��ۺ� :2,500�� ����)
					<input type="button" id="goBasketBtn" value="��ǰ�����ϱ�" />
					<input type="button" id="orderBtn" value="�ֹ��ϱ�" />
				</div>
						
					
				
			</form>
		</div>
	</body>
</html>