<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
		<div class="sub_nav">
					
			<div class="sub_nav_wp">	
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
		</div>
		<div class="main_nav">	
			<div class="nav_wrap">	
				<div class="lt_nav">
					<div class="logo_wrap">
						<img src="${path}/resources/img/FLIA_LOGO.png" alt="로고이미지"/>
					</div>
					<ul>
						<li>OUTER</li>
						<li>TOP</li>
						<li>BOTTOM</li>
						<li>ACC</li>
					</ul>
				</div>
				<div class="rt_nav">
					<ul>
						<li>BRAND</li>
						<li>NEW</li>
						<li>COMMUNITY</li>
					</ul>
				</div>
			</div>
		</div>