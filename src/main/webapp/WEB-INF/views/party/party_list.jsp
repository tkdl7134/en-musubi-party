<%@ page contentType="text/html; charset=utf-8" %>
<%@ include file="../menubar.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <link rel="icon" type="image/png" href="/img/favicon.png">

    <title>✿ ~ 縁結び ~ 縁パーティー ~ ✿</title>
    <link rel="stylesheet" href="/css/party/party_list.css">
    <link rel="stylesheet" href="/css/menubar.css">

    <script src="/js/party/party_list.js" defer></script>
    <script src="/js/menubar.js" defer></script>
</head>

<body>

<div class="je_page-title">縁パーティー リスト</div>

<div class="hw_container">
    <c:forEach items="${partyList}" var="pl" varStatus="status">

        <!-- 첫 번째 카드일 때 hw_card 시작 -->
        <c:if test="${status.index % 3 == 0}">
            <div class="hw_card">
        </c:if>

        <!-- 카드 콘텐츠 -->
        <div class="card-inner">
            <div class="card-front">
                <div class="image-container" style="position: relative;">
                    <c:choose>
                        <c:when test="${status.index % 3 == 0}">
                            <div style="width: 100%; height: 100%; position: absolute; z-index: 999"></div>
                            <img src="/img/en1.jpg" alt="Party Image">
                        </c:when>
                        <c:when test="${status.index % 3 == 1}">
                            <div style="width: 100%; height: 100%; position: absolute; z-index: 999"></div>
                            <img src="/img/en2.jpg" alt="Party Image">
                        </c:when>
                        <c:when test="${status.index % 3 == 2}">
                            <div style="width: 100%; height: 100%; position: absolute; z-index: 999"></div>
                            <img src="/img/en3.jpg" alt="Party Image">
                        </c:when>
                    </c:choose>
                </div>
            </div>
            <div class="card-back">
                <div style="color: #3F3F3F">
                    <span style="color: red">✿ </span>${pl.w_fam_jp_groom} ${pl.w_name_jp_groom} &nbsp; ˑ &nbsp; ${pl.w_fam_jp_bride} ${pl.w_name_jp_bride}<span style="color: red"> ✿</span>
                </div>
                <div style="color: #505050; margin-top: 0.3rem;">${pl.w_date} ${pl.w_wedding_time}</div>
                <div style="color: #505050; font-size: 0.8rem; margin-top: 0.5rem;" >${pl.w_wedding_address}</div>
                <div style="color: #505050">${pl.w_wedding_building}</div>
                <button onclick="location.href='/party/info/${pl.e_no}'">よく見る</button>
            </div>
        </div>

        <!-- 세 번째 카드이거나 마지막 카드일 때 hw_card 닫기 -->
        <c:if test="${status.index % 3 == 2 || status.last}">
            </div>
        </c:if>

    </c:forEach>

    <!-- 슬라이더 인디케이터 -->
    <div class="slider-indicators">
        <c:choose>
            <c:when test="${fn:length(partyList) % 3 == 0}">

                <c:forEach var="i" begin="0" end="${fn:length(partyList) / 3 - 1}">
                    <span class="indicator ${i == 0 ? 'active' : ''}"></span>
                </c:forEach>
            </c:when>
            <c:otherwise>

                <c:forEach var="i" begin="0" end="${fn:length(partyList) / 3}">
                    <span class="indicator ${i == 0 ? 'active' : ''}"></span>
                </c:forEach>
            </c:otherwise>
        </c:choose>
    </div>
</div>

</body>
</html>
