<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html style="zoom:100% !important;" lang="en">
<head>
    <meta charset="UTF-8">
    <title> ✿ ~ 縁結び ~ ✿ </title>
    <link rel="stylesheet" href="/css/member/findID.css">
</head>
<body>
<div class="findID-container">
    <div class="findID-deco-img">
        <img src="/img/logo-img.png" alt="findID-deco-img">
    </div>

    <div class="findID-title">
        <p>ID 検索</p>
    </div>

    <div class="findID-box">

        <form action="/member/findID" method="post">

            <div class="form-group">
                <label for="m_fam_eng" class="fixed-label">ローマ字姓</label>
                <input type="text" id="m_fam_eng" name="m_fam_eng" placeholder="Last Name" required>
            </div>

            <div class="form-group">
                <label for="m_email" class="fixed-label">メールアドレス</label>
                <input type="email" id="m_email" name="m_email" placeholder="example@domain.com" required>
            </div>

            <button type="submit" class="findID-btn">検索</button>

        </form>

    </div>
</div>
</body>
</html>
