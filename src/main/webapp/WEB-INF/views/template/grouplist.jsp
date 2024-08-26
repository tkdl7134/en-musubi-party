<%@ page contentType="text/html; charset=utf-8" %>
<%@ include file="../menubar.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <title> ✿ ~ 縁結び ~ ✿ </title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/template/grouplist.css">
    <script src="${pageContext.request.contextPath}/resources/js/template/grouplist.js" defer></script>
</head>
<body>
<div class="je_page-title">会リスト</div>
<div class="hw_container">
    <c:forEach items="${allGuestList}" var="g" varStatus="status">
        <c:if test="${status.index % 3 == 0}">
            <div class="hw_card">
        </c:if>

        <div class="card-inner">
            <div class="card-front">
                <div class="image-container">
                    <img src="${pageContext.request.contextPath}/resources/img/Test1.jpg" alt="Template 1">
                        <%-- <img src="${pageContext.request.contextPath}/resources/img/${g.w_img1}" alt="Template 1"> --%>
                </div>
            </div>
            <div class="card-back">
                <div><span style="color: red">✿</span>${g.m_fam_kanji} ${g.m_name_kanji}<span style="color: red">✿</span></div>
                <div>${g.w_date}</div>
                <div>${g.w_wedding_address}</div>
            </div>
        </div>

        <c:if test="${status.index % 3 == 2 || status.last}">
            <!-- 데이터가 1~2개일 경우 빈 카드 추가 -->
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
        <span class="indicator active"></span>
        <span class="indicator"></span>
        <span class="indicator"></span>
    </div>
</div>


</body>
</html>
