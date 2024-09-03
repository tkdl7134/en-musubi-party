<%@ page contentType="text/html; charset=utf-8" %>
<%@ include file="../menubar.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <link rel="icon" type="image/png" href="/img/favicon.png">
    <title> ✿ ~ 縁結び ~ ✿ </title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/template/grouplist.css">

    <script src="/js/template/grouplist.js" defer></script>

</head>
<body>
<div class="je_page-title">参加リスト</div>
<div class="hw_container">
    <c:forEach items="${allGuestList}" var="g" varStatus="status">

        <c:if test="${status.index % 3 == 0}">
            <div class="hw_card">
        </c:if>

        <div class="card-inner">
            <div class="card-front">
                <div class="image-container">
                    <c:choose>
                        <c:when test="${status.index % 3 == 0}">
                            <div style="width: 100%; height: 100%; position: absolute; z-index: 999"></div>
                            <img src="/img/template1.jpg" alt="Party Image">
                        </c:when>
                        <c:when test="${status.index % 3 == 1}">
                            <div style="width: 100%; height: 100%; position: absolute; z-index: 999"></div>
                            <img src="/img/template2.jpg" alt="Party Image">
                        </c:when>
                        <c:when test="${status.index % 3 == 2}">
                            <div style="width: 100%; height: 100%; position: absolute; z-index: 999"></div>
                            <img src="/img/template3.jpg" alt="Party Image">
                        </c:when>
                    </c:choose>
                </div>
            </div>
            <div class="card-back">
                <div><span style="color: red">✿</span> ${g.w_fam_jp_groom} ${g.w_name_jp_groom} &nbsp; ˑ
                    &nbsp; ${g.w_fam_jp_bride} ${g.w_name_jp_bride} <span style="color: red">✿</span></div>
                <div>${g.w_date}</div>
                <div>${g.w_wedding_address}</div>
            </div>
        </div>

        <c:if test="${status.index % 3 == 2 || status.last}">
            <c:if test="${status.index % 3 == 0}">
                <div class="card-inner empty-card"></div>
                <div class="card-inner empty-card"></div>
            </c:if>
            <c:if test="${status.index % 3 == 1}">
                <div class="card-inner empty-card"></div>
            </c:if>
            </div>
        </c:if>
    </c:forEach>


    <div class="slider-indicators">
        <c:choose>
            <c:when test="${fn:length(allGuestList) % 3 == 0}">

                <c:forEach var="i" begin="0" end="${fn:length(allGuestList) / 3 - 1}">
                    <span class="indicator ${i == 0 ? 'active' : ''}"></span>
                </c:forEach>
            </c:when>
            <c:otherwise>

                <c:forEach var="i" begin="0" end="${fn:length(allGuestList) / 3}">
                    <span class="indicator ${i == 0 ? 'active' : ''}"></span>
                </c:forEach>
            </c:otherwise>
        </c:choose>
    </div>
</div>


</body>
</html>
