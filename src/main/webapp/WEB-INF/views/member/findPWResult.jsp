<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>PW 찾기 결과</title>
</head>
<body>
<h1>PW 찾기 결과</h1>
<c:if test="${not empty message}">
    <p>${message}</p>
</c:if>
<c:if test="${not empty error}">
    <p>${error}</p>
</c:if>
<a href="/login">로그인 페이지로 돌아가기</a>
</body>
</html>
