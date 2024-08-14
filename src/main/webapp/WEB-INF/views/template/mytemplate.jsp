<%@ page contentType="text/html; charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/template/mytemplate.css">
    <script src="/resources/js/template/mytemplate.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
<header class="hw_header">
    <a class="hw_logo" href=""><img src="/resources/img/logo.png" alt=""></a>
    <div class="hw_maker">縁結び</div>
    <a class="hw_mypage" href=""></a>
</header>
<div class="hw_container">
    <c:forEach items="${weddingList}" var="w">
        <div class="hw_content">
            <div class="hw_card">
                <div class="card">
                    <div class="card-inner">
                        <div class="card-front">
                            <img src="${w.w_img1}" alt="Template 1">
                        </div>
                        <div class="card-back">
                            <button type="button" onclick="navigateToTemplate(${w.e_no})">
                                <img src="/resources/img/free-icon-reunion.png" alt="Group Icon">
                            </button>
                            <span>テンプレート</span>
                        </div>
                    </div>
                </div>
                <div class="card">
                    <div class="card-inner">
                        <div class="card-front">
                            <img src="${w.w_img2}" alt="Template 2">
                        </div>
                        <div class="card-back">
                            <button type="button" onclick="navigateToSurvey(${w.e_no})">
                                <img src="/resources/img/free-icon-checklist.png" alt="Guest Icon">
                            </button>
                            <span>アンケート</span>
                        </div>
                    </div>
                </div>
                <div class="card">
                    <div class="card-inner">
                        <div class="card-front">
                            <img src="${w.w_img3}" alt="Template 3">
                        </div>
                        <div class="card-back">
                            <button type="button" onclick="navigateToStatistics(${w.e_no})">
                                <img src="/resources/img/free-icon-line-chart.png" alt="Graph Icon">
                            </button>
                            <span>通計</span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="line-button">
                <button type="button" onclick="navigateToShare(${w.e_no})">
                    <img src="/resources/img/free-icon-line.png" alt="line Icon">
                </button>
            </div>
        </div>
    </c:forEach>
</div>
</body>
</html>
