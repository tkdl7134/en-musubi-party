<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Wedding List</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/template/grouplist.css">
    <script src="${pageContext.request.contextPath}/resources/js/template/grouplist.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
<div>
    <header class="hw_header">
        <a class="hw_logo" href="#"><img src="${pageContext.request.contextPath}/resources/img/logo.png" alt="Logo"></a>
        <div class="hw_maker">縁結び</div>
        <a class="hw_mypage" href="#"></a>
    </header>
    <div class="hw_container">
        <div class="hw_title"> - 会リスト -</div>
        <div class="hw_titleline"><img src="${pageContext.request.contextPath}/resources/img/title.png" alt="Title Image"></div>

        <c:forEach items="${weddingList}" var="w">
            <div class="hw_card">
                <div class="hw_content">
                    <div><img src="${w.w_img1}" alt="Wedding Image 1"></div>
                    <div><img src="${w.w_img2}" alt="Wedding Image 2"></div>
                    <div><img src="${w.w_img3}" alt="Wedding Image 3"></div>
                </div>
                <div class="hw_mytemplate-list-container">
                    <div>날짜 : ${w.w_date}</div>
                    <div>주최자 : ${w.w_fam_jp_groom} ${w.w_name_jp_groom} ♡ ${w.w_fam_jp_bride} ${w.w_name_jp_bride}</div>
                    <div>시간 : ${w.w_wedding_time}</div>
                    <div>주소 : ${w.w_wedding_address}</div>
                    <div>건물명 : ${w.w_wedding_building}</div>
                </div>
            </div>
        </c:forEach>

        <!-- Static Example Card -->
        <div class="hw_card">
            <div class="hw_content">
                <div><img src="${pageContext.request.contextPath}/resources/img/template1.jpg" alt="Template 1"></div>
                <div><img src="${pageContext.request.contextPath}/resources/img/template2.jpg" alt="Template 2"></div>
                <div><img src="${pageContext.request.contextPath}/resources/img/template3.jpg" alt="Template 3"></div>
            </div>
            <div class="hw_mytemplate-list-container">
                <div>날짜 : 2024.09.13</div>
                <div>주최자 : 철수 ♡ 유리</div>
                <div>시간 : 오전 11시 30분</div>
                <div>장소 : 결혼식장</div>
            </div>
        </div>

    </div>
</div>
</body>
</html>
