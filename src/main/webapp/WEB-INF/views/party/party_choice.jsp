<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">    <title>Title</title>

    <title>En-Party Choice</title>
    <link rel="preconnect" href="https://fonts.googleapis.com"/>
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin/>
    <link
            href="https://fonts.googleapis.com/css2?family=Noto+Serif+JP:wght@200..900&display=swap"
            rel="stylesheet"
    />
    <link rel="stylesheet" href="/css/party/party_choice.css"/>
</head>
<body>

<header>
    <div class="je_menu-header">
        <div class="je_logo-icon"><img src="/img/en-musubi-logo.png" alt="" /></div>
        <div>縁結び</div>
        <div class="je_menu-icon"><img src="/img/menu-button.png" alt="" /></div>
    </div>

</header>

<div class="yr_party_choice_container">

    <div class="yr_title">✿ ~ 縁結び ~ 縁パーティー ~ ✿</div>

    <div class="yr_party_wrapper">
        <div class="yr_choice">

            <c:if test="${not empty matchedCouples}">
                <c:forEach items="${matchedCouples}" var="couple">

<%--                    <c:choose>--%>
<%--                        <c:when test="${couple.user == 'test1'}">--%>
                            <div class="yr_list_choice">
                                <div class="yr_list_name_choice">
                                       <span style="color: #3F3F3F"> ${couple.partnerFamKanji}&nbsp ${couple.partnerNameKanji}</span>様と  <br />マッチングされました💗
                                </div>
                                <input id="partnerId" name="partnerId" value="${couple.partner}" type="hidden">
                                <button class="open-modal" > Line ID 交換</button>
                            </div>
<%--                        </c:when>--%>
<%--                    </c:choose>--%>
                </c:forEach>
            </c:if>

            <c:if test="${empty matchedCouples}">
                <div class="yr_list_choice" style="color: #696969">
                    マッチングした <br /> 縁がありません 😢
                </div>
            </c:if>

        </div>


        <!-- 모달 창 HTML -->
        <div id="lineIdModal" class="modal">
            <div class="modal-content">
                <span class="close">&times;</span>
                <h2>Line ID 交換</h2>
                <form id="lineIdForm">
                    <input type="text" id="lineId" name="ep_lineID" placeholder="Line ID" required>
                    <button type="submit">提出</button>
                </form>
            </div>
        </div>
        <div class="main-envelope">
            <div class="main-enParty-envelope">
                <div class="main-enParty-envelope-bottom"></div>
                <div class="main-enParty-envelope-paper"></div>
                <div class="main-enParty-envelope-text">
                    <p>
<%--                        <span style="color: #FF5A55; font-size: 16px;">✿</span>--%>

<%--                    <div>   <span style="color: #3F3F3F; font-size: 18px;">  </span></div>--%>

<%--                    <span style="color: #FF5A55; font-size: 16px;">✿</span>--%>
                    </p>
                </div>
                <div class="main-enParty-envelope-top"></div>
                <div class="main-enParty-envelope-logo-img">
                    <img src="/img/logo-img.png" alt="main-envelope-logo-img">
                </div>
            </div>
        </div>


    </div>
</div>


<script src="/js/party/party_choice.js"></script>
</body>
</html>