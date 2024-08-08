<%@ page contentType="text/html; charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html style="zoom : 100% !important;" lang="en">

<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/template/guest.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="/resources/js/template/guest.js"></script>
</head>
<body>
<form>
    <header class="hw_header">
        <a class="hw_logo" href=""><img src="/resources/img/logo.png" alt=""></a>
        <div class="hw_maker">縁結び</div>
        <a class="hw_mypage" href=""><img src="/resources/img/icon-user.png" alt=""></a>
    </header>
    <div class="hw_container">

        <div class="hw_title"> - アンケート管理 -</div>
        <div class="hw_titleline"><img src="/resources/img/title.png" alt=""></div>
        <div class="dropdown">
            <button class="dropbtn">
                View More
            </button>
            <div class="dropdown-content">
                <a href="#">참가자</a>
                <a href="#">세부사항</a>
                <a href="#">결석자</a>
            </div>
        </div>
        <div class="hw_content">
            <div class="hw_content-title">참가자</div>
            <ul class="hw_list">
                <li class="hw_tab-button">전체</li>
                <li class="hw_tab-button active">신랑</li>
                <li class="hw_tab-button">신부</li>
            </ul>
            <div>
                <span>이름</span>
                <span>유형</span>
                <span>번호</span>
                <span>이메일</span>
            </div>
            <div class="hw_tab-button-content">
                <span>김철수1</span>
                <span>신부</span>
                <span>010-1234-1234</span>
                <span>aaaa@gmail.com</span>
            </div>
            <div class="hw_tab-button-content show">
                <span>김철수2</span>
                <span>신부</span>
                <span>010-1234-1234</span>
                <span>aaaa@gmail.com</span>
            </div>
            <div class="hw_tab-button-content">
                <span>김철수3</span>
                <span>신부</span>
                <span>010-1234-1234</span>
                <span>aaaa@gmail.com</span>
            </div>
        </div>


        <div class="hw_content">
            <div class="hw_content-title">참가자 세부사항</div>
            <button id="more">더보기</button>
            <div>
                <span>이름</span>
                <span>인수</span>
                <span>알레르기</span>
            </div>
            <div class="hw_detail-guest">
                <span>김정연</span>
                <span>어른 1</span>
                <span>꽃알레르기</span>
            </div>
            <div class="hw_detail-guest">
                <span>김정연</span>
                <span>어른 1</span>
                <span>꽃알레르기</span>
            </div>
            <div class="hw_detail-guest">
                <span>김정연</span>
                <span>어른 1</span>
                <span>꽃알레르기</span>
            </div>
        </div>


        <div class="hw_content">
            <div class="hw_content-title">결석자</div>
        </div>

    </div>
</form>
</body>
</html>
