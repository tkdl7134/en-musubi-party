
<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html lang="en">
<link rel="stylesheet" href="/resources/css/statistics/statistics.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+JP:wght@200..900&display=swap" rel="stylesheet">

<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <style>
        body {
            width: 375px;
            height: 812px;
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
        <div class="mobile">
    <div style="height: 56px; background-color: #FFD1D0; display: flex; justify-content: space-around; align-items: center">
        <div>enmusubi</div>
        <div><img src="" alt="aa"></div>
    </div>
    <div style=" transform: translateX(60px); border: 1px solid black; border-radius: 20px; width: 233px; height: 75px; background-color: #FFFBF7">
      <div style=" text-align: center; margin-top: 25px; ">통계페이지</div>
    </div>
    <div>
        <div>펀딩</div>
        <div>송금</div>
    </div>






        </div>
    </div>



</body>
</html>