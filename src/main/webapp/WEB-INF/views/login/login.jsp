<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html style="zoom:100% !important;" lang="en">
<head>
    <meta charset="UTF-8">
    <title> ✿ ~ 縁結び ~ ✿ </title>
    <link rel="stylesheet" href="/resources/css/login/login.css">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Serif+JP:wght@400;700&display=swap" rel="stylesheet">
    <%-- FontAwesome CSS --%>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <script src="/resources/js/login/login.js"></script>
</head>
<body>
<div class="login-container">

    <div class="login-deco-img">
        <img src="/resources/img/logo-img.png" alt="login-deco-img">
    </div>

    <div class="login-box">

        <form action="/login" method="post">

            <div class="form-group">
                <label for="m_id" class="fixed-label">縁結び ID</label>
                <input type="text" id="m_id" name="m_id" placeholder="ID 入力" required>
                <i class="fas fa-times clear-button" onclick="clearInput('m_id')"></i>
                <c:if test="${not empty errorID}">
                    <p class="error">${errorID}</p>
                </c:if>
            </div>

            <div class="form-group">
                <label for="m_pw" class="fixed-label">パスワード</label>
                <input type="password" id="m_pw" name="m_pw" placeholder="パスワード 入力" required>
                <i class="fas fa-eye-slash password-toggle" onclick="togglePWVisibility('m_pw')"></i>
                <i class="fas fa-times clear-button" onclick="clearInput('m_pw')"></i>
                <c:if test="${not empty errorPW}">
                    <p class="error">${errorPW}</p>
                </c:if>
            </div>

            <button type="submit" class="login-btn">ログイン</button>

            <div class="login-error">
                <c:if test="${not empty error}">
                    <p class="error">${error}</p>
                </c:if>
            </div>

        </form>
    </div>

    <div class="login-options">
        <a href="/member/findID">ID検索</a>
        <a href="/member/findPW">パスワード検索</a>
        <a href="/register">会員登録</a>
    </div>

</div>
</body>
</html>