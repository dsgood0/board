<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/common.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/common.js"></script>
<script>
	$(function() {
		$("#f1").submit(function() {
			var result = checkInputEmpty($("input[name], textarea"));
			
			if(result == false){
				return false; // 서버 전송 막음
			}
		});
	})
</script>
</head>
<body>
	<form id="f1" action="add.do" method="post">
		<fieldset>
			<legend>게시글 작성</legend>
			<p>
				<label>제목</label>
				<input type="text" name="title">
				<span class="error">제목을 입력하세요.</span>
			</p>
			<p>
				<label>내용</label>
				<textarea rows="10" cols="60" name="content"></textarea>
				<span class="error">내용을 입력하세요.</span>
			</p>
			<p>
				<input type="submit" value="등록">
			</p>
		</fieldset>
	</form>
</body>
</html>