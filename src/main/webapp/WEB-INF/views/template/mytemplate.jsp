<%@ page contentType="text/html; charset=utf-8" %>
<%@ include file="../menubar.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <title>✿ ~ 縁結び ~ ✿</title>
    <link rel="stylesheet" href="/css/template/mytemplate.css">
    <script src="/js/template/mytemplate.js" defer></script>
</head>
<body data-context-path="${pageContext.request.contextPath}">

<div class="je_page-title">招待状リスト</div>
<div class="hw_container">
    <c:forEach items="${allWeddingList}" var="w">
        <div class="hw_card">
            <div class="card">
                <div class="card-inner">
                    <div class="image-container">
                        <img src="${pageContext.request.contextPath}/img/Test1.jpg" alt="Template 1">
<%--                        <img src="${pageContext.request.contextPath}/img/Test2.jpg" alt="Template 2">--%>
<%--                        <img src="${pageContext.request.contextPath}/img/${w.w_img1}" alt="Template 1">--%>

                        <button class="share-button" type="button" data-url="http://localhost${pageContext.request.contextPath}/invitation/${w.e_no}">
                            <span>共有</span>
                        </button>
                    </div>
                    <div class="card-back">
                        <button type="button" onclick="location.href='/product/invitation-preview/${w.e_no}'">
                            <span>プレビュー</span>
                        </button>
                        <button type="button" onclick="location.href='/mypage/allguest?e_no=${w.e_no}'">
                            <span>アンケート</span>
                        </button>
                        <button type="button" onclick="window.location.href='http://localhost/statistics/funding?e_no=${w.e_no}'">
                            <span>通計</span>
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </c:forEach>
</div>

<div class="slider-indicators">
    <span class="indicator active"></span>
    <span class="indicator"></span>
    <span class="indicator"></span>
</div>

<div id="share-popup" class="share-popup">
    <div class="share-popup-content">
        <span id="close-popup" class="close-popup">&times;</span>
        <p>招待状を共有</p>
        <input type="text" id="share-url" readonly>
        <button id="copy-button">URLをコピー</button>
    </div>
</div>

</body>
</html>
