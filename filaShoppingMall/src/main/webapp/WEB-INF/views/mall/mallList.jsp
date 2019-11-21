<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
	<title>fila-main</title>
	<%@include file ="../common/head.jsp" %>
	<link rel="stylesheet" href="${path}/resources/css/main.css">
</head>
<body>
	<%@include file ="../common/nav.jsp" %>
	<div class="section">
		<ul>
			<li>
				<div>
					<img alt="" src="${list.pdtThumbNail}">
				</div>
				<div>
					<a href="${path}/mallView?pdtNum=${list.pdtNum}"></a><img alt="" src="${list.pdtThumbNail}">
				</div>
			</li>
		</ul>
	</div>
</body>
</html>
