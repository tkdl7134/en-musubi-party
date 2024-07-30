<%@ page contentType="text/html; charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/template/grouplist.css">
    <script src="/resources/js/template/grouplist.js"></script>
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
        <c:forEach var="template" items="${templates}">
            <div class="hw_card">
                <div class="hw_content">
                    <div class="hw_mytemplate-img"><img src="${template.img1}" alt=""></div>
                    <a>img1</a>
                    <div class="hw_mytemplate-img"><img src="${template.img2}" alt=""></div>
                    <a>img2</a>
                    <div class="hw_mytemplate-img"><img src="${template.img3}" alt=""></div>
                    <a>img3</a>
                </div>
                <div class="hw_mytemplate-button-container">
                    <div class="hw_weddingInfo">
                        <div><span>${template.w_fam_jp_groom},${template.w_name_jp_groom}</span></div>
                        <div><span>${template.w_fam_jp_bride},${template.w_name_jp_bride}</span></div>
                        <div><span>${template.w_fam_jp_bride},${template.w_name_jp_bride}</span></div>
                        <div><span>${template.w_date},${template.w_wedding_time}</span></div>
                        <div><span>${template.w_wedding_address},${template.w_wedding_building}</span></div>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</form>
</body>
</html>
