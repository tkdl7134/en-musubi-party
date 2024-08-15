<%@ page contentType="text/html; charset=utf-8"%>
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
    <link rel="stylesheet" href="/resources/css/wishSetting/wishlist_setting.css" />
    <!-- JAVASCRIPT -->
    <script src="/resources/js/wishSetting/wishlist_setting.js" defer></script>
</head>
<body>
<!-- header -->
<div class="je_menu-bar">
    <div id="je_logo">
        <img src="/resources/img/en-musubi-logo.png" alt="" />
    </div>
</div>
<!-- content -->
<div id="je_wishlist-setting-container">
    <div class="je_page-title">
        <div class="je_page-title-txt">ウィッシュリスト</div>
        <div class="je_page-title-line">
            <img src="/resources/img/page-title-line.png" alt="" />
        </div>
        <div class="je_page-content">
            <div class="je_wishlist">
                <div class="je_wishlist-icon">
                    <div class="je_wishlist-img">
                        <img src="/resources/img/money-envelope-icon.png" alt="" />
                    </div>
                    <div class="je_wishlist-title">ご祝儀</div>
                </div>
                <div class="je_wishlist-onoff">
                    <input type="checkbox" name="" id="je_money-switch" />
                    <label for="je_money-switch" class="switch_label">
                        <span class="je_onoff-button"></span>
                    </label>
                </div>
            </div>
            <div class="je_wishlist">
                <div class="je_wishlist-icon">
                    <div class="je_wishlist-img">
                        <img src="/resources/img/amazonList-icon.png" alt="" />
                    </div>
                    <div class="je_wishlist-title">プレゼント</div>
                </div>
                <div class="je_wishlist-onoff">
                    <input type="checkbox" name="" id="je_present-switch" />
                    <label for="je_present-switch" class="switch_label">
                        <span class="je_onoff-button"></span>
                    </label>
                </div>
                <div id="je_amazon-link">
                    <input type="text"
                           id="amazonLink" value="${eventVO.e_amazon}" />
                    <div id="checkIcon"><img src="/resources/img/check-icon.gif"> </div>
                    <button id="amazonLink_btn" class="je_amazon-btn"
                            onclick="updateAmazonLink(${eventVO.e_no})">登録</button>
                </div>
            </div>
            <div class="je_wishlist">
                <div class="je_wishlist-icon">
                    <div class="je_wishlist-img">
                        <img src="/resources/img/funding-icon.png" alt="" />
                    </div>
                    <div class="je_wishlist-title">ファンディング</div>
                </div>
                <div class="je_wishlist-onoff">
                    <input type="checkbox" name="" id="je_funding-switch" />
                    <label for="je_funding-switch" class="switch_label">
                        <span class="je_onoff-button"></span>
                    </label>
                </div>
            </div>
            <div id="je_nextpage-button">
                <button onclick="location.href='/${eventVO.e_no}/wishlist-setting/funding'">ファンディング 設定</button>
            </div>
        </div>
    </div>
</div>
</body>
</html>
