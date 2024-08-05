<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html style="zoom:100% !important;" lang="en">
<head>
    <meta charset="UTF-8">
    <title>Register</title>
    <link rel="stylesheet" href="/resources/css/register/register.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <script src="/resources/js/register/register.js"></script>
</head>
<body>
<div class="register-container">
    <p>회원가입</p>
    <form action="/register" method="post">
        <div class="form-group">
            <label for="m_id" class="fixed-label">아이디</label>
            <input type="text" id="m_id" name="m_id" placeholder="아이디 입력" required>
            <i class="fas fa-times clear-button" onclick="clearInput('m_id')"></i>
            <c:if test="${not empty errorID}">
                <p class="error">${errorID}</p>
            </c:if>
        </div>
        <div class="form-group">
            <label for="m_pw" class="fixed-label">비밀번호</label>
            <input type="password" id="m_pw" name="m_pw" placeholder="비밀번호 입력" required>
            <i class="fas fa-eye-slash password-toggle" onclick="togglePWVisibility('m_pw')"></i>
            <i class="fas fa-times clear-button" onclick="clearInput('m_pw')"></i>
            <c:if test="${not empty errorPW}">
                <p class="error">${errorPW}</p>
            </c:if>
        </div>
        <div class="form-group">
            <label for="confirm_pw" class="fixed-label">비밀번호 확인</label>
            <input type="password" id="confirm_pw" name="confirm_pw" placeholder="비밀번호 확인 입력" required>
            <i class="fas fa-eye-slash password-toggle" onclick="togglePWVisibility('confirm_pw')"></i>
            <i class="fas fa-times clear-button" onclick="clearInput('confirm_pw')"></i>
            <c:if test="${not empty errorConfirmPW}">
                <p class="error">${errorConfirmPW}</p>
            </c:if>
        </div>
        <div class="form-group">
            <label for="email" class="fixed-label">이메일</label>
            <input type="email" id="email" name="email" placeholder="이메일 입력" required>
            <i class="fas fa-times clear-button" onclick="clearInput('email')"></i>
            <c:if test="${not empty errorEmail}">
                <p class="error">${errorEmail}</p>
            </c:if>
        </div>
        <c:if test="${not empty error}">
            <p class="error">${error}</p>
        </c:if>
        <button type="submit" class="register-btn">회원가입</button>
    </form>

    <div class="register-options">
        <a href="/login/login">로그인</a>
    </div>
</div>
</body>
</html>
