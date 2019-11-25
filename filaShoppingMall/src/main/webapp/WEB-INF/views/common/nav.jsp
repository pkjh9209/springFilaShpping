<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
		<div class="sub_nav">
			<div class="sub_nav_wp">
				<div class="sub_wp_lt">
					<span class="ev-tt ft-600"><a href="#">이벤트</a></span>
					<span><a href="#">첫 회원가입시 1000 포인트 지급</a></span>
				</div>
				<div class="sub_wp_rt">	
					<c:if test="${user == null}">
						<a href="${path}/mall/listCart">장바구니</a>
						<a href="${path}/member/loginMember">주문배송</a>
						<a href="${path}/member/insertMember">회원가입</a>
						<a href="${path}/member/loginMember">로그인</a>
						
					</c:if>
					<c:if test="${user != null}">
						<li><a href="${path}/member/logout">로그아웃</a></li>
						<li><a href="${path}/mall/listCart">장바구니</a></li>
						<li><a href="${path}/member/loginMember">주문배송</a></li>
						<c:if test="${user.verify == 9}">
							<li><a href="${path}/admin/index">관리자 페이지로가기</a></li>
						</c:if>
						<span>${user.userId}님 환영합니다.</span>
					</c:if>
				</div>
			</div>
		</div>
		<div class="main_nav">	
			<div class="nav_wrap">	
				<div class="lt_nav">
					<div class="logo_wrap">
						<img src="${path}/resources/img/FLIA_LOGO.png" alt="로고이미지"/>
					</div>
					<ul>
						<li><a href="${path}/mall/mallList?ref=1">OUTER</a></li>
						<li><a href="${path}/mall/mallList?ref=2">TOP</a></li>
						<li><a href="${path}/mall/mallList?ref=3">BOTTOM</a></li>
						<li><a href="${path}/mall/mallList?ref=4">ACC</a></li>
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