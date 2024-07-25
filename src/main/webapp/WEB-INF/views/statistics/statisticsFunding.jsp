<%@ page contentType="text/html; charset=utf-8" %>
<!DOCTYPE html>
<html lang="en">
<link rel="stylesheet" href="/resources/css/statistics/statistics.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+JP:wght@200..900&display=swap" rel="stylesheet">
<script src="/resources/js/statistics/statistics.js" defer></script>
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <style>
        body {
            width: 100vw;
            height: 100vh;
            margin: 0;
            background-color: #FFFBF7;
            font-family: "Noto Serif JP", serif;
            font-optical-sizing: auto;
            font-weight: bold;
            font-style: normal;
        }

        .container {
            width: 100%;
            max-width: 1200px;
            margin: 0 auto;
        }

        .desktop, .tablet, .mobile {
            display: none;
        }

        @media (min-width: 1024px) {
            .desktop {
                display: block;
            }
        }

        @media (min-width: 768px) and (max-width: 1023px) {
            .tablet {
                display: block;
            }
        }

        @media (max-width: 767px) {
            .mobile {

                display: block;

            }
        }
    </style>
</head>
<body>
<div class="container">
    <div class="desktop">
        <h1>Desktop Layout</h1>
        <p>This is a layout for desktop screens.</p>
    </div>
    <div class="tablet">
        <h1>Tablet Layout</h1>
        <p>This is a layout for tablet screens.</p>
    </div>
    <div id="jh_top" class="mobile">
        <div class="jh_navigation" style="">
            <div>縁結び</div>
            <div><img src="" alt="aa"></div>
        </div>
        <div class="jh_title" style="  ">
            <div class="jh_titleName" style="  ">通計ページ</div>
            <div><img style="width: 100vw; margin-top: 2rem" src="/resources/imgFolder/footer.png" alt=""></div>
        </div>
        <div class="jh_pageNavigation" style="">
            <div style="color: red">ファンディング</div>
            <div class="jh_pageNavigationA"><a>ご祝儀</a></div>
        </div>
        <div id="jh_top_button"><img onclick="goToTop()" style="width: 10vh; height: 10vh; position: fixed;
    right: 1rem; z-index: 100;
    bottom: 1rem;" src="/resources/imgFolder/top_button.png" alt=""></div>


    </div>
</div>


</body>
</html>