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
    <div class="hw_title"> - テンプレート管理 -</div>
    <div class="hw_titleline"><img src="/resources/img/title.png" alt=""></div>

    <div class="hw_card">
        <div class="hw_content">
            <div><img src="/resources/img/template1.jpg" alt=""></div>
            <div><img src="/resources/img/template2.jpg" alt=""></div>
            <div><img src="/resources/img/template3.jpg" alt=""></div>
        </div>
        <div class="hw_mytemplate-button-container">
            <div class="hw_button">
                <button type="button" onclick="navigateToTemplate(${w.e_no})"><img
                        src="/resources/img/free-icon-reunion.png" alt="Group Icon">テンプレート
                </button>
            </div>
            <div class="hw_button">
                <button type="button" onclick="navigateToSurvey(${w.e_no})"><img
                        src="/resources/img/free-icon-checklist.png" alt="Guest Icon">アンケート
                </button>
            </div>
            <div class="hw_button">
                <button type="button" onclick="navigateToStatistics(${w.e_no})"><img
                        src="/resources/img/free-icon-line-chart.png" alt="Graph Icon">通計
                </button>
            </div>
            <div class="hw_button">
                <button type="button" onclick="navigateToLine(${w.e_no})"><img
                        src="/resources/img/free-icon-line.png" alt="Line Icon">line
                </button>
            </div>
        </div>
        <div class="hw_content">
            <div><img src="/resources/img/template1.jpg" alt=""></div>
            <div><img src="/resources/img/template2.jpg" alt=""></div>
            <div><img src="/resources/img/template3.jpg" alt=""></div>
        </div>
        <div class="hw_mytemplate-button-container">
            <div class="hw_button">
                <button type="button" onclick="navigateToTemplate(${w.e_no})"><img
                        src="/resources/img/free-icon-reunion.png" alt="Group Icon">テンプレート
                </button>
            </div>
            <div class="hw_button">
                <button type="button" onclick="navigateToSurvey(${w.e_no})"><img
                        src="/resources/img/free-icon-checklist.png" alt="Guest Icon">アンケート
                </button>
            </div>
            <div class="hw_button">
                <button type="button" onclick="navigateToStatistics(${w.e_no})"><img
                        src="/resources/img/free-icon-line-chart.png" alt="Graph Icon">通計
                </button>
            </div>
            <div class="hw_button">
                <button type="button" onclick="navigateToLine(${w.e_no})"><img
                        src="/resources/img/free-icon-line.png" alt="Line Icon">line
                </button>
            </div>
        </div>
    </div>
    <div class="hw_card">
        <div class="hw_content">
            <div><img src="/resources/img/template1.jpg" alt=""></div>
            <div><img src="/resources/img/template2.jpg" alt=""></div>
            <div><img src="/resources/img/template3.jpg" alt=""></div>
        </div>
        <div class="hw_mytemplate-button-container">
            <div class="hw_button">
                <button type="button" onclick="navigateToTemplate(${w.e_no})"><img
                        src="/resources/img/free-icon-reunion.png" alt="Group Icon">テンプレート
                </button>
            </div>
            <div class="hw_button">
                <button type="button" onclick="navigateToSurvey(${w.e_no})"><img
                        src="/resources/img/free-icon-checklist.png" alt="Guest Icon">アンケート
                </button>
            </div>
            <div class="hw_button">
                <button type="button" onclick="navigateToStatistics(${w.e_no})"><img
                        src="/resources/img/free-icon-line-chart.png" alt="Graph Icon">通計
                </button>
            </div>
            <div class="hw_button">
                <button type="button" onclick="navigateToLine(${w.e_no})"><img
                        src="/resources/img/free-icon-line.png" alt="Line Icon">line
                </button>
            </div>
        </div>
    </div>
    <div class="hw_card">
        <div class="hw_content">
            <c:forEach items="${weddingList}" var="w">
                <div>${w.w_img1}</div>
                <div>${w.w_img2}</div>
                <div>${w.w_img3}</div>
            </c:forEach> <!-- 반복문 닫기 -->
        </div>
        <div class="hw_mytemplate-button-container">
            <c:forEach items="${weddingList}" var="w">
                <div class="hw_button">
                    <button type="button" onclick="navigateToTemplate(${w.e_no})"><img
                            src="/resources/img/free-icon-reunion.png" alt="Group Icon">テンプレート
                    </button>
                </div>
                <div class="hw_button">
                    <button type="button" onclick="navigateToSurvey(${w.e_no})"><img
                            src="/resources/img/free-icon-checklist.png" alt="Guest Icon">アンケート
                    </button>
                </div>
                <div class="hw_button">
                    <button type="button" onclick="navigateToStatistics(${w.e_no})"><img
                            src="/resources/img/free-icon-line-chart.png" alt="Graph Icon">通計
                    </button>
                </div>
                <div class="hw_button">
                    <button type="button" onclick="navigateToLine(${w.e_no})"><img
                            src="/resources/img/free-icon-line.png" alt="Line Icon">line
                    </button>
                </div>
            </c:forEach>
        </div>
    </div>

</div>
</form>
</body>
</html>
