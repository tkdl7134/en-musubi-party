<%@ page contentType="text/html; charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html style="zoom : 100% !important;" lang="en">

<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/template/guestb.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="/resources/js/template/guestb.js"></script>
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
                <option value="" disabled selected>参加者情報</option>
                <option value="/mypage/guest">参加者</option>
                <option value="/mypage/guestC">欠席者</option>
            </select>
        </div>

        <!-- 탭 콘텐츠 -->
        <div class="hw_content">
            <ul class="hw_list">
                <li class="hw_tab-button active" data-filter="all">全体</li>
                <li class="hw_tab-button" data-filter="新郎">新郎</li>
                <li class="hw_tab-button" data-filter="新婦">新婦</li>
            </ul>

            <div id="guest-list" class="hw_tab-button-content">
                <c:forEach items="${guestList}" var="guest">
                    <div class="hw_tab-content" data-type="${guest.g_guest_type}">
                        <span>이름 : ${guest.m_fam_kanji}${guest.m_name_kanji}</span>
                        <span>동반인수 : ${guest.p_accompany_num}</span>
                        <span>알레르기 : ${guest.allergy}</span>
                        <span>요청내용 : ${guest.g_relation_detail}</span>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</form>
</body>
</html>