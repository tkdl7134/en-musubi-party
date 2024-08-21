<%@ page contentType="text/html; charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html style="zoom:100% !important;" lang="en">
<head>
    <meta charset="UTF-8">
    <title>Main</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Serif+JP:wght@400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/resources/css/main/main.css">
    <script src="/resources/js/main/main.js"></script>
</head>
<body>

<div class="main-container">

    <c:choose>
        <%-- 로그인 O --%>
        <c:when test="${not empty sessionScope.authenticatedMember.m_id}">
            <div class="main-welcome-box">
                <div class="main-logo-img">
                    <img src="/resources/img/logo-img.png" alt="main-logo-img" />
                </div>
                <div class="main-welcome-text">
                    <p>
                        <span style="color: #db2227">✿</span>
                        <span style="color: #3f3f3f"> ようこそ </span>
                        <span style="color: #db2227">✿</span>
                    </p>
                    <p>縁結び＆パーティーへ</p>
                </div>
                <hr class="main-welcome-line" />
                <div class="main-welcome-register">
                    <div class="main-account-box">
                        <div class="main-account-name">${authenticatedMember.m_fam_kanji} 様</div>
                        <div class="main-account-img">
                            <img src="https://firebasestorage.googleapis.com/v0/b/enmusubi-8f0dc.appspot.com/o/upload%2F${authenticatedMember.m_img}?alt=media" alt="" />
                        </div>
                    </div>
                    <div>
                        <div class="main-account-box">
                            <div class="main-logout" id="logout-button">ログアウト</div>
                            <div class="main-account-mypage">マイページ</div>
                        </div>
                    </div>
                </div>
                <div class="main-deco">
                    <img src="/resources/img/main-deco-img.png" alt="main-deco-img">
                </div>
            </div>
        </c:when>
        <%-- 로그인 X --%>
        <c:otherwise>
            <div class="main-welcome-box">
                <div class="main-logo-img">
                    <img src="/resources/img/logo-img.png" alt="main-logo-img">
                </div>
                <div class="main-welcome-text">
                    <p>
                        <span style="color: #DB2227">✿</span>
                        <span style="color: #3F3F3F;"> ようこそ </span>
                        <span style="color: #DB2227;">✿</span>
                    </p>
                    <p> 縁結び＆パーティーへ </p>
                </div>
                <hr class="main-welcome-line">
                <div class="main-welcome-register">
                    　　　<div onclick="showBottomSheet()" class="main-welcome-register-highlight button">メンバー登録</div>　後、<br>
                    お客様だけの特別なサービスを<br>
                    お楽しみください！
                </div>
                <div class="main-deco">
                    <img src="/resources/img/main-deco-img.png" alt="main-deco-img">
                </div>
            </div>
        </c:otherwise>
    </c:choose>

    <div class="main-envelope">
        <div class="main-enMusubi-envelope">
            <div class="main-enMusubi-envelope-bottom"></div>
            <div class="main-enMusubi-envelope-paper"></div>
            <div class="main-enMusubi-envelope-text">
                <p>
                    <span style="color: #FF5A55; font-size: 16px;">✿</span>
                    <span style="color: #3F3F3F; font-size: 18px;"> 縁結び </span>
                    <span style="color: #FF5A55; font-size: 16px;">✿</span>
                </p>
            </div>
            <div class="main-enMusubi-envelope-top"></div>
            <div class="main-enMusubi-envelope-top-border"></div>
            <div class="main-enMusubi-envelope-logo-img">
                <img src="/resources/img/logo-img.png" alt="main-envelope-logo-img">
            </div>
        </div>

        <div class="main-enParty-envelope">
            <div class="main-enParty-envelope-bottom"></div>
            <div class="main-enParty-envelope-paper"></div>
            <div class="main-enParty-envelope-text">
                <p>
                    <span style="color: #FF5A55; font-size: 16px;">✿</span>
                    <span style="color: #3F3F3F; font-size: 18px;"> 縁パーティー </span>
                    <span style="color: #FF5A55; font-size: 16px;">✿</span>
                </p>
            </div>
            <div class="main-enParty-envelope-top"></div>
            <div class="main-enParty-envelope-logo-img">
                <img src="/resources/img/logo-img.png" alt="main-envelope-logo-img">
            </div>
        </div>
    </div>

    <!-- 아래 뾰롱 -->
    <div class="action-sheet" id="actionSheet" onclick="hideBottomSheet()">
        <div class="action-options">
            <div class="menu-container">
                <div class="menu-imgBox">
                    <div><img src="/resources/img/amazonList-icon.png" alt="" /></div>
                </div>
                <div class="menu-section">
                    <div class="menu" onclick="location.href='/login'">
                        ログイン
                    </div>
                    <div class="menu" onclick="location.href='/register'">
                        会員登録
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>

<%--Logout - defer 써야해서 일단 여기에 적어둡니다.--%>
<script>
    document.getElementById('logout-button').addEventListener('click', function (){
        fetch('/session/invalidate', {
            method: 'GET'
        }).then(response => {
            console.log(response)
            if (response.ok) {
                window.location.href = '/'
            } else{
                console.log('세션만료 실패');
            }
        })
            .catch(error => {
                console.error('오류발생', error);
            })
    });
</script>
</body>
</html>