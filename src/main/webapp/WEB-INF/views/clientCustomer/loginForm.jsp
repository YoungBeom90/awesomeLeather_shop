<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
	<html>
 		<head>
			<meta charset="UTF-8">
			<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
			<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		<!-- 모바일 웹 페이지 설정 -->
		<link rel="shortcut icon" href="/resources/images/icon.png" />
		<link rel="apple-touch-icon" href="/resources/images/icon.png" />
		<!-- 모바일 웹 페이지 설정 끝 -->
		
		<!--[if lt IE 9]>
		<script src="/resources/js/html5shiv.js"></script>
		<![endif]--><title>Insert title here</title>
		<link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap.min.css" />
		<link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap-theme.min.css" />
		 <!-- // PLUGINS (css files) // -->

    <link href="/resources/include/dist/js/plugins/bootsnav_files/skins/color.css" rel="stylesheet">

    <link href="/resources/include/dist/js/plugins/bootsnav_files/css/animate.css" rel="stylesheet">

    <link href="/resources/include/dist/js/plugins/bootsnav_files/css/bootsnav.css" rel="stylesheet">

    <link href="/resources/include/dist/js/plugins/bootsnav_files/css/overwrite.css" rel="stylesheet">

    <link href="/resources/include/dist/js/plugins/owl-carousel/owl.carousel.css" rel="stylesheet">

    <link href="/resources/include/dist/js/plugins/owl-carousel/owl.theme.css" rel="stylesheet">

    <link href="/resources/include/dist/js/plugins/owl-carousel/owl.transitions.css" rel="stylesheet">

    <link href="/resources/include/dist/js/plugins/Magnific-Popup-master/Magnific-Popup-master/dist/magnific-popup.css" rel="stylesheet">

    <!--// ICONS //-->

    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.css" rel="stylesheet">

    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

    <!--// BOOTSTRAP & Main //-->

   

    <link href="/resources/include/dist/css/main.css" rel="stylesheet">

<link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
	<style type="text/css">
		
html,body{
    position: relative;
    height: 100%;
}

.login-container{
    position: relative;
    width: 300px;
    margin: 80px auto;
    padding: 20px 40px 40px;
    text-align: center;
    background: #fff;
    border: 1px solid #ccc;
}

#output{
    position: absolute;
    width: 300px;
    top: -75px;
    left: 0;
    color: #fff;
}

#output.alert-success{
    background: rgb(25, 204, 25);
}

#output.alert-danger{
    background: rgb(228, 105, 105);
}


.login-container::before,.login-container::after{
    content: "";
    position: absolute;
    width: 100%;height: 100%;
    top: 3.5px;left: 0;
    background: #fff;
    z-index: -1;
    -webkit-transform: rotateZ(4deg);
    -moz-transform: rotateZ(4deg);
    -ms-transform: rotateZ(4deg);
    border: 1px solid #ccc;

}

.login-container::after{
    top: 5px;
    z-index: -2;
    -webkit-transform: rotateZ(-2deg);
     -moz-transform: rotateZ(-2deg);
      -ms-transform: rotateZ(-2deg);

}

.avatar{
    width: 100px;height: 100px;
    margin: 10px auto 30px;
    border-radius: 100%;
    border: 2px solid #aaa;
    background-size: cover;
}

.form-box input{
    width: 100%;
    padding: 10px;
    text-align: center;
    height:40px;
    border: 1px solid #ccc;;
    background: #fafafa;
    transition:0.2s ease-in-out;

}

.form-box input:focus{
    outline: 0;
    background: #eee;
}

.form-box input[type="text"]{
    border-radius: 5px 5px 0 0;
    text-transform: lowercase;
}

.form-box input[type="password"]{
    border-radius: 0 0 5px 5px;
    border-top: 0;
}

.form-box button.login{
    margin-top:15px;
    padding: 10px 20px;
}

.animated {
  -webkit-animation-duration: 1s;
  animation-duration: 1s;
  -webkit-animation-fill-mode: both;
  animation-fill-mode: both;
}

@-webkit-keyframes fadeInUp {
  0% {
    opacity: 0;
    -webkit-transform: translateY(20px);
    transform: translateY(20px);
  }

  100% {
    opacity: 1;
    -webkit-transform: translateY(0);
    transform: translateY(0);
  }
}

@keyframes fadeInUp {
  0% {
    opacity: 0;
    -webkit-transform: translateY(20px);
    -ms-transform: translateY(20px);
    transform: translateY(20px);
  }

  100% {
    opacity: 1;
    -webkit-transform: translateY(0);
    -ms-transform: translateY(0);
    transform: translateY(0);
  }
}

