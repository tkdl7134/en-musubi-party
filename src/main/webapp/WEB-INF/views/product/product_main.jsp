<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="../menubar.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <title>✿ ~ 縁結び ~ ✿</title>
    <!-- Noto Serif Japanese 폰트 적용 -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Noto+Serif+JP:wght@200..900&display=swap" rel="stylesheet"/>
    <%--  CSS --%>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css"/>
    <link rel="stylesheet" href="/css/product/swiper-slide-center.css" />
    <link rel="stylesheet" href="/css/product/product_main.css" />
    <%--  JS --%>
    <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
    <script src="/js/product/swiper-slide-center.js"></script>
</head>
<body>

<%-- content --%>
<div id="je_product-container">
    <div class="je_page-title">テンプレート一覧</div>
    <div class="je_page-content">
        <div class="slider">
            <div class="inner">
                <ul class="swiper-wrapper slide_list">
                    <c:forEach var="t" items="${templates}">
                        <li class="swiper-slide">
                            <div class="je_template-box">
                                <div class="je_template-preview" onclick="location.href='/product/${t.t_pk}'">
                                    <img src="/img/${t.t_preview}" alt="" />
                                </div>
                                <div class="je_template-title">${t.t_title}</div>
                            </div>
                        </li>
                    </c:forEach>
                </ul>
            </div>
            <!-- 양 옆 버튼 -->
            <div class="je_slider-buttons">
                <div class="je_slider-btn btn_prev">
                    <img src="/img/left-arrow-icon.png" alt="이젼" />
                </div>
                <div class="je_template-slide-paging fraction"></div>
                <div class="je_slider-btn btn_next">
                    <img src="/img/right-arrow-icon.png" alt="다음" />
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
