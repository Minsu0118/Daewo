<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>메인페이지</title>
<style>
html, body {
	margin: 0;
	padding: 0;
	height: 100%;
	font-family: 'Arial';
}

.wrapper {
	display: flex;
	flex-direction: column;
	min-height: 100vh;
}

header, footer {
	background-color: #222;
	color: white;
	padding: 10px 20px;
}

nav {
	background-color: #f9f9f9;
	padding: 10px 20px;
}

nav a {
	margin-right: 20px;
	text-decoration: none;
	color: #333;
	font-weight: bold;
}

.auth-buttons {
	float: right;
}
.auth-buttons button {
	margin-left: 10px;
	padding: 6px 8px;
	font-size: 13px;
	border-radius: 6px;
	border: none;
	cursor: pointer;
}
.auth-buttons button:first-child {
	background-color: #000;
	color: white;
	border: 1px solid #ccc;
}
.auth-buttons button:last-child {
	background-color: #fff;
	color: black;
	border: 1px solid #ccc;
}
.auth-buttons button:first-child:hover {
	background-color: #333;
}
.auth-buttons button:last-child:hover {
	background-color: #f5f5f5;
}

.container {
	display: flex;
	flex: 1;
	padding: 30px;
	background-color: #fff;
}

.sidebar {
	flex: 0;
}
.sidebar h2 {
	font-size: 20px;
	margin-bottom: 10px;
	color: #222;
}
.sidebar a {
	display: block;
	border: 1px solid #ccc;
	padding: 8px;
	width: 150px;
	text-decoration: none;
	color: #333;
	border-radius: 4px;
	margin-bottom: 10px;
}
.sidebar a:hover {
	background-color: #eee;
}

.main-content {
	flex: 3;
	padding-left: 40px;
}

footer {
	text-align: center;
	padding: 20px;
	background-color: #222;
	color: white;
}
</style>
</head>
<body>
	<div class="wrapper">
		<header>
			<span style="font-weight: bold;">로고</span>
			<div class="auth-buttons">
				<c:choose>
					<c:when test="${not empty username}">
						<span>${username}님</span>
						<form action="${pageContext.request.contextPath}/logout" method="post" style="display: inline;">
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
							<button type="submit">로그아웃</button>
						</form>
					</c:when>
					<c:otherwise>
						<button onclick="location.href='/login'">로그인</button>
						<button onclick="location.href='/register'">회원가입</button>
					</c:otherwise>
				</c:choose>
			</div>
		</header>

		<nav>
			<a href="/">메인페이지</a>
			<a href="#">갤러리</a>
			<a href="/users">외부데이터</a>
			<a href="#">게시판</a>
		</nav>

		<div class="container">
			<div class="sidebar">
				<h2>사이드바</h2>
				<a href="#">사이드바_링크1</a>
				<a href="#">사이드바_링크2</a>
				<a href="#">사이드바_링크3</a>
			</div>

			<div class="main-content">
				<h2>메인 콘텐츠</h2>
				<p>여기에 메인 콘텐츠가 들어갑니다.</p>
			</div>
		</div>

		<footer> 2025 회사명 All rights reserved </footer>
	</div>
</body>
</html>
