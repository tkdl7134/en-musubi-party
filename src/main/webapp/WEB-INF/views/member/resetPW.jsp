<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>비밀번호 재설정</title>
</head>
<body>
<h1>비밀번호 재설정</h1>
<form action="/member/resetPW" method="post">
    <input type="hidden" name="token" value="${token}">
    <div>
        <label for="newPW">새 비밀번호</label>
        <input type="password" id="newPW" name="newPW" required>
    </div>
    <button type="submit">재설정</button>
</form>
<c:if test="${not empty message}">
    <p>${message}</p>
</c:if>
<c:if test="${not empty error}">
    <p>${error}</p>
</c:if>
</body>
</html>
