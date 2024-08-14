<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원등록 페이지</title>

    <!-- Custom CSS 파일 -->
    <link rel="stylesheet" href="/resources/css/register/register.css">

    <!-- Noto Serif Japanese 폰트 추가 -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Noto+Serif+JP:wght@400;700&display=swap">

    <!-- Slick Slider CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick-theme.min.css"/>

    <!-- jQuery 라이브러리 -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <!-- Slick Slider JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.js"></script>

    <!-- Custom JS 파일 -->
    <script src="/resources/js/register/register.js"></script>

    <!-- Flatpickr CSS (달력 위젯) -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">

    <!-- Flatpickr JS (달력 위젯) -->
    <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>

    <!-- Flatpickr 일본어 로케일 추가 -->
    <script src="https://cdn.jsdelivr.net/npm/flatpickr/dist/l10n/ja.js"></script>
</head>
<body>
<div class="register">
    <div class="slider-container">

        <!-- 슬라이드 1: 이름 입력 섹션 -->
        <div class="slide" id="slide1">
            <h2 class="slide_title"> お名前 </h2>
            <div class="register-name-input">
                <p> 漢字 </p>
                <input type="text" id="m_fam_kanji" placeholder="姓"> <!-- 성 입력 필드 -->
                <input type="text" id="m_name_kanji" placeholder="名"> <!-- 이름 입력 필드 -->
            </div>
            <div class="register-name-input">
                <p> カナ </p>
                <input type="text" id="m_fam_kana" placeholder="セイ"> <!-- 성 카나 입력 필드 -->
                <input type="text" id="m_name_kana" placeholder="メイ"> <!-- 이름 카나 입력 필드 -->
            </div>
            <div class="register-name-input">
                <p> ローマ字 </p>
                <input type="text" id="m_fam_eng" placeholder="Last Name"> <!-- 성 로마자 입력 필드 -->
                <input type="text" id="m_name_eng" placeholder="First Name"> <!-- 이름 로마자 입력 필드 -->
            </div>
        </div>

        <!-- 슬라이드 2: 성별 및 생년월일 입력 섹션 -->
        <div class="slide" id="slide2">
            <h2>성별 및 생년월일 입력</h2>
            <div class="gender-selection">
                <!-- 성별 선택 라디오 버튼 -->
                <label for="male">
                    <input type="radio" id="male" name="gender" value="male"> 남성
                </label>
                <label for="female">
                    <input type="radio" id="female" name="gender" value="female"> 여성
                </label>
            </div>
            <div class="input-group">
                <p>생년월일</p>
                <div class="birthdate-input">
                    <input type="text" id="year" placeholder="YYYY" maxlength="4"> <!-- 연도 입력 필드 -->
                    <input type="text" id="month" placeholder="MM" maxlength="2"> <!-- 월 입력 필드 -->
                    <input type="text" id="day" placeholder="DD" maxlength="2"> <!-- 일 입력 필드 -->
                </div>
                <div id="yearError" class="error-message"></div> <!-- 연도 오류 메시지 -->
                <div id="monthError" class="error-message"></div> <!-- 월 오류 메시지 -->
                <div id="dayError" class="error-message"></div> <!-- 일 오류 메시지 -->
            </div>
        </div>

        <!-- 슬라이드 3: 전화번호 및 이메일 입력 섹션 -->
        <div class="slide" id="slide3">
            <h2>전화번호 및 이메일 입력</h2>
            <div class="input-group">
                <p>전화번호</p>
                <input type="tel" id="phone" placeholder="000-0000-0000" maxlength="13"> <!-- 전화번호 입력 필드 -->
            </div>
            <div class="input-group">
                <p>이메일</p>
                <input type="email" id="email" placeholder="example@domain.com"> <!-- 이메일 입력 필드 -->
                <button id="sendCodeButton">코드 전송</button> <!-- 이메일 인증 코드 전송 버튼 -->
                <div id="emailError" class="error-message"></div> <!-- 이메일 오류 메시지 -->
                <div id="emailSuccess" class="success-message"></div> <!-- 이메일 성공 메시지 -->
            </div>
            <div class="input-group" id="verificationCodeGroup" style="display:none;">
                <p>인증 코드</p>
                <input type="text" id="verificationCode" placeholder="Enter your code"> <!-- 인증 코드 입력 필드 -->
                <button id="verifyCodeButton">코드 확인</button> <!-- 인증 코드 확인 버튼 -->
                <div id="verifyMessage"></div> <!-- 인증 코드 확인 결과 메시지 -->
            </div>
        </div>

        <!-- 슬라이드 4: 아이디 및 패스워드 입력 섹션 -->
        <div class="slide" id="slide4">
            <h2>아이디 및 패스워드 입력</h2>
            <div class="input-group">
                <p>아이디</p>
                <input type="text" id="ID" placeholder="아이디" maxlength="20"> <!-- 아이디 입력 필드 -->
            </div>
            <button id="check-ID" disabled>중복 확인</button> <!-- 아이디 중복 확인 버튼 -->
            <div id="IDFeedback" class="feedback-message"></div> <!-- 아이디 중복 확인 결과 메시지 -->

            <div class="input-group">
                <p>패스워드</p>
                <input type="password" id="password" placeholder="패스워드" maxlength="20"> <!-- 패스워드 입력 필드 -->
            </div>
            <div>
                <input type="checkbox" id="showPassword">
                <label for="showPassword">패스워드 표시</label> <!-- 패스워드 표시 체크박스 -->
            </div>
            <div id="passwordFeedback" class="feedback-message"></div> <!-- 패스워드 유효성 검사 결과 메시지 -->
        </div>

        <!-- 슬라이드 5: 일본 주소 입력 섹션 -->
        <div class="slide" id="slide5">
            <h2>일본 주소 입력</h2>
            <input type="text" id="zipcode" placeholder="〒000-0000" style="color: #808080"> <!-- 우편번호 입력 필드 -->
            <button id="searchAddress">주소 검색</button> <!-- 주소 검색 버튼 -->
            <div id="zipcodeError" class="error-message"></div> <!-- 우편번호 오류 메시지 -->
            <input type="text" id="state-city" placeholder="都道府県 + 市区町村 (예: 東京都港区)" readonly> <!-- 도도부현 + 시구정촌 입력 필드 -->
            <input type="text" id="town" placeholder="町名・番地 (예: 赤坂)"> <!-- 정명・번지 입력 필드 -->
            <input type="text" id="building" placeholder="建物名・部屋番号 (예: 赤坂タワーレジデンス 101)"> <!-- 건물명・방번호 입력 필드 -->
        </div>

    </div>
    <!-- 슬라이드 컨트롤 버튼 -->
    <div class="slider-controls">
        <button class="prev-button" style="display: none;">이전</button> <!-- 이전 슬라이드 버튼 -->
        <button class="next-button">다음</button> <!-- 다음 슬라이드 버튼 -->
        <button id="submitButton">등록 완료</button> <!-- 최종 제출 버튼 -->
        <div id="submitError" class="error-message"></div> <!-- 제출 시 오류 메시지 -->
    </div>
</div>

</body>
</html>
