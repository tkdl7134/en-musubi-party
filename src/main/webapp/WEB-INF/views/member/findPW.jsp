<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html style="zoom:100% !important;" lang="en">
<head>
    <meta charset="UTF-8">
    <title> ✿ ~ 縁結び ~ ✿ </title>
    <link rel="stylesheet" href="/resources/css/member/findPW.css">
</head>
<body>
<div class="findPW-container">
    <div class="findPW-deco-img">
        <img src="/resources/img/logo-img.png" alt="findPW-deco-img">
    </div>

    <div class="findPW-title">
        <p>パスワード検索</p>
    </div>

    <div class="findPW-box">

        <form action="/member/findPW" method="post">

            <div class="form-group">
                <label for="m_id" class="fixed-label">縁結びID</label>
                <input type="text" id="m_id" name="m_id" placeholder="ID" required>
            </div>

            <div class="form-group">
                <label for="m_email" class="fixed-label">メールアドレス</label>
                <input type="email" id="m_email" name="m_email" placeholder="example@domain.com" required>
            </div>

            <button type="submit" class="findPW-btn">検索</button>

            <c:if test="${not empty message}">
                <p>${message}</p>
            </c:if>
            <c:if test="${not empty error}">
                <p>${error}</p>
            </c:if>

        </form>

    </div>
</div>
</body>
</html>
