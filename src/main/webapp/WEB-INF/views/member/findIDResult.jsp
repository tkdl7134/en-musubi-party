<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html style="zoom:100% !important;" lang="en">
<head>
    <meta charset="UTF-8">
    <title> ✿ ~ 縁結び ~ ✿ </title>
    <link rel="stylesheet" href="/resources/css/member/findIDResult.css">
</head>
<body>
<div class="findIDResult-container">
    <div class="findIDResult-deco-img">
        <img src="/resources/img/logo-img.png" alt="findIDResult-deco-img">
    </div>

    <div class="findIDResult-title">
        <p>ID検索結果</p>
    </div>

    <div class="findIDResult-box">
        <c:if test="${not empty memberID}">
            <p class="member-id">
                <span style="font-size: 16px; color: #db2227">✿</span>
                <span class="id-label">ID</span>
                <span style="font-size: 16px; color: #db2227">✿</span></br></br>
                <span class="id-value">${memberID}</span>
            </p>
        </c:if>
        <c:if test="${not empty error}">
            <p class="id-error">${error}</p>
        </c:if>
    </div>

        <a href="/login" class="login-btn">ログイン画面へ</a>

</div>
</body>
</html>
