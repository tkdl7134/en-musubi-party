<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>会リスト</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/template/grouplist.css">
    <script src="${pageContext.request.contextPath}/resources/js/template/grouplist.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
<header class="hw_header">
    <div class="menubar">메뉴바</div>
    <div class="hw_maker">会リスト</div>
</header>
<div class="hw_container">
    <c:forEach items="${allGuestList}" var="g" varStatus="status">
        <c:if test="${status.index % 3 == 0}">
            <div class="hw_card">
        </c:if>

        <div class="card-inner">
            <div class="card-front">
                <div class="red">
                    <div class="yellow">
                        <div class="image-container">
                            <img src="${pageContext.request.contextPath}/resources/img/Template1.jpg"
                                 alt="Template ${status.index + 1}">
                        </div>
                    </div>
                </div>
            </div>
            <div class="card-back">
                <div>✿${g.m_fam_kanji} ${g.m_name_kanji}✿</div>
                <div>${g.w_date}</div>
                <div>${g.w_wedding_address}</div>


            </div>
        </div>

        <c:if test="${status.index % 3 == 2 || status.last}">
            </div>
        </c:if>
    </c:forEach>
</div>

<!-- 슬라이드 인디케이터 -->
<div class="slider-indicators">
    <span class="indicator active"></span>
    <span class="indicator"></span>
    <span class="indicator"></span>
</div>

</body>
</html>
