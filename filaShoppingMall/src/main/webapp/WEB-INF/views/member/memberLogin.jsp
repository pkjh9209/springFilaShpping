<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FILA-로그인</title>
<%@include file ="../common/head.jsp" %>
<link rel="stylesheet" href="${path}/resources/css/member/memberLogin.css">
</head>
<body>
	<div class="section" id="content">
		<div class="logo_wp">
			<a href="${path}/"><img alt="로고이미지" src="${path}/resources/img/fila-9-logo.png"></a>
		</div>
		<form action="${path}/member/loginMemberProc" autocomplete="off" method="post">
			<div class="input_area">
				<p>아이디</p>
				<input type="text" id="userId" name="userId"/>
			</div>
			<div class="input_area">
				<p>패스워드</p>
				<input type="password" id="userPw" name="userPw" required="required" />      
			</div>
			<div class="checks etrans">
			  <input type="checkbox" name="idSave" id="ex_chk3"> 
			  <label for="ex_chk3">아이디를 저장합니다</label> 
			</div>
			<input class="insert_btn" type="submit" value="로그인하기"/>
		</form>   
	</div>
</body>
</html>