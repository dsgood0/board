<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${result >= 0}">
		<h3>회원가입에 성공하였습니다.</h3>
	</c:if>
	<c:if test="${result < 0}">
		<h3>회원가입에 실패하였습니다.</h3>		
	</c:if>
	<a href="${pageContext.request.contextPath}">홈</a> <!-- 프로젝트 이름 가져오기 -->
</body>
</html>