<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html style="zoom:100% !important;" lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="icon" type="image/png" href="/img/favicon.png">
    <title> ✿ ~ 縁結び ~ ✿ </title>
    <link rel="stylesheet" href="/css/member/resetPW.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <script src="/js/member/resetPW.js"></script>
</head>
<body>
<div class="resetPW-container">
    <div class="resetPW-deco-img">
        <img src="/img/logo-img.png" alt="resetPW-deco-img">
    </div>

    <div class="resetPW-title">
        <p>パスワード再設定</p>
    </div>

    <div class="resetPW-box">

        <form action="/member/resetPW" method="post">

            <input type="hidden" name="token" value="${token}">

            <div class="form-group">
                <label for="newPW" class="fixed-label">新しいパスワード</label>
                <input type="password" id="newPW" name="newPW" required>
                <i class="fas fa-eye-slash password-toggle" onclick="togglePWVisibility('newPW')"></i>
            </div>

            <div class="form-group">
                <label for="confirmPW" class="fixed-label">新しいパスワードの確認</label>
                <input type="password" id="confirmPW" name="confirmPW" required>
                <i class="fas fa-eye-slash password-toggle" onclick="togglePWVisibility('confirmPW')"></i>
            </div>

            <p id="password-error" style="color: red;"></p>

            <button type="submit" class="resetPW-btn">再設定</button>

            <c:if test="${not empty message}">
                <p class="message">${message}</p>
            </c:if>
            <c:if test="${not empty error}">
                <p class="error">${error}</p>
            </c:if>

        </form>

    </div>

    <div>
        <a href="/login" class="login-btn">ログイン画面へ</a>
    </div>

</div>
</body>
</html>
