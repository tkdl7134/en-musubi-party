<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <!-- Noto Serif Japanese 폰트 적용 -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Noto+Serif+JP:wght@200..900&display=swap" />
    <!-- CSS -->
    <link rel="stylesheet" href="/resources/css/wishSetting/funding_setting.css" />
    <!-- JAVASCRIPT -->
    <script src="/resources/js/wishSetting/funding_setting.js" defer></script>
</head>
<body>
<!-- header -->
<div class="je_menu-bar">
    <div id="je_logo">
        <img src="/resources/img/en-musubi-logo.png" alt="" />
    </div>
</div>
<!-- content -->
<div id="je_funding-setting-container">
    <div class="je_page-title">
        <div class="je_page-title-txt">ファンディング 管理</div>
        <div class="je_page-title-line">
            <img src="/resources/img/page-title-line.png" alt="" />
        </div>
        <div class="je_page-content">
            <!-- 예시 -->
            <div class="je_funding-box">
                <div class="je_inner-yellow"></div>
                <div class="je_funding-img">
                    <img src="/resources/img/funding-sofa.png" alt="" />
                </div>
                <div class="je_funding-info">
                    <div class="je_funding-name">예시</div>
                    <div class="je_funding-price">
                        <input type="text" placeholder="원하는 금액 / 지정된 금액 円" />
                    </div>
                    <div class="je_funding-button"><button>堂録</button></div>
                </div>
            </div>

            <div style="width: 100%">
                <img
                        style="width: 100%"
                        src="/resources/img/input-box-content-line.png"
                        alt=""
                />
            </div>

            <input type="hidden" id="eventNo" value="${e_no}">
            <!-- 추가 == INSERT -->
            <div class="je_funding-box">
                <div class="je_inner-yellow"></div>
                <div class="je_funding-img">
                    <img src="/resources/img/funding-more.png" alt="" />
                </div>
                <div class="je_funding-info">
                    <div class="je_funding-name">
                        <input type="text" placeholder="アイテム" id="fundingItem-name" />
                    </div>
                    <div class="je_funding-price">
                        <input type="text" placeholder="円" id="fundingItem-price" />
                    </div>
                    <div class="je_funding-button"><button id="fundingItem-insert-button">堂録</button></div>
                </div>
            </div>

            <!-- 수정, 삭제 -->
            <div id="existing-fundingList"></div>

            <%--등록된 펀딩물품 템플릿--%>
            <div class="je_funding-box item temp">
                <div class="je_inner-yellow"></div>
                <div class="je_funding-img">
                    <img src="/resources/img/funding-sofa.png" alt="" />
                </div>
                <div class="je_funding-info">
                    <div class="je_funding-name"></div>
                    <div class="je_funding-price">
                        <input type="text" placeholder=" 円" id="new-price"/>
                    </div>
                    <div class="je_funding-button">
                        <button class="je_update-btn" id="fundingItem-update-button">修正</button>
                        <button class="je_delete-btn" id="fundingItem-delete-button">削除</button>
                    </div>
                </div>
            </div>

            <div class="je_top-btn" onclick="goToTop()">
                <span>トップ</span>
            </div>
        </div>
    </div>
</div>
</body>
</html>
