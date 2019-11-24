<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
	<title>fila-main</title>
	<%@include file ="common/head.jsp" %>
	<link rel="stylesheet" href="${path}/resources/css/main.css">
	<link rel="stylesheet" href="${path}/resources/css/swiper.min.css">
</head>
<body>
	<%@include file ="common/nav.jsp" %>
	<div class="banner_container">
		<div class="banner_content">
				<div class="swiper-container">
				  <div class="swiper-wrapper">
				 	 <!-- 추후 2,3,4 이미지 편집하여 바꾸기 -->
				    <div class="swiper-slide"><img alt="배너이미지01" src="${path}/resources/img/banner_01.png"></div>
				    <div class="swiper-slide"><img alt="배너이미지02" src="${path}/resources/img/banner_02.png"></div>
				    <div class="swiper-slide"><img alt="배너이미지03" src="${path}/resources/img/banner_03.png"></div>
				    <div class="swiper-slide"><img alt="배너이미지04" src="${path}/resources/img/banner_04.png"></div>
				  </div>
				</div>
				<div class="banner_indicator">
					<div class="indi_wp01 bn_active"><span>01</span><div class="bn_indi"></div></div>
					<div class="indi_wp02"><span>02</span><div class="bn_indi"></div></div>
					<div class="indi_wp03"><span>03</span><div class="bn_indi"></div></div>
					<div class="indi_wp04"><span>04</span><div class="bn_indi"></div></div>
				</div>
		</div>
	</div>
	<div class="section_01">
		<div class="section_wp_01">
			<div class="sec_lt">
				<img alt="배너이미지01" src="${path}/resources/img/section_content_01.png">
			</div>
			<div class="sec_rt">
				<h1 class="mt-6">FILA WINTER</h1>
				<h1 class="mt-12">GOOSE DOWN</h1>
				<p class="mt-3">김유정과 함께하는 ‘ Winter Goose Down ’</p>
				<p>스마트 쇼퍼를 위한 19FW 겨울 아우터 특별혜택 챙기기!</p>
				<button class="shop_btn01">Shopping Now</button>
			</div>
		</div>
		<div class="sec01_divider"></div>
	</div>
	<div class="section_02">	
		<div class="section_wp_02">
			<div class="sec_lt">
				<img alt="배너이미지01" src="${path}/resources/img/section_content_02.png">
			</div>
			<div class="sec_rt">
				<h1 class="mt-6">2019 F/W TOP</h1>
				<h1 class="mt-12">WINTER SALE</h1>
				<p class="mt-3">2018년도 겨울 상의 한정특가 세일</p>
				<p>FILA의 다양한 상의를 저렴하게</p>
				<button class="shop_btn02">Shopping Now</button>
			</div>
		</div>
		<div class="sec02_divider"></div>
	</div>

	<script src="${path}/resources/js/swiper.min.js"></script>
	  <!-- Initialize Swiper -->
	<script>
		var swiper = new Swiper('.swiper-container', {
			spaceBetween: 30,
			centeredSlides: true,
			autoHeight : true,
			loop : true,
 			autoplay: {
				delay: 3500,
				disableOnInteraction: false,
			}, 
			on: {
				slideChangeTransitionEnd: function(){
					/* 추후 손보기 넘어갈때 엑티브값 전부 리무브해볼것 */
					if(this.activeIndex == 2){
						$('.indi_wp01').removeClass('bn_active');
						$('.indi_wp02').addClass('bn_active');
					}else if(this.activeIndex == 3){
						$('.indi_wp02').removeClass('bn_active');
						$('.indi_wp03').addClass('bn_active');
					}else if(this.activeIndex == 4){
						$('.indi_wp03').removeClass('bn_active');
						$('.indi_wp04').addClass('bn_active');
					}else if(this.activeIndex == 5){
						$('.indi_wp04').removeClass('bn_active');
						$('.indi_wp01').addClass('bn_active');
					}
				  console.log(this.activeIndex);
				},
			},
		});
	</script>
</body>
</html>
