<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html style="zoom:100% !important;" lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="icon" type="image/png" href="/img/favicon.png">
    <title> ✿ ~ 縁結び ~ ✿ </title>
    <link rel="stylesheet" href="/css/member/findPWResult.css">
</head>
<body>
<div class="findPWResult-container">
    <div class="findPWResult-deco-img">
        <img src="/img/logo-img.png" alt="findPWResult-deco-img">
    </div>

    <div class="findPWResult-title">
        <p>パスワード検索結果</p>
    </div>

    <div class="findPWResult-box">
        <c:if test="${not empty message}">
            <p class="message" style="white-space: pre-wrap;">
                <c:out value="${message}" escapeXml="false"/>
            </p>
        </c:if>
        <c:if test="${not empty error}">
            <p class="error">${error}</p>
        </c:if>
    </div>

    <a href="/login" class="login-btn">ログイン画面へ</a>

</div>
</body>
</html>
