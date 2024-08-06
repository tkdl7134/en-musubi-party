<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>ID 검색 결과</title>
</head>
<body>
<h1>ID 검색 결과</h1>
<c:if test="${not empty memberID}">
    <p>찾은 ID: ${memberID}</p>
</c:if>
<c:if test="${not empty error}">
    <p>${error}</p>
</c:if>
<a href="/login">로그인 페이지로 돌아가기</a>
</body>
</html>
