<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원등록 페이지</title>
    <link rel="stylesheet" href="/resources/css/register/register.css">
    <!-- Slick Slider CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick-theme.min.css" />
    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- Slick Slider JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.js"></script>
    <!-- Custom JS -->
    <script src="/resources/js/register/register.js"></script>
</head>
<body>
<div class="slider single-item">
    <div class="slide" id="slide1">
        <h2>이름 입력</h2>
        <input type="text" id="name" placeholder="이름">
        <button class="next-button">다음</button>
    </div>
    <div class="slide" id="slide2">
        <h2>성별 및 생년월일 입력</h2>
        <select id="gender">
            <option value="">성별 선택</option>
            <option value="male">남성</option>
            <option value="female">여성</option>
        </select>
        <input type="date" id="birthdate">
        <button class="next-button">다음</button>
    </div>
    <div class="slide" id="slide3">
        <h2>아이디 및 패스워드 입력</h2>
        <input type="text" id="username" placeholder="아이디">
        <input type="password" id="password" placeholder="패스워드">
        <button class="next-button">다음</button>
    </div>
    <div class="slide" id="slide4">
        <h2>전화번호 및 이메일 입력</h2>
        <input type="tel" id="phone" placeholder="전화번호">
        <input type="email" id="email" placeholder="이메일">
        <button class="next-button">다음</button>
    </div>
    <div class="slide" id="slide5">
        <h2>일본 주소 입력</h2>
        <input type="text" id="zipcode" placeholder="우편번호">
        <input type="text" id="address" placeholder="주소">
        <button onclick="submitForm()">회원가입</button>
    </div>
</div>
</body>
</html>


