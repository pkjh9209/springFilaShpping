<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FILA-회원가입</title>
<%@include file ="../common/head.jsp" %>
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
	<section id="content">
		<form action="${path}/member/insertMemberProc" method="post">
		 <div class="input_area">
		 <p>아이디</p>
		 <input class="form-control" type="text" id="userId" name="userId"/>
		 <button class="idCheck" id="idCheck" type="button">아이디중복확인</button>   
		 </div>
		 <div class="result"><span class="msg"></span></div>
		 <p>비번</p>
		 <div class="input_area">
		  <input type="password" id="userPw" name="userPw" required="required" />      
		 </div>
		 <p>이름</p>
		 <div class="input_area">
		  <input type="text" id="userName" name="userName" placeholder="닉네임을 입력해주세요" required="required" />      
		 </div>
		 <p>연락처</p>
		 <div class="input_area">
		  <input type="text" id="userTel" name="userTel" placeholder="연락처를 입력해주세요" required="required" />      
		 </div>
		 
		 <input type="submit" value="제출">
		 
		</form>   
	</section>
</body>
</html>