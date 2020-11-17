<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
	                    document.getElementById("c_address4").value = extraAddr;
	                
	                } else {
	                    document.getElementById("c_address4").value = '';
	                }
	
	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('c_address1').value = data.zonecode;
	                document.getElementById("c_address2").value = addr;
	                // 커서를 상세주소 필드로 이동한다.
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
		
					
					if(!chkData("#c_phone","전화번호를")) return;
					if(!chkData("#c_address3","주소를")) return;
					if($("#c_check").is(":checked")){
						$("#c_check").val(1);
					}else{
						$("#c_check").val(0);
					}
					
					if($("#c_pw").val()!=null){
						if(!regex.test($("#c_pw").val())){
							alert("비밀번호는 영어,숫자,특수문자 조합의 8~16글자여야 합니다.");
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
								$("#msg").html("비밀번호가 일치하지 않습니다. 다시 입력해주세요").css("color","blue");
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
                                <span class="hide-menu">주문확인</span>
                            </a>
                        </li>
                         <li class="sidebar-item">
                            <a class="sidebar-link waves-effect waves-dark sidebar-link" href="/basket/basketList" aria-expanded="false">
                                <i class="mdi mdi-arrange-bring-forward"></i>
                                <span class="hide-menu">장바구니</span>
                            </a>
                        </li>
                        <li class="sidebar-item">
                            <a class="sidebar-link waves-effect waves-dark sidebar-link" href="/customer/updateForm" aria-expanded="false">
                                <i class="mdi mdi-border-none"></i>
                                <span class="hide-menu">회원정보수정</span>
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
	
	
	<!-- 회원정보 수정화면 -->
			
					<div class="contact-section">
				<div class="container">
					<div class="row">
						<div class="col-lg-8">
                    <form  id="updateForm" class="contact-form">
                        <div class="row">
                            <div class="col-lg-12">
                                <input type="text" id="c_id" name="c_id" readonly="readonly" value="${cvo.c_id }">                       
                           
                           
                                  
                           
                                <input type="password" id="c_pw" name="c_pw" placeholder="비밀번호 (영어, 숫자, 특수문자 포함 8~16자)">                          
                           
                                <input type="password" id="c_pwcheck"  placeholder="비밀번호확인 (영어, 숫자, 특수문자 포함 8~16자)" >
                                <span id="msg"></span>
                                
                           		<input type="text" id="c_name" name="c_name" readonly="readonly" value="${cvo.c_name }" />
								<input type="text" id="c_phone" name="c_phone" placeholder="전화번호"  value="${cvo.c_phone}"/>
							</div>
							<div class="col-lg-6">	
								<input type="text" id="c_address1" placeholder="우편번호" value="${cvo.c_address1 }">
							</div>	
							<div class="col-lg-6">
								<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
							</div>
							<div class="col-lg-12">	
								<input type="text" id="c_address2" placeholder="주소" value="${cvo.c_address2 }"  >
								<input type="text" id="c_address3" placeholder="상세주소" value="${cvo.c_address3 }" >
								<input type="text" id="c_address4" placeholder="참고항목" value="${cvo.c_address4 }"  >
								
							</div>
							<div class="checkbox col-lg-12">
    							<label>이메일 수신여부<input type="checkbox" id="c_echeck" name="c_echeck" ></label>
    						</div>
    						<div class="col-lg-12 text-right">
                                <input type="button" value="회원정보수정" id="customerUpdateBtn" />
								<input type="button" value="회원정보수정취소" id="customerCancleBtn" />
								<input type="button" value="회원탈퇴" id="customerDeleteBtn" />
                            </div>
                        </div>
                    </form>
                </div>
               </div>
              </div>  
             </div> 
					
				
		
	</body>
</html>