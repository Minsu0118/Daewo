<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>로그인</title>
<style>
body {
	margin: 0;
	padding: 0;
	font-family: sans-serif;
}

.container {
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
	background-color: #f8f8f8;
}

.login-box {
	background: #fff;
	border: 1px solid #ddd;
	padding: 30px;
	/* border-radius 제거 */
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.login-row {
	display: flex;
	align-items: stretch;
	gap: 10px;
}

.input-group {
	display: flex;
	flex-direction: column;
	gap: 10px;
}

.input-group input {
	width: 200px;
	padding: 12px;
	border: none;
	background-color: #eee;
	/* border-radius 제거 */
	font-size: 14px;
}

.login-button {
	width: 80px;
	background-color: #f0a500;
	color: white;
	font-weight: bold;
	border: none;
	/* border-radius 제거 */
	font-size: 14px;
	cursor: pointer;
}

.login-button:hover {
	background-color: #e69500;
}

.login-box p {
	font-size: 14px;
	color: red;
	margin-top: 10px;
}
</style>
</head>
<body>
	<div class="container">
		<section class="login-box">
			<form action="${pageContext.request.contextPath}/login" method="post">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				<div class="login-row">
					<div class="input-group">
						<input type="text" name="username" placeholder="아이디" required />
						<input type="password" name="password" placeholder="비밀번호" required />
					</div>
					<button type="submit" class="login-button">로그인</button>
				</div>

				<c:if test="${param.error == 'true'}">
					<p>아이디 또는 비밀번호 오류</p>
				</c:if>
				<c:if test="${param.logout == 'true'}">
					<p style="color: green;">로그아웃 되었습니다.</p>
				</c:if>
			</form>
		</section>
	</div>
</body>
</html>
