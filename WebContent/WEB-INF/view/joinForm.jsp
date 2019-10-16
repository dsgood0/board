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
		var membercheckedid = $("input[name='memberid']").val();
		
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
				$(".error:eq(0)").text("ID(영어, 숫자 6~15)를 입력하세요.");
				return false;
			}
			
			if(membercheckedid != memberid) {
				$(".error:eq(0)").css("display", "inline");
				$(".error:eq(0)").text("아이디를 중복확인하세요.");
				return false;
			}
			
			var avail = $(".error:eq(0)").text();
			
			if(avail != "사용가능한 아이디입니다.") {
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
		
		$("#idcheck").click(function() {
			$.ajax({
				url:"${pageContext.request.contextPath}/joincheck.do",
				type:"get",
				data:{"id":$("#id").val()},
				dataType:"json",
				success:function(res){
					console.log(res);
					
					if(res.result == "exist") {
						$(".error:eq(0)").text("존재하는 아이디입니다.");
						$(".error:eq(0)").css("display", "inline");						
					} else if(res.result == "available") {
						$(".error:eq(0)").text("사용가능한 아이디입니다.");
						$(".error:eq(0)").css("display", "inline");												
						membercheckedid = $("input[name='memberid']").val();
					}
				}
			});
		});
	});
</script>
</head>
<body>
	<p>git test를 위한 내용을 추가</p>
	<form action="join.do" method="post">
		<fieldset>
			<legend>회원 가입</legend>
			<p>
				<label>아이디</label>
				<input type="text" name="memberid" id="id">
				<button id="idcheck" type="button">중복확인</button><br>
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