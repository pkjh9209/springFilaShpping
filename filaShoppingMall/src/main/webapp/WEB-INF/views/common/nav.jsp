<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="nav">
		<div class="sub_nav">	
			<c:if test="${user == null}">
				<a href="${path}/member/insertMember">회원가입</a>
				<a href="${path}/member/loginMember">로그인</a>
			</c:if>
			<c:if test="${user != null}">
				<span>${user.userId}님 환영합니다.</span>
				<li><a href="${path}/member/logout">로그아웃</a></li>
				<c:if test="${user.verify == 9}">
					<li><a href="${path}/admin/index">관리자 페이지로가기</a></li>
				</c:if>
			</c:if>

		</div>
		<ul>
			<li>카테고리</li>
			<li>카테고리</li>
			<li>카테고리</li>
			<li>카테고리</li>
			<li>카테고리</li>
		</ul>
</div>