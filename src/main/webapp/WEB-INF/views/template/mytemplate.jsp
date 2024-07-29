<%@ page contentType="text/html; charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/mytemplate.css">
    <script src="/resources/js/mytemplate.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
<header class="hw_header">
    <a class="hw_logo" href=""></a>
    <div class="hw_maker">縁結び</div>
    <a class="hw_mypage" href=""></a>
</header>
<div class="hw_title"> - テンプレート管理 -</div>
<div><img src="" alt=""></div>
<form>
    <div class="hw_container">
<%--        <c:forEach var="template" items="${templates}">--%>
            <div class="hw_card">
                <div class="hw_content">
                    <div class="hw_mytemplate-img"><img src="${template.img1}" alt=""></div>
                    <div class="hw_mytemplate-img"><img src="${template.img2}" alt=""></div>
                    <div class="hw_mytemplate-img"><img src="${template.img3}" alt=""></div>
                </div>
                <div class="hw_mytemplate-button">
                    <div class="hw_button" onclick="">
                        <button><img src="/resources/ImgFolder/graph.png" alt="">テンプレート</button>
                    </div>
                    <div class="hw_button" onclick="">
                        <button><a href="${template.link}"></a>アンケート</button>
                    </div>
                    <div class="hw_button" onclick="">
                        <button><img src="" alt="">通計</button>
                    </div>
                    <div class="hw_button" onclick="">
                        <button><img src="" alt="">line</button>
                    </div>
                </div>
            </div>
<%--        </c:forEach>--%>
    </div>
</form>
</body>
</html>
