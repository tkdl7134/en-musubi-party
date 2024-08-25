<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html style="zoom:100% !important;" lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> ✿ ~ 縁結び ~ ✿</title>
    <link rel="stylesheet" href="/resources/css/register/register.css">
    <!-- Noto Serif Japanese-->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Noto+Serif+JP:wght@400;700&display=swap">
    <!-- Slick Slider CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick-theme.min.css"/>
    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- Slick Slider JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.js"></script>
    <script src="/resources/js/register/register.js"></script>
    <!-- Flatpickr CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
    <!-- Flatpickr JS -->
    <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
    <!-- Flatpickr 日本語 -->
    <script src="https://cdn.jsdelivr.net/npm/flatpickr/dist/l10n/ja.js"></script>
    <link rel="stylesheet" href="/resources/css/product/sakura.min.css"/>
</head>
<body>
<div id="sakura-container">
    <div class="register-container">

        <%-- Register Header --%>
        <div class="register-header">

            <div class="register-header-logo">
                <img src="/resources/img/logo-img.png" alt="register-header-logo">
            </div>

            <div class="register-header-heart">
                <img src="/resources/img/register-header-heart.png" alt="register-header-heart">
            </div>

        </div>

        <%-- Register Slider --%>
        <div class="slider-container">
            <%-- Slide 1 --%>
            <div class="slide" id="slide1">

                <div class="home-vertical-text">
                    <p class="home-vertical-text1">
                        <span style="color: #db2227">✿</span>
                        <span style="color: #3f3f3f"> ようこそ </span>
                    </p>
                    <p class="home-vertical-text2">
                        <span style="color: #3f3f3f">縁結びへ </span>
                        <span style="color: #db2227">✿</span>
                    </p>
                </div>
                <div class="register-character">
                    <img src="/resources/img/EnMusubi-character.png" alt="Enmusubi-character">
                </div>

            </div>


            <%-- Slide 2 : お名前 --%>
            <div class="slide" id="slide2">

                <p class="register-slide-title"> お名前 </p>

                <div class="register-name-input">
                    <div class="register-name-label-container">
                        <p>漢字</p>
                    </div>
                    <div class="register-name-input-container">
                        <input type="text" id="m_fam_kanji" placeholder="姓">
                        <input type="text" id="m_name_kanji" placeholder="名">
                    </div>
                </div>

                <div class="register-name-input">
                    <div class="register-name-label-container">
                        <p>フリガナ</p>
                    </div>
                    <div class="register-name-input-container">
                        <input type="text" id="m_fam_kana" placeholder="セイ">
                        <input type="text" id="m_name_kana" placeholder="メイ">
                    </div>
                </div>

                <div class="register-name-input">
                    <div class="register-name-label-container">
                        <p>ローマ字</p>
                    </div>
                    <div class="register-name-input-container">
                        <input type="text" id="m_fam_eng" placeholder="Last Name">
                        <input type="text" id="m_name_eng" placeholder="First Name">
                    </div>
                </div>

            </div>


            <%-- Slide 3 : 性別＆生年月日 --%>
            <div class="slide" id="slide3">

                <%-- 性別 --%>
                <p class="register-slide-title slide3-title1"> 性別 </p>

                <div class="register-gender-selection">
                    <div class="register-gender-container">
                        <label for="male" class="gender-label">
                            <input type="radio" id="male" name="gender" value="男性">
                            <img src="/resources/img/register-male.png" alt="男性">
                        </label>
                        <label for="female" class="gender-label">
                            <input type="radio" id="female" name="gender" value="女性">
                            <img src="/resources/img/register-female.png" alt="女性">
                        </label>
                    </div>
                </div>

                <%-- 生年月日 --%>
                <p class="register-slide-title slide3-title2"> 生年月日 </p>
                <div class="register-birthdate-input">
                    <div class="register-birthdate-container">
                        <input type="text" id="year" placeholder="YYYY" maxlength="4">
                        <input type="text" id="month" placeholder="MM" maxlength="2">
                        <input type="text" id="day" placeholder="DD" maxlength="2">
                    </div>
                    <div class="register-birthdate-error-message">
                        <div id="yearError"></div>
                        <div id="monthError"></div>
                        <div id="dayError"></div>
                    </div>
                </div>
            </div>


            <%-- Slide ４ : 電話番号＆メールアドレス --%>
            <div class="slide" id="slide4">

                <%-- 電話番号 --%>
                <p class="register-slide-title slide4-title1 "> 電話番号 </p>
                <div class="register-phone-input input-group">
                    <div class="register-phone-container">
                        <input type="tel" id="phone" placeholder="000-0000-0000" maxlength="13">
                    </div>
                </div>

                <%-- メールアドレス --%>
                <p class="register-slide-title slide4-title2"> メールアドレス </p>
                <div class="register-email-input">
                    <div class="register-email-container">
                        <input type="email" id="email" placeholder="example@domain.com">
                        <div class="register-verification-send">
                            <div id="emailError"></div>
                            <div id="emailSuccess"></div>
                            <div id="send-blank"></div>
                            <button id="sendCodeButton"> コード送信</button>
                        </div>
                    </div>
                </div>

                <%-- 認証コード --%>
                <div class="register-verification-input" id="verificationCodeGroup" style="display: none;">
                    <div class="register-verification-container">
                        <input type="text" id="verificationCode" placeholder="認証コード入力">
                        <div class="register-verification-check">
                            <div id="verifyMessage"></div>
                            <div id="check-blank"></div>
                            <button id="verifyCodeButton"> コード確認</button>
                        </div>
                    </div>
                </div>

            </div>


            <%-- Slide 5 : ID＆PW --%>
            <div class="slide" id="slide5">

                <p class="register-slide-title slide5-title1"> ID </p>
                <div class="register-ID-input">
                    <div class="register-ID-container">
                        <input type="text" id="ID" placeholder="縁結びID" maxlength="20">
                        <div class="register-checkID-check">
                            <div id="IDFeedback" class="feedback-message"></div>
                            <button id="check-ID" disabled> 重複確認</button>
                        </div>
                    </div>
                </div>

                <p class="register-slide-title slide5-title2"> PW </p>
                <div class="register-PW-input">
                    <div class="register-PW-container">
                        <input type="password" id="password" placeholder="パスワード" maxlength="20">
                        <div class="register-checkPW-check">
                            <div id="passwordFeedback" class="feedback-message"></div>
                            <input type="checkbox" id="showPassword">
                            <label for="showPassword"> 表示 </label>
                        </div>
                    </div>
                </div>

            </div>


            <%-- Slide 6 : 住所 --%>
            <div class="slide" id="slide6">

                <p class="register-slide-title slide6-title"> ご住所 </p>
                <div class="register-address-input">
                    <div class="register-address-container">
                        <div class="register-zipcode-check">
                            <input type="text" id="zipcode" placeholder="〒000-0000" style="color: #808080">
                            <button id="searchAddress"> 検索</button>
                        </div>
                        <div style="width: 100%; height: 30px;">
                            <div id="zipcodeError" class="error-message"></div>
                        </div>
                        <div class="register-zipcode-result">
                            <input type="text" id="state-city" placeholder="都道府県 ・ 市区町村">
                            <input type="text" id="town" placeholder="町名・番地">
                            <input type="text" id="building" placeholder="建物名 ・ 部屋番号">
                        </div>
                    </div>
                </div>

            </div>

        </div>

        <%-- Register Slider Controller--%>
        <div class="register-slider-controller">
            <button class="register-slider-prevButton" style="display: none;">
                <img src="/resources/img/slide-prev.png" alt="Prev">
            </button>
            <button class="register-slider-nextButton">
                <img src="/resources/img/slide-next.png" alt="Next">
            </button>
            <button id="register-submitButton"> 登録</button>
        </div>

        <div class="register-submitError">
            <div class="error-message" id="submitError"></div>
        </div>

    </div>
</div>

<script src="/resources/js/product/sakura.min.js"></script>
<script>
    var sakura = new Sakura("#sakura-container");
</script>

</body>
</html>
