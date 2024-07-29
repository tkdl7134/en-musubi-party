<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>テンプレート一覧</title>
    <!-- Noto Serif Japanese 폰트 적용 -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Noto+Serif+JP:wght@200..900&display=swap" rel="stylesheet"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css"/>
    <link rel="stylesheet" href="/resources/css/product/swiper-slide-center.css" />
    <link rel="stylesheet" href="/resources/css/product/product.css" />
    <script src="https://code.jquery.com/jquery-3.7.1.slim.js" integrity="sha256-UgvvN8vBkgO0luPSUl2s8TIlOSYRoGFAX4jlCIm9Adc=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
    <script src="/resources/js/product/swiper-slide-center.js"></script>
</head>
<body>
<div id="je_product-container">
    <div class="je_menu-bar">
        <div id="je_logo"><img src="/resources/img/en-musubi-logo.png" alt="" /></div>
    </div>
    <div class="je_page-title">
        <div class="je_page-title-txt">テンプレート一覧</div>
        <div class="je_page-title-line">
            <img src="/resources/img/page-title-line.png" alt="" />
        </div>
    </div>
    <div class="je_page-content">
        <div class="slider">
            <div class="inner">
                <ul class="swiper-wrapper slide_list">
                    <c:forEach var="t" items="${templates}">
                        <li class="swiper-slide">
                            <div class="je_template-box">
                                <div class="je_template-preview">
                                    <img src="/resources/img/${t.t_preview}" alt="" />
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
                    <img src="/resources/img/left-arrow-icon.png" alt="이젼" />
                </div>
                <div class="je_template-slide-paging fraction"></div>
                <div class="je_slider-btn btn_next">
                    <img src="/resources/img/right-arrow-icon.png" alt="다음" />
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
