<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script>
	$(function() {
		$("button").click(function() {
			$.ajax({
				url:"${pageContext.request.contextPath}/article/readJson.do",
				type:"get",
				data:{"no":$("#no").val()},
				dataType:"json",
				success:function(res) {
					console.log(res);
					// 게시물 번호, 제목, 내용, 생성 날짜
					$("#result").append(res.article_no + "<br>");
					$("#result").append(res.title + "<br>");
					$("#result").append(res.content + "<br>");
					var date = new Date(res.regdate);
					$("#result").append(date.getFullYear()+"-"+(date.getMonth()+1)+"-"+date.getDate() + "<br>");					
				}					
			})
		});
	});
</script>
</head>
<body>
	<h1>게시글 상세 보기 데이터 가져오기</h1>
	<input type="text" id="no">
	<button>가져오기</button>
	<div id="result">결과데이터</div>
</body>
</html>