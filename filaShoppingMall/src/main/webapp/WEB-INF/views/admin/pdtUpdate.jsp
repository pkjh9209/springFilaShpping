<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FILA-로그인</title>
<%@include file ="../common/head.jsp" %>
<!-- ck에디터 -->
<script src="${path}/resources/ckeditor/ckeditor.js"></script>
<script type="text/javascript">
	//레벨1 함수
	$(document).ready(function(){
		var jsonData = JSON.parse('${category}');
		var cateLv01 = new Array();
		var cateOj01 = new Object();
		var cate1Select = $("#category01");
		console.log(jsonData);
		
		for(i = 0; i < jsonData.length; i++){
			if(jsonData[i].level == "1") {
			  cateOj01 = new Object();
			  cateOj01.cateCode = jsonData[i].cateCode;
			  cateOj01.cateName = jsonData[i].cateName;
			  cateLv01.push(cateOj01);
			}
		}
		for(var i = 0; i < cateLv01.length; i++) {
			cate1Select.append("<option value='" + cateLv01[i].cateCode + "'>" + cateLv01[i].cateName + "</option>");
		}
	});
</script>
<script type="text/javascript">
	//레벨2 함수
	$(document).on("change","#category01",function(){
				var jsonData = JSON.parse('${category}');
				var cateLv02 = new Array();
				var cateOj02 = new Object();
				var cate2Select = $("#category02");
				var selectVal = $(this).val();  
	
		for(i = 0; i < jsonData.length; i++){
			if(jsonData[i].level == "2") {
				cateOj02 = new Object();
				cateOj02.cateCode = jsonData[i].cateCode;
				cateOj02.cateName = jsonData[i].cateName;
				cateOj02.cateCodeRef = jsonData[i].cateCodeRef;
				cateLv02.push(cateOj02);
			}
		}
		cate2Select.children().remove();
		$("option:selected", this).each(function(){
			cate2Select.append("<option value=''>전체</option>");
			for(var i = 0; i < cateLv02.length; i++) {
				if(selectVal == cateLv02[i].cateCodeRef) {
					 cate2Select.append("<option value='" + cateLv02[i].cateCode + "'>"
				   + cateLv02[i].cateName + "</option>");
				}
			}
		});
	});
</script>
<script type="text/javascript">
	//카테고리 대분류 값 저장
	$(document).ready(function(){
	    $("#category01").on("change", function(){
	        var setionVal = $(this).find("option[value='" + $(this).val() + "']").text();
	        $("#pdtSection").val(setionVal);
	    });
	});
</script>
</head>
<body>
	<%@include file ="adminNav.jsp" %>
	<div class="pd-rt-120 col-sm-9 float-right">
		<div>
			<p class="mt-t10">FLIA ADMIN PAGE</p>
			<h1 class="ad_page_in">관리자 페이지 - 상품수정</h1>
		</div>
		<hr>
		<form action="${path}/admin/pdtUpdateProc" method="post" enctype="multipart/form-data">
			<div class="wh-50 mb-9 float-left pd-lr-20">
				<label class="input_tt">1차분류 (이전 대분류 : ${viewPd.pdtSection})</label>
				<input id="pdtSection" type="hidden" name="pdtSection" value="">
				<select id="category01" class="catecory01 form-control" value="">
					<option value="">전체</option>
				</select>
			</div>
			<div class="wh-50 mb-9 float-right pd-lr-20">
				<label class="input_tt">2차분류(이전 소분류 : ${viewPd.cateName})</label>
				<select id="category02" class="category02 form-control" name="cateCode" value="">
					<option value="">전체</option>
				</select>
			</div>
			<input type="hidden" name="pdtNum" value="${viewPd.pdtNum}"/>
			<div class="pd-lr-20">
				<p>상품명</p>
				<input type="text" class="form-control" name="pdtName" value="${viewPd.pdtName}"/>
			</div>
			<div class="pd-lr-20">
				<p class="input_tt">상품 수량</p>
				<input type="text" class="form-control" name="pdtVolume" value="${viewPd.pdtVolume}"/>
			</div>
			<div class="pd-lr-20">
				<p class="input_tt">상품 가격</p>
				<input type="text" class="form-control" name="pdtPrice" value="${viewPd.pdtPrice}"/>
			</div>
			<div class="pd-lr-20">
				<p class="input_tt">상품 소개</p>
				<textarea id="pdtDes" class="form-control" name="pdtDes">${viewPd.pdtDes}</textarea>
				<script>
				 var ckeditor_config = 
					{
						resize_enaleb : false,
						enterMode : CKEDITOR.ENTER_BR,
						shiftEnterMode : CKEDITOR.ENTER_P,
						filebrowserUploadUrl : "/shop/admin/ckUpload"
					};

					CKEDITOR.replace("pdtDes", ckeditor_config);
				</script>
			</div>
			<div class="pd-lr-20">
				<input id="pdt_img" type="file" name="file"/>
				<p class="input_tt">이미지</p>
				<img class="pre_view_img" src="${path}${viewPd.pdtImg}"/>
				<input type="hidden" name="pdtImg" value="${viewPd.pdtImg}"/>
				<input type="hidden" name="pdtThumbNail" value="${viewPd.pdtThumbNail}"/>				
				<script>
					$("#pdt_img").change(
						function() {
							if (this.files && this.files[0]) {
								var reader = new FileReader;
								reader.onload = function(data) {
									$(".pre_view_img").attr("src",data.target.result).width(500);
								}
								reader.readAsDataURL(this.files[0]);
							}
					});
				</script>
				<%=request.getRealPath("/") %>
			</div>
			<input type="submit" value="수정하기">
			<button id="up_back_btn" type="button" onclick="history.go(-1)">취소</button>
		</form>
	</div>
	<div class="footer_ad">
	
	</div>
</body>
</html>