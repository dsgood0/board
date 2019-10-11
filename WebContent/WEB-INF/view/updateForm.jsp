<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	table{
		border-collapse: collapse;
	}
	td {
		border: 1px solid black;
		padding:5px;
	}
	td a {
		text-decoration: none;
		color:black;
		border:1px solid black;
		background:skyblue;
		padding:3px;
		margin:5px;
	}
</style>
</head>
<body>
	<form action="update.do" method="post">
		<table>
			<tr>
				<td>번호</td>
				<td>${article.article_no}<input type="hidden" name="no" value="${article.article_no}"></td>
			</tr>
			<tr>
				<td>작성자 ID</td>
				<td>${article.writer_id}</td>
			</tr>
			<tr>
			<td>제목</td>
				<td><input type="text" name="title" value="${article.title}"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea rows="10" cols="60" name="content">${article.content}</textarea></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="수정"><a href="list.do">목록보기</a></td>
			</tr>		
		</table>
	</form>
</body>
</html>