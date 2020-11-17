<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
	
		<!-- Google Font -->
    	<link href="https://fonts.googleapis.com/css?family=Amatic+SC:400,700&display=swap" rel="stylesheet">
    	<link href="https://fonts.googleapis.com/css?family=Montserrat:100,200,300,400,500,600,700,800,900&display=swap"
        rel="stylesheet">
	
		<!-- Css Styles -->
	    <link rel="stylesheet" href="/resources/include/dist/css/bootstrap.min.css" type="text/css">
	    <link rel="stylesheet" href="/resources/include/dist/css/font-awesome.min.css" type="text/css">
	    <link rel="stylesheet" href="/resources/include/dist/css/nice-select.css" type="text/css">
	    <link rel="stylesheet" href="/resources/include/dist/css/owl.carousel.min.css" type="text/css">
	    <link rel="stylesheet" href="/resources/include/dist/css/magnific-popup.css" type="text/css">
	    <link rel="stylesheet" href="/resources/include/dist/css/slicknav.min.css" type="text/css">
	    <link rel="stylesheet" href="/resources/include/dist/css/style.css" type="text/css">
	
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
	                    document.getElementById("c_address4").value = extraAddr;
	                
	                } else {
	                    document.getElementById("c_address4").value = '';
	                }
	
	                // �����ȣ�� �ּ� ������ �ش� �ʵ忡 �ִ´�.
	                document.getElementById('c_address1').value = data.zonecode;
	                document.getElementById("c_address2").value = addr;
	                // Ŀ���� ���ּ� �ʵ�� �̵��Ѵ�.
	                document.getElementById("c_address3").focus();
	            }
	        }).open();
	    }
		</script>
		
		<script type="text/javascript">
		var regex = /^.*(?=^.{8,16}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;

			$(function(){
				
				if(${cvo.c_echeck}==1){
					
					$("#c_echeck").prop("checked", true);
				}
				
				$("#customerUpdateBtn").click(function(){
		
					
					if(!chkData("#c_phone","��ȭ��ȣ��")) return;
					if(!chkData("#c_address3","�ּҸ�")) return;
					if($("#c_check").is(":checked")){
						$("#c_check").val(1);
					}else{
						$("#c_check").val(0);
					}
					
					if($("#c_pw").val()!=null){
						if(!regex.test($("#c_pw").val())){
							alert("��й�ȣ�� ����,����,Ư������ ������ 8~16���ڿ��� �մϴ�.");
							return;
						} 
					}	
					$("#updateForm").attr({
						"method":"post",
						"action":"/customer/customerUpdate"
					});
					$("#updateForm").submit();						
			});									
					$("#c_phone").focus(function(){
						if($("#c_pw").val()!=null){
							var passwd = $("#c_pw").val();
							var passwdChk = $("#c_pwcheck").val();
							if(passwd != passwdChk){
								$("#c_pwcheck").val("");
								$("#msg").html("��й�ȣ�� ��ġ���� �ʽ��ϴ�. �ٽ� �Է����ּ���").css("color","blue");
							}else{
								$("#msg").html("");
							}
							
						}						
						
					});	
					
					$("#customerCancleBtn").click(function(){
						location.href="/";
					});
					
					$("#customerDeleteBtn").click(function(){
						
					});					
				
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
                                <span class="hide-menu">�ֹ�Ȯ��</span>
                            </a>
                        </li>
                         <li class="sidebar-item">
                            <a class="sidebar-link waves-effect waves-dark sidebar-link" href="/basket/basketList" aria-expanded="false">
                                <i class="mdi mdi-arrange-bring-forward"></i>
                                <span class="hide-menu">��ٱ���</span>
                            </a>
                        </li>
                        <li class="sidebar-item">
                            <a class="sidebar-link waves-effect waves-dark sidebar-link" href="/customer/updateForm" aria-expanded="false">
                                <i class="mdi mdi-border-none"></i>
                                <span class="hide-menu">ȸ����������</span>
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
	
	
	<!-- ȸ������ ����ȭ�� -->
			
					<div class="contact-section">
				<div class="container">
					<div class="row">
						<div class="col-lg-8">
                    <form  id="updateForm" class="contact-form">
                        <div class="row">
                            <div class="col-lg-12">
                                <input type="text" id="c_id" name="c_id" readonly="readonly" value="${cvo.c_id }">                       
                           
                           
                                  
                           
                                <input type="password" id="c_pw" name="c_pw" placeholder="��й�ȣ (����, ����, Ư������ ���� 8~16��)">                          
                           
                                <input type="password" id="c_pwcheck"  placeholder="��й�ȣȮ�� (����, ����, Ư������ ���� 8~16��)" >
                                <span id="msg"></span>
                                
                           		<input type="text" id="c_name" name="c_name" readonly="readonly" value="${cvo.c_name }" />
								<input type="text" id="c_phone" name="c_phone" placeholder="��ȭ��ȣ"  value="${cvo.c_phone}"/>
							</div>
							<div class="col-lg-6">	
								<input type="text" id="c_address1" placeholder="�����ȣ" value="${cvo.c_address1 }">
							</div>	
							<div class="col-lg-6">
								<input type="button" onclick="sample6_execDaumPostcode()" value="�����ȣ ã��">
							</div>
							<div class="col-lg-12">	
								<input type="text" id="c_address2" placeholder="�ּ�" value="${cvo.c_address2 }"  >
								<input type="text" id="c_address3" placeholder="���ּ�" value="${cvo.c_address3 }" >
								<input type="text" id="c_address4" placeholder="�����׸�" value="${cvo.c_address4 }"  >
								
							</div>
							<div class="checkbox col-lg-12">
    							<label>�̸��� ���ſ���<input type="checkbox" id="c_echeck" name="c_echeck" ></label>
    						</div>
    						<div class="col-lg-12 text-right">
                                <input type="button" value="ȸ����������" id="customerUpdateBtn" />
								<input type="button" value="ȸ�������������" id="customerCancleBtn" />
								<input type="button" value="ȸ��Ż��" id="customerDeleteBtn" />
                            </div>
                        </div>
                    </form>
                </div>
               </div>
              </div>  
             </div> 
					
				
		
	</body>
</html>