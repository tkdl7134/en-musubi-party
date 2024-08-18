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
<
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
                        <div>날짜 : ${w.w_date}</div>
                        <div>시간 : ${w.w_wedding_time}</div>
                        <div>주최자 : ${w.w_fam_jp_groom} ${w.w_name_jp_groom}
                            ♡ ${w.w_fam_jp_bride} ${w.w_name_jp_bride}</div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</c:forEach>
</div>
</body>
</html>