.fadeInUp {
  -webkit-animation-name: fadeInUp;
  animation-name: fadeInUp;
}

img{
	height: auto;
	width: auto;
	max-height: 100px;
	max-width: 218px;
}
		
	
	</style>
	
		<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
		<script type="text/javascript" src="/resources/include/js/common.js"></script>
		<script type="text/javascript" src="/resources/include/dist/js/bootstrap.min.js"></script>
		<script type="text/javascript">
		$(function(){
			var textfield = $("input[name='c_id']");
			            $('button[type="button"]').click(function(e) {
			                e.preventDefault();
			                //little validation just to check username
			                if (textfield.val() != "") {
			                    //$("body").scrollTo("#output");
			                   $("#output").addClass("alert alert-success animated fadeInUp").html("Welcome back " + "<span style='text-transform:uppercase'>" + textfield.val() + "</span>");
			                    $("#output").removeClass(' alert-danger');
			                    $("input").css({
			                    "height":"0",
			                    "padding":"0",
			                    "margin":"0",
			                    "opacity":"0"
			                    });
			                    //change button text 
			                    $('button[type="button"]').html("continue")
			                    .removeClass("btn-info")
			                    .addClass("btn-default").click(function(){
			                    $("input").css({
			                    "height":"auto",
			                    "padding":"10px",
			                    "opacity":"1"
			                    }).val("");
			                    });
			                    
			                  
			                } else {
			                    remove success mesage replaced with error message
			                   $ ("#output").removeClass(' alert alert-success');
			                    $("#output").addClass("alert alert-danger animated fadeInUp").html("sorry enter a username ");
			                }
			                //console.log(textfield.val());

			            });
			});

		</script>
		
		<script type="text/javascript">
			$(function() {
				$("#customerLoginBtn").click(function(){
					if(!chkData("#c_id","아이디를")) return;
					if(!chkData("#c_pw","비밀번호를")) return;
				
					else{
						$.ajax({
							url:"/customer/loginCheck",
							type:"post",
							data:$("#loginForm").serialize(),
							dataType:"text",
							error : function(){
								alert("시스템 오류입니다. 관리자에게 문의하세요");
							},
							success : function(resultData){
								if(resultData==0){
									alert("아이디나 비밀번호가 일치하지 않습니다. 다시 확인해 주세요");
									$("#c_pw").val("");
								}
								else if(resultData==1){
									 $("#loginForm").attr("action","/customer/login");
									 $("#loginForm").submit();

									
								}
							}
						
						});
					}
					
					
				});
			});
		
		</script>
		
		</head>
		<body>
		
		<div class="container">
	<div class="login-container">
			<img alt="로고" src="/resources/images/awesomeleatherLogo.png"> 
            <div id="output"></div><br /><br />
           <!--  <div class="avatar"></div> -->
            <div class="form-box">
                <form id="loginForm">
                    <input type="text" class="form-control" id="c_id" name="c_id" placeholder="아이디"  required="required">
                    <input type="password" id="c_pw" name="c_pw" placeholder="비밀번호" class="form-control"  required="required">
                    
                    <button class="btn btn-info btn-block login" type="button" id="customerLoginBtn">Login</button>
                </form>
            </div>
        </div>
        
</div>
		
		
	<!-- 로그인 화면 -->
			      <!-- Sign Up
                <div class="col-md-5 col-md-offset-1 ">

                    <form class="signup-form" id="loginForm">

                        <h2 class="text-center">로그인</h2>

                        <hr>

                        <div class="form-group">

                            <input type="text" class="form-control" id="c_id" name="c_id" placeholder="아이디"  required="required">

                        </div>

                        <div class="form-group">

                            <input type="password" id="c_pw" name="c_pw" placeholder="비밀번호" class="form-control"  required="required">

                        </div>

                       

                        <div class="form-group text-center">
                       		 <input type="button" value="로그인" id="customerLoginBtn" class="btn btn-blue btn-block" />
	
                           

                        </div>

                    </form>

                </div>
			 -->
			
			
			
			<!-- <div>
				<form id="loginForm">
					<input type="text" id="c_id" name="c_id" placeholder="아이디" /><br />
					
					<input type="password" id="c_pw" name="c_pw" placeholder="비밀번호" /><br />
					<input type="button" value="로그인" id="customerLoginBtn" /><br />
				</form>
			</div> -->
		</body>
	</html>