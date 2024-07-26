<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login</title>
</head>
<body>
<div class="login-container">
    <p>縁結び ログイン</p>
    <form action="${pageContext.request.contextPath}/login" method="post">
        <div class="form-group">
            <label for="m_id">ID</label>
            <input type="text" id="m_id" name="m_id"/>
            <c:if test="${not empty error}">
                <p class="error">IDを入力してください</p>
            </c:if>
        </div>
        <div class="form-group">
            <label for="m_pw">パスワード</label>
            <input type="password" id="m_pw" name="m_pw"/>
            <c:if test="${not empty error}">
                <p class="error">パスワードを入力してください</p>
            </c:if>
        </div>
        <button type="submit" class="login-btn">ログイン</button>
    </form>

    <hr>
    <div class="login-options">
        <a href="#">회원가입</a>
        <a href="#">비밀번호 찾기</a>
        <a href="#">기업회원 로그인</a>
    </div>

    <hr>
    <div class="social-login">
        <img src="" alt="Kakao">
        <img src="" alt="Line">
        <img src="" alt="Naver">
        <img src="" alt="Google">
    </div>
</div>
</body>
</html>