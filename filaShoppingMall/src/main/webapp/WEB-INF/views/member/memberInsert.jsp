<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FILA-회원가입</title>
<%@include file ="../common/head.jsp" %>
	<link rel="stylesheet" href="${path}/resources/css/member/memberInsert.css">
	<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#idCheck").click( function() {
			var query = {userId : $("#userId").val()};
				$.ajax({
					  url : "idCheck",
					  type : "post",
					  data : query,
					  success : function(data) {
						  if(data == 1) {
							  $(".result .msg").text("이미 존재하는 아이디입니다.");
							  $(".result .msg").attr("style", "color:#f00");    
						  } else {
							  $(".result .msg").text("사용 가능한 아이디입니다.");
							  $(".result .msg").attr("style", "color:#00f");
						  }
						  
					  },
					  error : function(e){
						  alert("관리자에게 문의해주세요.")
					  }
				});
			});
		});
	</script>
</head>
<body>
	<div class="section" id="content">
		<div class="logo_wp">
			<a href="${path}/"><img alt="로고이미지" src="${path}/resources/img/fila-9-logo.png"></a>
		</div>
		<form action="${path}/member/insertMemberProc" autocomplete="off" method="post" onsubmit="return numAdd()">
			<div class="input_area id_wp">
				<p>아이디</p>
				<input type="text" id="userId" name="userId"/>
				<button class="idCheck" id="idCheck" type="button">아이디중복확인</button> 
				<div class="result"><span class="msg"></span></div> 
			</div>
			<div class="input_area">
				<p>패스워드</p>
				<input type="password" id="userPw" name="userPw" required="required" />      
			</div>
			<div class="input_area">
				<p>이름</p>
				<input type="text" id="userName" name="userName" required="required" />      
			</div>
			<div class="input_area">
				<p>생년 월일</p>
				<input type="hidden" id="userBirth01" name="userBirth"/>
				<div class="div_03 m-rt">
					<input type="text" id="userBirth02" name="userBirth02" placeholder="년(4자)" maxlength="4" required="required"/>
				</div>
				<div class="div_03 m-rt">
					<select id="userBirth03" name="userBirth03">
						<c:forEach var="i" begin="1" end="12" step="1">
							<option value="${i}">${i}월<option>
						</c:forEach>
					</select>
				</div>
				<div class="div_03">
					<input type="text" id="userBirth04" name="userBirth04" placeholder="일" maxlength="2" required="required"/>
				</div>
			</div>
			<div class="input_area">
				<p>이메일</p>
				<input type="text" id="userEmail" name="userEamil"/>      
			</div>
			<div class="input_area">	 	
				<p>휴대전화</p>
				<input type="hidden" id="userTel01" name="userTel"/>
				<div class="div_03 m-rt">
					<input id="userTel02" type="text" name="userTel02" maxlength="3" required="required"/>
				</div>
				<div class="div_03 m-rt">
					<input id="userTel03" type="text" name="userTel03" maxlength="4" required="required"/>
				</div>
				<div class="div_03">
					<input id="userTel04" type="text" name="userTel04" maxlength="4" required="required"/>
				</div>
			</div>
		<script type="text/javascript">
			function numAdd() {
				$("#userBirth01").val($("#userBirth02").val() + $("#userBirth03").val() + $("#userBirth04").val());
				$("#userTel01").val($("#userTel02").val() + $("#userTel03").val() + $("#userTel04").val());
			}
		</script>
		<input class="insert_btn" type="submit" value="회원가입"/>
		
		</form>   
	</div>
</body>
</html>