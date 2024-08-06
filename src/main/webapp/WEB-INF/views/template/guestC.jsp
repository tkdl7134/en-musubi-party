<%@ page contentType="text/html; charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html style="zoom : 100% !important;" lang="en">

<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/template/guestC.css">
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

        <!-- 드롭다운 메뉴 -->
        <div class="dropdown">
            <select id="dropdown-select" class="dropbtn">
                <option value="" disabled selected>결석자</option>
                <option value="/mypage/guest">참가자</option>
                <option value="/mypage/guestB">세부사항</option>
            </select>
        </div>


        <!-- 탭 콘텐츠 -->
        <div class="hw_content">
            <ul class="hw_list">
                <li class="hw_tab-button">전체</li>
                <li class="hw_tab-button active">신랑</li>
                <li class="hw_tab-button">신부</li>
            </ul>

            <div class="hw_tab-button-content">
                <div class="hw_tab-content">
                    <span>이름 : 김철수1</span>
                    <span>유형 : 신부</span>
                    <span>번호 : 010-1234-1234</span>
                    <span>이메일 : aaaa@gmail.com</span>
                </div>
            </div>
            <div class="hw_tab-button-content show">
                <div class="hw_tab-content">
                    <span>이름 : 김철수2</span>
                    <span>유형 : 신부</span>
                    <span>번호 : 010-1234-1234</span>
                    <span>이메일 : aaaa@gmail.com</span>
                </div>
                <div class="hw_tab-content">
                    <span>이름 : 김철수2</span>
                    <span>유형 : 신부</span>
                    <span>번호 : 010-1234-1234</span>
                    <span>이메일 : aaaa@gmail.com</span>
                </div>
                <div class="hw_tab-content">
                    <span>이름 : 김철수2</span>
                    <span>유형 : 신부</span>
                    <span>번호 : 010-1234-1234</span>
                    <span>이메일 : aaaa@gmail.com</span>
                </div>
            </div>
            <div class="hw_tab-button-content">
                <div class="hw_tab-content">
                    <span>이름 : 김철수3</span>
                    <span>유형 : 신부</span>
                    <span>번호 : 010-1234-1234</span>
                    <span>이메일 : aaaa@gmail.com</span>
                </div>
            </div>
        </div>
    </div>
</form>
</body>
</html>