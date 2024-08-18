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

        <!-- 드롭다운 메뉴 -->
        <div class="dropdown">
            <select id="dropdown-select" class="dropbtn">
                <option value="" disabled selected>出席者情報</option>
                <option value="/mypage/guest">出席者</option>
                <option value="/mypage/guestC">欠席者</option>
            </select>
        </div>

        <!-- 필터 입력 필드 -->
        <input type="text" id="filter-input" placeholder="필터 텍스트 입력">

        <!-- 탭 콘텐츠 -->
        <div class="hw_content">
            <ul class="hw_list">
                <li class="hw_tab-button active" data-filter="all">全体</li>
                <li class="hw_tab-button" data-filter="新郎">新郎</li>
                <li class="hw_tab-button" data-filter="新婦">新婦</li>
            </ul>

            <div class="hw_tab-button-content">
                <c:forEach items="${guestDetailList}" var="g">
                    <c:if test="${g.g_attend_wedding == 'ご出席' && g.g_allergy_or == 'Yes'}">
                        <div class="hw_tab-content" data-type="${g.g_guest_type}">
                            <span>이름 : ${g.m_fam_kanji} ${g.m_name_kanji}</span>
                            <span>유형 : ${g.g_guest_type}</span>
                            <span>참석 여부 : ${g.g_attend_wedding}</span>
                            <span>알레르기 여부 : ${g.g_allergy_or}</span>
                        </div>
                    </c:if>
                </c:forEach>
            </div>
        </div>
    </div>
</form>
</body>
</html>
