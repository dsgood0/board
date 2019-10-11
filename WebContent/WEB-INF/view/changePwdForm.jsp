<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.error {
		color:red;
		display:none;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script>
	$(function() {
		$("form").submit(function() {
			var pw = $("input[name='pw']").val();
			var password = $("input[name='password']").val();
			var regpw = /^[a-zA-Z0-9]{8,20}$/;
			
			$(".error").css("display", "none");
			
			if(pw == "") {
				$(".error").eq(0).css("display", "inline");
				return false;
			}
			
			if(password == "" || regpw.test(password) == false) {
				$(".error").eq(1).css("display", "inline");
				return false;
			}			
		
		});		
	});
</script>
</head>
<body>
	<form action="changepw.do" method="post">
		<p>
			<label>현재 암호 : </label><br>
			<input type="password" name="pw">
			<span class="error">현재 암호를 다시 입력해주세요.</span>
		</p>
		<p>
			<label>새 암호 : </label><br>
			<input type="password" name="password">
			<span class="error">새 암호를 다시 입력해주세요.</span>
		</p>
		<p><input type="submit" value="암호 변경"></p>
	</form>
	<c:if test="${result < 0 }">
		<span style="color:red">현재 암호가 일치하지 않습니다.</span>
	</c:if>
</body>
</html>