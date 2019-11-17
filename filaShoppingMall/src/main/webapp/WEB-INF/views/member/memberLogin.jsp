<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FILA-로그인</title>
<%@include file ="../common/head.jsp" %>
</head>
<body>
	<section id="content">
		<form action="${path}/member/loginMemberProc" method="post">
		 <div class="input_area">
		 <p>아이디</p>
		 <input type="text" id="userId" name="userId" required="required" />      
		 </div>
		 <p>비번</p>
		 <div class="input_area">
		  <input type="password" id="userPw" name="userPw" required="required" />      
		 </div>
		 <input type="submit" value="제출">
		</form>   
	</section>
</body>
</html>