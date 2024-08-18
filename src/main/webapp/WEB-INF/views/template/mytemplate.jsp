<%@ page contentType="text/html; charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>招待状リスト</title>
    <link rel="stylesheet" href="/resources/css/template/mytemplate.css">
    <script src="/resources/js/template/mytemplate.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>

<header class="hw_header">
    <div class="menubar">메뉴바</div>
    <div class="hw_maker">招待状リスト</div>
</header>
<div class="hw_container">
    <c:forEach items="${weddingList}" var="w">
        <div class="hw_card">
            <div class="card">
                <div class="card-inner">
                    <div class="image-container">
<%--                        <img src="${w.w_img1}" alt="Template 1">--%>
<%--                        <img src="/resources/img/Template1.jpg" alt="Template 1">--%>
    <p>Stored Path: ${w.w_img1}</p>
    <img src="${pageContext.request.contextPath}/resources/${w.w_img1}" alt="Template 1">
    <button class="share-button" type="button" onclick="navigateToShare(${w.e_no})">
                            <span>共有</span>
                        </button>
                    </div>
                    <div class="card-back">
                        <button type="button" onclick="navigateToTemplate(${w.e_no})">
                            <span>プレビュー</span>
                        </button>
                        <button type="button" onclick="navigateToSurvey(${w.e_no})">
                            <span>アンケート</span>
                        </button>
                        <button type="button" onclick="navigateToStatistics(${w.e_no})">
                            <span>通計</span>
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </c:forEach>
</div>
</body>
</html>
