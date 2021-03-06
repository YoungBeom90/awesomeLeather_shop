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
		<link href="/resources/include/dist/css/colorPicker/bootstrap-colorpicker.css" rel="stylesheet" type="text/css">
		<link href="/resources/include/dist/css/colorPicker/bootstrap-colorpicker.min.css" rel="stylesheet" type="text/css">
		<title>Awesome Leather Admin page</title>
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
		</style>
		<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
		<script type="text/javascript" src="/resources/include/dist/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="/resources/include/dist/js/colorPicker/bootstrap-colorpicker.js"></script>
		<script type="text/javascript" src="/resources/include/dist/js/colorPicker/bootstrap-colorpicker.min.js"></script>
		<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
		<script type="text/javascript">
			$(function() {
				//널 체크
				$("#updateBtn").click(function() {
					if($("#p_color").val().replace(/\s/g, "")=="") {
						$("#p_color").val("");
						$("#bgColor").focus();
						return;
					}
					if(!chkForm($("#p_name"), "상품명을")) return;
					if(!chkForm($("#p_price"), "상품가격을")) return;
					if(!chkForm($("#p_size"), "상품사이즈를")) return;
					if(!chkForm($("#p_category"), "상품카테고리를")) return;
					if(!chkForm($("#p_ex_top"), "상품상단 설명을")) return;
					if(!chkForm($("#p_ex_bottom"), "상품상단 설명을")) return;
					if(!chkForm($("#p_ex_top"), "상품상단 설명을")) return;
					if(!chkForm($("#image"), "대표이미지를")) {
						alert("대표 이미지를 넣어주세요.");
						return;
					}
					if(!chkForm($("#images"), "대표이미지를")) {
						alert("상세 이미지를 넣어주세요.");
						return;
					}
					else {
						$("#productForm").attr({
							"method" : "post",
							"enctype" : "multipart/form-data",
							"action" : "/product/productInsert"
						});
						$("#productForm").submit();
					}
				});
				
				//탑 버튼 기능 
				$( '#topImage' ).click( function() {
				    var htmloffset = $( 'html' ).offset();
				    $( 'html, body' ).animate( { scrollTop : htmloffset.top }, 400 );
				});
				
				// 컬러피커 제어 기능
				console.log("ready1")
				$('.colorPicker').colorpicker({
					format: "hex",
					change: function(e) {
						console.log(e)
					}
				});
				
				// 컬러 정보 확인
				$(".colorPicker").on("change", function(e) {
					console.log(e)
				});
				
				// 컬러피커에 포커스 사라지는 순간 선택된 컬러 리스트화 작업 기능 구현
				$('.colorPicker').focusout(function() {
					  addColor($(".colorPicker").val());
					  $(this).val("");
				});
				
				// 기존 색상 화면 출력
				var colorList = '${detail.p_color}';
				var colorDetail = colorList.split(',');
				colorDetail.pop();
				
				for(i=0; i<colorDetail.length; i++) {
					var color_div = $("<div>");
					color_div.attr("class", "colorDiv");
					color_div.css({
						"border":"1px solid #d8dce3",
						"width" : "116px",
						"height" : "26px",
						"display": "flex",
						"align-items": "center",
						"margin-bottom": "3px"
					});
					var color_box = $("<div>");
					color_box.css({
						"border" : "1px solid black",
						"width" : "20px",
						"height" : "20px",
						"background-color" : colorDetail[i],
						"display" : "inline-block",
						"flex": "none",
						"margin-left" : "3px",
						"margin-right" : "3px"
					});
					var color_span = $("<span>");
					color_span.addClass("colors");
					color_span.css({
						"flex" : "1",
					});
					
					color_span.html(colorDetail[i]);
					
					var color_delete = $("<button>");
					color_delete.attr({
						"type" : "button",
						"id" : "c_deleteBtn"
					});
					color_delete.addClass("c_delete");
					color_delete.css({
						"border" : "1px solid transparent",
						//"vertical-align" : "top",
						//"float" : "right",
						"flex": "none",
						"color": "#666",
						"font-weight": "500",
						"cursor" : "pointer"
					});
					color_delete.html("x");
					
					color_div.append(color_box).append(color_span).append(color_delete);
					
					$("#colorPicked").append(color_div);

				}
				
				// 선택된 컬러 삭제 버튼 제어
				$("button[id='c_deleteBtn']").click(function() {
					console.log(1);
					$(this).parents("div.colorDiv").remove();
				});
				
				// 기존 저장 상품 상태값 가져오기
				var detailRadio = ${detail.p_state};
				if(detailRadio == 1) {
					$("#customRadio1").attr("checked", true);
				} else {
					$("#customRadio2").attr("checked", true);
				}
			});
			
			var totalColor = ""; // 선택한 컬러들 담을 변수.
			// 선택된 컬러들의 제어
			function addColor(colorVal) {
				if(colorVal != "") {
					var color_div = $("<div>");
					color_div.attr("class", "colorDiv");
					color_div.css({
						"border":"1px solid #d8dce3",
						"width" : "116px",
						"height" : "26px",
						"display": "flex",
						"align-items": "center",
						"margin-bottom": "3px"
					});
					var color_box = $("<div>");
					color_box.css({
						"border" : "1px solid black",
						"width" : "20px",
						"height" : "20px",
						"background-color" : colorVal,
						"display" : "inline-block",
						"flex": "none",
						"margin-left" : "3px",
						"margin-right" : "3px"
					});
					var color_span = $("<span>");
					color_span.addClass("colors");
					color_span.css({
						"flex" : "1",
					});
					
					color_span.html(colorVal);
					
					var color_delete = $("<button>");
					color_delete.attr({
						"type" : "button",
						"id" : "c_deleteBtn"
					});
					color_delete.addClass("c_delete");
					color_delete.css({
						"border" : "1px solid transparent",
						//"vertical-align" : "top",
						//"float" : "right",
						"flex": "none",
						"color": "#666",
						"font-weight": "500",
						"cursor" : "pointer"
					});
					color_delete.html("x");
					
					color_div.append(color_box).append(color_span).append(color_delete);
					
					$("#colorPicked").append(color_div);
					
					// 선택 된 컬러들 전역 변수에 담기(데이터 전송시 필요)
					totalColor += colorVal + ",";
					
				}
				console.log(totalColor);
				
				// 선택된 컬러 삭제 버튼 제어
				$("button[id='c_deleteBtn']").click(function() {
					console.log(1);
					$(this).parents("div.colorDiv").remove();
				});
			}
			
			//sub 이미지파일 경로 추출하기
			function addImage() {
				console.log($("#m_imageFile").val(), $("#s_imageFile")[0].files);
				var subFiles = $("#s_imageFile")[0].files;
				var mainValue = $("#m_imageFile").val().split("\\");
				var mainFile = mainValue[mainValue.length-1];
				if(subFiles && subFiles.length > 0) {
					/* alert(fileName); */
					var s_files = "";
					for(i=0; i<subFiles.length; i++) {
						s_files += subFiles[i].name + "\n";
					} 
					$("#s_image").val(s_files);
				} 
				if(mainFile != "") {
					$("#m_image").val(mainFile); 
				}
				
			}
		</script>
	</head>
	<body>
		<div class="page-breadcrumb">
            <div class="row">
                <div class="col-5 align-self-center">
                    <h4 class="page-title">상품 수정</h4>
                </div>
            </div>
        </div>
        <br>
		<div class="container-fluid">
			<div class="row">
			    <div class="col-12">
			        <div class="card card-body">
			            <form id="productForm" class="form-horizontal m-t-30">
			                <div class="form-group">
			                    <label>상품명</label>
			                    <input type="text" id="p_name" name="p_name" class="form-control" value="${detail.p_name }" />
			                </div>
			                <div class="form-group">
			                    <label>상품 가격</label>
			                    <input type="text" id="p_price" name="p_price" class="form-control" value="${detail.p_price }" />
			                </div>
			                <div class="form-group">
			                    <label>색상 선택</label>
			                    <input type="text" class="form-control colorPicker" name="bgColor" style="margin-bottom: 4px;">
			                    <input type="hidden" name="p_color" id="p_color" />
			                    <div id="colorPicked" ></div>
			                </div>
			                <div class="form-group">
			                    <label>사이즈</label>
			                    <input type="text" id="p_size" name="p_size" class="form-control" value="${detail.p_size }" />
			                </div>
			                <div class="form-group">
			                    <label>카테고리</label>
			                    <input type="text" id="p_category" name="p_category" class="form-control" value="${detail.p_category }">
			                </div>
			                <div class="form-group col-sm-4">
			                	<label>판매 상태</label>
		                        <div class="custom-control custom-radio">
		                            <input type="radio" id="customRadio1" name="customRadio" class="custom-control-input" value="1">
		                            <label class="custom-control-label" for="customRadio1">판매</label>
		                        </div>
		                        <div class="custom-control custom-radio">
		                            <input type="radio" id="customRadio2" name="customRadio" class="custom-control-input" value="2">
		                            <label class="custom-control-label" for="customRadio2">중지</label>
		                        </div>
		                    </div>
			                <div class="form-group">
			                	<!-- 글씨작성시 툴 지원 API 제작 예정. -->
			                    <label>상단 상품 설명</label> 
			                    <textarea class="form-control" id="p_ex" name="p_ex" rows="5">${detail.p_ex_top}</textarea>
			                </div>
			                <div class="form-group">
			                	<!-- 글씨작성시 툴 지원 API 제작 예정. -->
			                    <label>하단 상품 설명</label> 
			                    <textarea class="form-control" id="p_ex" name="p_ex" rows="5">${detail.p_ex_bottom}</textarea>
			                </div>
			                <div class="form-group">
			                    <fieldset disabled>
			                        <label for="disabledTextInput">기존 대표 이미지</label>
			                        <ol>
			                        	<c:if test="${not empty images}"><li>${images[0]}</li></c:if>
			                        </ol>
			                        
			                    </fieldset>
			                </div>
			                <div class="form-group">
			                    <input type="file" class="form-control" id="m_imageFile" name="m_imageFile" onChange="addImage()" accept="image/*" />
			                </div>
			                <div class="form-group">
			                    <fieldset disabled>
			                        <label for="disabledTextInput">기존 상세 이미지</label>
			                        <!-- <input type="text" id="s_image" name="s_image" class="form-control" > -->
			                        <ol>
			                        	<c:forEach begin="1" end="999" var="list" items="${images}">
			                        		<li><c:out value="${list}" /></li>
			                        	</c:forEach>
			                        </ol>
			                        
			                    </fieldset>
			                </div>
			                <div class="form-group">
			                    <input type="file" class="form-control" id="s_imageFile" name="s_imageFile" onChange="addImage()" accept="image/*" multiple />
			                </div>
			                <div id="topIcon" class="text-center">
    							<img id="topImage" alt="탑버튼" src="/resources/images/topImage.png" style="cursor: pointer;" />
    						</div>
			                <div id="buttonDiv" class="text-right">
			                	<input type="button" id="updateBtn" class="btn btn-info btn-sm" value="수정완료" />
			                </div>
			            </form>
			        </div>
			    </div>
			</div>
    	</div>
	</body>
</html>