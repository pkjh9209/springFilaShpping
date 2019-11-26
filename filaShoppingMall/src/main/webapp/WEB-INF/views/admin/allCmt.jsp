<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
	<title>fila-main</title>
	<%@include file ="../common/head.jsp" %>
	<link rel="stylesheet" href="${path}/resources/css/mall/mallList.css">
</head>
<body>
	<%@include file ="../common/nav.jsp" %>
	<div class="page_navigater"></div>
	<div id="container_box">
	 <ul>
	  <c:forEach items="${allCmt}" var="allCmt">
	  <li>
	   <div class="allCmt">
	    <p>
	     <span>작성자</span>${allCmt.userId}
	    </p>
	    <p>
	     <span>작성된 상품</span> <a href="${path}/mall/mallView?pdtCode=${allCmt.pdtNum}">바로가기</a>
	    </p>
	   </div>
	   <div class="replyContent">
	    ${allCmt.cmtDes}
	   </div>
		<div class="replyControll">
		 <form role="form" method="post">
		  <input type="hidden" name="repNum" value="${allCmt.cmtPdtNum}" />
		  <button type="submit" class="delete_${allCmt.cmtPdtNum}_btn">삭제</button>
		 </form>
		</div>
	  </li>     
	  </c:forEach>
	 </ul>
	</div>
</body>
</html>
