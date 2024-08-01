<%@ page contentType="text/html; charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/template/guest.css">
    <script src="/resources/js/template/guest.js"></script>
</head>
<body>
<header class="hw_header">
    <a class="hw_logo" href=""><img src="/resources/img/logo.png" alt=""></a>
    <div class="hw_maker">縁結び</div>
    <a class="hw_mypage" href=""></a>
</header>
<div class="hw_title"> - guest -</div>
<div class="hw_titleline"><img src="/resources/img/title.png" alt=""></div>
<div class="hw_container">
    <div class="hw_content">
        <div class="hw_tab_title">出席の方</div>
        <ul class="tab_bnt">
            <li class="hw_tab__item active"><a href="#tabYes">名前順</a></li>
            <li class="hw_tab__item"><a href="#tabYesMale">新郎側</a></li>
            <li class="hw_tab__item"><a href="#tabYesFemale">新婦側</a></li>
        </ul>
    </div>
    <div class="hw_tab_content-wrapper">
        <div id="tabYes" class="hw_tab_content active">
            <div class="styled-table-wrapper">
                <div class="hw_invitation_title">
                    <span class="hw_invitation_small">名前</span>
                    <span class="hw_invitation_small">ゲスト</span>
                    <span class="hw_invitation_middie">電話番号</span>
                    <span class="hw_invitation_big">メール</span>
                </div>
                <%--                <c:forEach var="invitation" items="${invitationsYes}">--%>
                <div class="hw_invitation_content">
                    <span class="hw_invitation_small"></span>
                    <span class="hw_invitation_small"></span>
                    <span class="hw_invitation_middie"></span>
                    <span class="hw_invitation_big"></span>
                </div>
                <%--                </c:forEach>--%>
            </div>
        </div>
    </div>
</div>
</body>
</html>