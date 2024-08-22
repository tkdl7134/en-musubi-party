<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="../menubar.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <title>Document</title>
    <!-- Noto Serif Japanese 폰트 적용 -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Noto+Serif+JP:wght@200..900&display=swap" />
    <!-- CSS -->
    <link rel="stylesheet" href="/resources/css/wishSetting/wishlist_setting.css" />
    <!-- JAVASCRIPT -->
    <script src="/resources/js/wishSetting/wishlist_setting.js" defer></script>
</head>
<body>
<!-- content -->
<div id="je_wishlist-setting-container">
    <div class="je_page-title">ウィッシュリスト</div>
        <div class="je_page-content">
            <!-- 축의금 -->
            <div class="je_wishlist">
                <div class="je_wishlist-title">ご祝儀</div>
                <div class="je_wishlist-content">
                    <div class="je_wishlist-img">
                        <img src="/resources/img/red-envelope-icon.png" alt="" />
                    </div>
                    <div class="je_wishlist-onoff">
                        <input type="checkbox" name="" id="je_money-switch" />
                        <label for="je_money-switch" class="switch_label">
                            <span class="je_onoff-button"></span>
                        </label>
                    </div>
                </div>
            </div>
            <!-- 프레젠또 - 아마존 -->
            <div class="je_wishlist">
                <div class="je_wishlist-title">プレゼント</div>
                <div class="je_wishlist-content">
                    <div class="je_wishlist-img">
                        <img src="/resources/img/present-icon.png" alt="" />
                    </div>
                    <div class="je_wishlist-onoff">
                        <input type="checkbox" name="" id="je_present-switch" />
                        <label for="je_present-switch" class="switch_label">
                            <span class="je_onoff-button"></span>
                        </label>
                    </div>
                </div>
                <div id="je_amazon-link">
                    <input type="text" id="amazonLink" value="${eventVO.e_amazon}"/>
                    <div id="checkIcon">
                        <img src="/resources/img/check-icon.gif" />
                    </div>
                    <button id="amazonLink_btn" class="je_amazon-btn"
                            onclick="updateAmazonLink(${eventVO.e_no})">登録</button>
                </div>
            </div>
            <!-- 펀딩 -->
            <div class="je_wishlist">
                <div class="je_wishlist-title">ファンディング</div>
                <div class="je_wishlist-content">
                    <div class="je_wishlist-img">
                        <img src="/resources/img/piggy-bank-icon.png" alt="" />
                    </div>
                    <div class="je_wishlist-onoff">
                        <input type="checkbox" name="" id="je_funding-switch" />
                        <label for="je_funding-switch" class="switch_label">
                            <span class="je_onoff-button"></span>
                        </label>
                    </div>
                </div>
            </div>
            <div id="je_nextpage-button">
                <button onclick="location.href='/${eventVO.e_no}/wishlist-setting/funding'">ファンディング 設定</button>
            </div>
        </div>
    </div>
<!-- alert -->
<div id="je_moneyOkMsg">
    <p>「ご祝儀を<span>受け付ける</span>」</p>
    選択されました。
</div>
<div id="je_moneyNoMsg">
    <p>「ご祝儀を<span>辞退する</span>」</p>
    ことを選択されました。
</div>
</body>
</html>
