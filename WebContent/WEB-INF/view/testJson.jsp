<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script>
	$(function() {
		$("#btn1").click(function() {
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
		
		$("#btn2").click(function() {
			$.ajax({
				url:"${pageContext.request.contextPath}/article/listJson.do",
				type:"get",
				// data:,
				dataType:"json",
				success:function(res) {
					console.log(res);
					// 번호, 제목, 날짜
					$(res).each(function (i, obj) {
						var no = obj.article_no;
						var title = obj.title;
						var d = new Date(obj.regdate);
						var sD = d.getFullYear() + "/" + (d.getMonth()+1) + "/" + d.getDate();
						
						var $li = $("<li>").append(no + ", ").append(title + ", ").append(sD);
						$("#list").append($li);		
					});
				}
			});
		});
		
		$("#btn3").click(function() {
			$.ajax({
				url:"${pageContext.request.contextPath}/memberJson.do",
				type:"get",
				data:{"id":$("#id").val()},
				dataType:"json",
				success:function(res) {
					console.log(res);
					
					if(res.result == "success") {
						$("#result3").text("");
						$("#result3").append("아이디 : " + res.member.memberid + ", ");
						$("#result3").append("이름 : " + res.member.name + ", ");
						$("#result3").append("비밀번호 : " + res.member.password + ", ");
						
						var d = new Date(res.member.regdate);
						$("#result3").append("가입날짜 : " + d.getFullYear() + "/" + (d.getMonth()+1) + "/" + d.getDate());	
					} else {
						$("#result3").text("찾는 값이 없습니다.");	
					}		
				}			
			});
		});
	});
</script>
</head>
<body>
	<h1>게시글 상세 보기 데이터 가져오기</h1>
	<input type="text" id="no">
	<button id="btn1">가져오기</button>
	<div id="result">결과데이터</div>
	
	<hr>
	
	<button id="btn2">리스트 가져오기</button>
	<ul id="list"></ul>
	
	<hr>
	
	<input type="text" id="id">
	<button id="btn3">map data 가져오기</button>
	<div id="result3"></div>
</body>
</html>