<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../menubar.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <link rel="icon" type="image/png" href="/img/favicon.png">
    <title>✿ ~ 縁結び ~ 縁パーティー ~ ✿</title>
    <link rel="preconnect" href="https://fonts.googleapis.com"/>
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin/>
    <link
            href="https://fonts.googleapis.com/css2?family=Noto+Serif+JP:wght@200..900&display=swap"
            rel="stylesheet"
    />
    <link rel="stylesheet" href="/css/party/party_choice.css"/>
    <script src="/js/menubar.js" defer></script>
</head>
<body>

<div id="loadingScreen">
    <div class="lds-circle"><img src="/img/en-musubi-logo.png"></div>
</div>


<div class="yr_party_choice_container">

    <div class="yr_title">マッチング</div>

    <div class="yr_party_wrapper">
        <div class="yr_choice">

            <c:if test="${not empty matchedCouples}">
                <c:forEach items="${matchedCouples}" var="couple">

<%--                    <c:choose>--%>
<%--                        <c:when test="${couple.user == 'test1'}">--%>
                            <div class="yr_list_choice">
                                <img class="yr_list_choice_img" src="/img/red-line-musubi.png">
                                <div class="yr_list_name_choice">
                                    <span style="color: #FF5A55; font-size: 16px;">✿ </span>${couple.partnerFamKanji}&nbsp ${couple.partnerNameKanji} <span style="color: #FF5A55; font-size: 16px;">✿</span>様と  <br />マッチング成功❣️
                                </div>
                                <input id="partnerID" name="partnerID" value="${couple.partner}" type="hidden">
                                <button class="yr_line_id_exchange">Line ID 送信</button>
                                <form id="lineIdForm">
                                    <input type="text" id="lineId" name="ep_lineID" placeholder="Line ID" required>
                                    <button type="submit"><img src="/img/send-package.png"></button>
                                </form>
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
<%--        <div id="lineIdModal" class="modal">--%>
<%--            <div class="modal-content">--%>
<%--                <span class="close">&times;</span>--%>
<%--                <h2>Line ID 交換</h2>--%>
<%--                <form id="lineIdForm">--%>
<%--                    <input type="text" id="lineId" name="ep_lineID" placeholder="Line ID" required>--%>
<%--                    <button type="submit">提出</button>--%>
<%--                </form>--%>
<%--            </div>--%>
<%--        </div>--%>


        <!-- 편지지 봉투 -->
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