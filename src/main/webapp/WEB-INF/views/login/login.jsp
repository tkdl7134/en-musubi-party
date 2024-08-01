<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html style="zoom:100% !important;" lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <link rel="stylesheet" href="/resources/css/login/login.css">
                                                                    <%-- FontAwesome CSS 파일 포함시키기 --%>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <script src="/resources/js/login/login.js"></script>
</head>
<body>
<div class="login-container">
    <p>縁結び</p>
    <form action="/login" method="post">
        <div class="form-group">
            <label for="m_id" class="fixed-label">縁結び ID</label>
            <input type="text" id="m_id" name="m_id" placeholder="ID入力" required>
            <i class="fas fa-times clear-button" onclick="clearInput('m_id')"></i>
            <c:if test="${not empty errorID}">
                <p class="error">${errorID}</p>
            </c:if>
        </div>
        <div class="form-group">
            <label for="m_pw" class="fixed-label">パスワード</label>
            <input type="password" id="m_pw" name="m_pw" placeholder="パスワード入力" required>
            <i class="fas fa-eye-slash password-toggle" onclick="togglePWVisibility('m_pw')"></i>
            <i class="fas fa-times clear-button" onclick="clearInput('m_pw')"></i>
            <c:if test="${not empty errorPW}">
                <p class="error">${errorPW}</p>
            </c:if>
        </div>
        <c:if test="${not empty error}">
            <p class="error">${error}</p>
        </c:if>
        <button type="submit" class="login-btn">ログイン</button>
    </form>

<%--    <hr>--%>
<%--    <div class="login-options">--%>
<%--        <a href="#">회원가입</a>--%>
<%--        <a href="#">비밀번호 찾기</a>--%>
<%--        <a href="#">기업회원 로그인</a>--%>
<%--    </div>--%>

<%--    <hr>--%>
<%--    <div class="social-login">--%>
<%--        <img src="" alt="Kakao">--%>
<%--        <img src="" alt="Line">--%>
<%--        <img src="" alt="Naver">--%>
<%--        <img src="" alt="Google">--%>
<%--    </div>--%>
</div>
</body>
</html>