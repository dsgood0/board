<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/common.css" type="text/css" rel="stylesheet">
<style>
	.red {
		color:red;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="js/common.js"></script>
<script>
	$(function() {
		$("form").submit(function() {
			var result = checkInputEmpty( $("input[name]") );
			if(result == false) { // 빈 input태그가 존재하면
				return false;
			}
			
		});
	});
</script>
</head>
<body>
	<form action="login.do" method="post">
		<fieldset>
			<legend>로그인</legend>
			<p>
				<label>아이디</label>
				<input type="text" name="id">
				<span class="error">아이디를 입력하세요.</span>
			</p>
			<p>
				<label>비밀번호</label>
				<input type="password" name="password">
				<span class="error">비밀번호를 입력하세요.</span>
			</p>
			<p>
				<input type="submit" value="로그인">
			</p>
		</fieldset>
	</form>
	<c:if test="${notMatch}">
		<span class="red">아이디와 비밀번호가 일치하지 않습니다. 다시 입력해주세요</span>
	</c:if>
</body>
</html>