<%@ page contentType="text/html; charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html style="zoom : 100% !important;" lang="en">

<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/template/guestC.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="/resources/js/template/guestc.js"></script>
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
                <option value="" disabled selected>欠席者</option>
                <option value="/mypage/guest">参加者</option>
                <option value="/mypage/guestB">参加者情報</option>
            </select>
        </div>

        <!-- 탭 콘텐츠 -->
        <div class="hw_content">
            <ul class="hw_list">
                <li class="hw_tab-button active" data-filter="all">全体</li>
                <li class="hw_tab-button" data-filter="新郎">新郎</li>
                <li class="hw_tab-button" data-filter="新婦">新婦</li>
            </ul>

            <div class="hw_tab-button-content">
                <c:forEach items="${attendList}" var="attend">
                    <c:if test="${attend.g_attend_wedding == '欠席'}">
                        <div class="hw_tab-content" data-type="${attend.g_guest_type}">
                            <span>이름 : ${attend.m_fam_kanji} ${attend.m_name_kanji}</span>
                            <span>유형 : ${attend.g_guest_type}</span>
                            <span>번호 : ${attend.m_phone}</span>
                            <span>이메일 : ${attend.m_email}</span>
                        </div>
                    </c:if>
                </c:forEach>
            </div>
        </div>
    </div>
</form>
</body>
</html>
