<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원등록 페이지</title>
    <link rel="stylesheet" href="/resources/css/register/register.css">
    <!-- Noto Serif Japanese 폰트 추가 -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Noto+Serif+JP:wght@400;700&display=swap">
    <!-- Slick Slider CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick-theme.min.css"/>
    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- Slick Slider JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.js"></script>
    <!-- Custom JS -->
    <script src="/resources/js/register/register.js"></script>
    <!-- Flatpickr CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
    <!-- Flatpickr JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
    <!-- Flatpickr 일본어 로케일 추가 -->
    <script src="https://cdn.jsdelivr.net/npm/flatpickr/dist/l10n/ja.js"></script>

</head>
<body>
<div class="register">
    <div class="slider-container">
        <div class="slide" id="slide1">
            <h2 class="slide_title"> お名前 </h2>
            <div class="register-name-input">
                <p> 漢字 </p>
                <input type="text" id="m_fam_kanji" placeholder="姓">
                <input type="text" id="m_name_kanji" placeholder="名">
            </div>
            <div class="register-name-input">
                <p> カナ </p>
                <input type="text" id="m_fam_kana" placeholder="セイ">
                <input type="text" id="m_name_kana" placeholder="メイ">
            </div>
            <div class="register-name-input">
                <p> ローマ字 </p>
                <input type="text" id="m_fam_eng" placeholder="Last Name">
                <input type="text" id="m_name_eng" placeholder="First Name">
            </div>
        </div>

        <div class="slide" id="slide2">
            <h2>성별 및 생년월일 입력</h2>
            <div class="gender-selection">
                <label for="male">
                    <input type="radio" id="male" name="gender" value="male"> 남성
                </label>
                <label for="female">
                    <input type="radio" id="female" name="gender" value="female"> 여성
                </label>
            </div>
            <div class="input-group">
                <p>생년월일</p>
                <input type="text" id="birthdate" placeholder="생년월일을 선택하세요">
            </div>
        </div>

        <div class="slide" id="slide3">
            <h2>전화번호 및 이메일 입력</h2>
            <div class="input-group">
                <p>전화번호</p>
                <input type="tel" id="phone" placeholder="000-0000-0000" maxlength="13">
            </div>
            <div class="input-group">
                <p>이메일</p>
                <input type="email" id="email" placeholder="example@domain.com">
                <button id="sendCodeButton">코드 전송</button>
            </div>
            <div class="input-group" id="verificationCodeGroup" style="display:none;">
                <p>인증 코드</p>
                <input type="text" id="verificationCode" placeholder="Enter your code">
                <button id="verifyCodeButton">코드 확인</button>
                <div id="verifyMessage"></div>
            </div>
        </div>


        <div class="slide" id="slide4">
            <h2>아이디 및 패스워드 입력</h2>
            <div class="input-group">
                <p>아이디</p>
                <input type="text" id="username" placeholder="아이디" maxlength="20">
            </div>
            <button id="check-username" onclick="checkUsername()" disabled>중복 확인</button>
            <div id="usernameFeedback"></div>

            <div class="input-group">
                <p>패스워드</p>
                <input type="password" id="password" placeholder="패스워드" maxlength="20">
            </div>
            <div>
                <input type="checkbox" id="showPassword">
                <label for="showPassword">패스워드 표시</label>
            </div>
            <div id="passwordFeedback"></div>
        </div>

        <div class="slide" id="slide5">
            <h2>일본 주소 입력</h2>
            <input type="text" id="zipcode" placeholder="〒000-0000" style="color: #808080">
            <button id="searchAddress">주소 검색</button>
            <input type="text" id="address" placeholder="住所 (예: 東京都港区赤坂)" readonly>
            <input type="text" id="building" placeholder="建物名・部屋番号 (예: 赤坂タワーレジデンス 101)">
        </div>


    </div>
    <div class="slider-controls">
        <button class="prev-button" style="display: none;">이전</button>
        <button class="next-button">다음</button>
        <button id="submitButton">등록 완료</button>
    </div>
</div>

</body>
</html>
