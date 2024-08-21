<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>✿ ~ 縁結び ~ ✿</title>
    <link rel="stylesheet" href="/resources/css/template/mytemplate.css">
    <script src="/resources/js/template/mytemplate.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body data-context-path="${pageContext.request.contextPath}">

<header class="hw_header">
    <div class="menubar"><img src="/resources/img/logo.png" alt=""> <img src="/resources/img/Menu.png" alt=""></div>
    <div class="hw_maker">招待状リスト</div>
</header>
<div class="hw_container">
    <c:forEach items="${weddingList}" var="w">
        <div class="hw_card">
            <div class="card">
                <div class="card-inner">
                    <div class="image-container">
                        <img src="${pageContext.request.contextPath}/resources/img/Template1.jpg" alt="Template 1">
                        <button class="share-button" type="button" onclick="navigateToShare(${w.e_no})">
                            <span>共有</span>
                        </button>
                    </div>
                    <div class="card-back">
                        <button type="button" onclick="window.location.href='http://localhost/mypage/grouplist?e_no=${w.e_no}'">
                            <span>プレビュー</span>
                        </button>
                        <button type="button" onclick="window.location.href='http://localhost/mypage/allguest?e_no=${w.e_no}'">
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

<script>
    document.addEventListener("DOMContentLoaded", function () {
        const contextPath = document.body.getAttribute("data-context-path");

        const shareButtons = document.querySelectorAll(".share-button");

        shareButtons.forEach(button => {
            button.addEventListener("click", function () {
                button.classList.toggle("active");
                const imageContainer = button.closest(".image-container");
                imageContainer.classList.toggle("active");
            });
        });
    });
</script>

</body>
</html>
