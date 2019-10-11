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
</style>
</head>
<body>
	<table>
		<tr>
			<th>아이디</th>
			<th>이름</th>
			<th>비밀번호</th>
			<th>가입날짜</th>
		</tr>
		<c:forEach var="member" items="${list }">
			<tr>
				<td>${member.memberid }</td>
				<td>${member.name }</td>
				<td>${member.password }</td>
				<td>${member.regdate}</td>
			</tr>
		</c:forEach>
	</table>
	<a href="index.jsp">홈</a>
</body>
</html>