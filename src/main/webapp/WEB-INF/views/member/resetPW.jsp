<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>비밀번호 재설정</title>
    <link rel="stylesheet" href="/resources/css/member/resetPW.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <script src="/resources/js/member/resetPW.js"></script>
</head>
<body>
<h1>비밀번호 재설정</h1>
<form action="/member/resetPW" method="post">
    <input type="hidden" name="token" value="${token}">
    <div class="form-group">
        <label for="newPW">새 비밀번호</label>
        <input type="password" id="newPW" name="newPW" required>
        <i class="fas fa-eye-slash password-toggle" onclick="togglePWVisibility('newPW')"></i>
    </div>
    <div class="form-group">
        <label for="confirmPW">새 비밀번호 확인</label>
        <input type="password" id="confirmPW" name="confirmPW" required>
        <i class="fas fa-eye-slash password-toggle" onclick="togglePWVisibility('confirmPW')"></i>
    </div>
    <button type="submit">재설정</button>
</form>
<c:if test="${not empty message}">
    <p style="color: green;">${message}</p>
</c:if>
<c:if test="${not empty error}">
    <p style="color: red;">${error}</p>
</c:if>

<a href="/login" class="login-btn">로그인</a>
</body>
</html>
