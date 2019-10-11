<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/common.css" type="text/css" rel="stylesheet"> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="js/common.js"></script>
<script>
	$(function() {
		$("form").submit(function() {
			$(".error").css("display", "none");
			
			var result = checkInputEmpty( $("input[name]") );
			if(result == false) { // 빈 input태그가 존재하면
				return false;
			}
			
			// 아이디 (영어, 숫자 6~15)
			var regid = /^[a-zA-Z]{1}[a-zA-Z0-9]{5,14}$/i;
			var memberid = $("input[name='memberid']").val();
			
			if(regid.test(memberid) == false) {
				$(".error:eq(0)").css("display", "inline");			
				return false;
			}
			
			var regname = /^[가-힣]{2,5}$/;
			var name = $("input[name='name']").val();
			
			if(regname.test(name) == false) {
				$(".error:eq(1)").css("display", "inline");			
				return false;
			}
			
			var regpw = /^[a-zA-Z0-9]{8,20}$/;
			var password = $("input[type='password']").val();
			
			if(regpw.test(password) == false) {
				$(".error:eq(2)").css("display", "inline");			
				return false;
			}
			
			var pwcheck = $("input[name='confirmPassword']").val();
			
			if(pwcheck == "") {
				$(".error:eq(3)").css("display", "inline");
				$(".error:eq(4)").css("display", "none");
				return false;
			} else if(password != pwcheck) {
				$(".error:eq(4)").css("display", "inline");
				$(".error:eq(3)").css("display", "none");
				return false;
			}
		});
		
	});
</script>
</head>
<body>
	<form action="join.do" method="post">
		<fieldset>
			<legend>회원 가입</legend>
			<p>
				<label>아이디</label>
				<input type="text" name="memberid">
				<span class="error">ID(영어, 숫자 6~15)를 입력하세요.</span>
			</p>
			<p>
				<label>이름</label>
				<input type="text" name="name">
				<span class="error">이름(한글 2~5자)을 입력하세요.</span>
			</p>
			<p>
				<label>비밀번호</label>
				<input type="password" name="password">
				<span class="error">비밀번호(영어, 숫자 8~20자)를 입력하세요.</span>
			</p>
			
			<p>
				<label>비밀번호 확인</label>
				<input type="password" name="confirmPassword">
				<span class="error">비밀번호를 입력하세요.</span>
				<span class="error">비밀번호가 일치하지 않습니다.</span>
			</p>
			<p>
				<input type="submit" value="가입">
			</p>
		</fieldset>
	</form>
</body>
</html>