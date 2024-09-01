<%@ page contentType="text/html; charset=utf-8" %>
<%@ include file="../menubar.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, maximum-scale=1, user-scalable=no">
    <title>✿ ~ 縁結び ~ ✿</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/template/mytemplate.css">
    <script src="${pageContext.request.contextPath}/js/template/mytemplate.js" defer></script>
</head>
<body data-context-path="${pageContext.request.contextPath}">

<div class="je_page-title">招待状リスト</div>
<div class="hw_container">
    <c:forEach items="${allWeddingList}" var="w">
        <div class="hw_card">
            <div class="card">
                <div class="card-inner">
                    <div class="image-container">
<%--                        <img src="${pageContext.request.contextPath}/img/Test1.jpg" alt="Template 1">--%>
    <img src="https://firebasestorage.googleapis.com/v0/b/enmusubi-8f0dc.appspot.com/o/upload%2F${w.w_img1}?alt=media" alt="" />

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
<script>
    shareButtons.forEach(button => {
        button.addEventListener("click", function () {
            const url = this.getAttribute("data-url");
            shareUrlInput.value = url;

            // 버튼 색상 변경
            this.classList.toggle("active");

            // image-container 명암 효과 적용
            const imageContainer = this.closest(".card").querySelector(".image-container");
            imageContainer.classList.add("darken");

            // 3초 후에 명암 효과 제거
            setTimeout(() => {
                imageContainer.classList.remove("darken");
            }, 3000);

            sharePopup.style.display = "block";
        });
    });

</script>
</html>
