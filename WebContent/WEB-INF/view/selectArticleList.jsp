<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	table{
		border-collapse: collapse;
	}
	td, th {
		border:1px solid black;
		padding:5px;
	}
	#add {
		border:1px solid black;
		background:skyblue;
		color:black;
		padding:3px;
		margin-bottom:5px;
		display:inline-block;
		text-decoration: none;		
	}
</style>
</head>
<body>
	<div>
		<a href="add.do" id="add">등록</a>
		<table>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자 ID</th>
				<th>조회수</th>
			</tr>
			<c:forEach var="article" items="${list}">
				<tr>
					<td>${article.article_no }</td>
					<td><a href="read.do?no=${article.article_no }">${article.title }</a></td>
					<td>${article.writer_id }</td>
					<td>${article.read_cnt }</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>