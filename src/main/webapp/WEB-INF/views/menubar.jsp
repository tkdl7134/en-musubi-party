<%@ page contentType="text/html; charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>✿ ~ 縁結び ~ ✿</title>
    <!-- Noto Serif Japanese 폰트 적용 -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Noto+Serif+JP:wght@200..900&display=swap"/>
    <%-- CSS  --%>
    <link rel="stylesheet" href="/resources/css/menubar.css" />
    <%-- JS  --%>
    <script src="/resources/js/menubar.js" defer></script>
</head>
<body>
<!-- header -->
<div class="je_menu-header">
    <div class="je_logo-icon">
        <img src="/resources/img/en-musubi-logo.png" alt="" />
    </div>
    <div>縁結び</div>
    <div class="je_menu-icon" onclick="showActionSheet()">
        <img src="/resources/img/menu-button.png" alt="" />
    </div>
</div>

<c:choose>
    <c:when test="${not empty sessionScope.authenticatedMember.m_id}">
        <div class="action-sheet after-login" id="actionSheet" onclick="hideActionSheet()">
            <div class="action-options">
                <div class="menu-container">
                    <div class="menu-logo menu-profile">
                        <img src="https://firebasestorage.googleapis.com/v0/b/enmusubi-8f0dc.appspot.com/o/upload%2F${authenticatedMember.m_img}?alt=media" alt="" />
                    </div>
                    <div class="menu-user">
                        <div class="user-hi"><span>✿ </span> ようこそ <span> ✿</span></div>
                        <div class="user-name">${authenticatedMember.m_fam_kanji} 様</div>
                        <div class="user-mypage" onclick="location.href='/mypage/mytemplate/${sessionScope.authenticatedMember.m_id}'">マイページ</div>
                    </div>
                    <div class="menu-section menu-section2">
                        <div class="menu menu2" onclick="location.href='/product'">縁結び</div>
                        <div class="menu menu2" onclick="handleOption('Option 3')">縁パーティー</div>
                    </div>
                    <div class="logout-btn" id="logout-button">
                        <div>ログアウト</div>
                        <div><img src="/resources/img/logout.png" alt="" /></div>
                    </div>
                </div>
            </div>
        </div>
    </c:when>
    <c:otherwise>
    <div class="action-sheet before-login"  id="actionSheet" onclick="hideActionSheet()">
        <div class="action-options">
            <div class="menu-container">
                <div class="menu-logo">
                    <img src="/resources/img/en-musubi-logo.png" alt="" />
                </div>
                <div class="menu-section">
                    <div class="menu menu1" onclick="location.href='/login'">ログイン</div>
                    <div class="menu menu1" onclick="location.href='/register'">会員登録</div>
                    <div class="menu menu2" onclick="location.href='/product'">縁結び</div>
                    <div class="menu menu2" onclick="handleOption('Option 3')">縁パーティー</div>
                </div>
            </div>
        </div>
    </div>
    </c:otherwise>
</c:choose>



</body>
</html>