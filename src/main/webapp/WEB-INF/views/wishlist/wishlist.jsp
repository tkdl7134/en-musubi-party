<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%@ include file="../menubar.jsp" %>
<!DOCTYPE html>
<html style="zoom : 100% !important;" lang="en">
<link rel="stylesheet" href="/css/wishlist/wishlist.css" />
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <title>Title</title>
    <script src="/js/wishlist/wishlist.js"></script>
</head>
<body>
<div class="tk_wishlist-body">
    <div class="tk_wishlist-container">
        <div class="tk_wishlist-text-container" style="text-align: center">
            <div style="font-size: 15px; font-weight: bold; color: #3f3f3f; margin-top: 2.5rem; margin-bottom: 1.5rem;">
                <span style="color: #EC0000;">✿</span> ご返信いただきありがとうございます <span style="color: #EC0000;">✿</span>
            </div>
            <div style="margin-bottom: 1.5rem; color: #ff4345; padding: 0 15px;">どのような形で</br>お気持ちをお伝えになりたいですか?</div>
            <div style="color: #666666 ;font-weight: bold">以下の方法で新郎新婦への</br>🙇🏻 お祝いをしていただけます 🙇🏻‍♀️</div>
        </div>
        <div class="tk_wishlist-btn-container">
            <div class="tk_wishlist-btn-box">
                <button type="submit" onclick="location.href='/wishlist/funding/${sessionScope.e_no}'">
                    <div class="tk_wishlist-text-box">
                        <div class="jp-text">ファンディング</div>
<%--                        <div class="eg-text">FUNDING</div>--%>
                    </div>
                    <div class="tk_wishlist-img-box">
                        <img src="/img/funding.png" alt="funding">
                    </div>
                </button>
            </div>
            <div class="tk_wishlist-btn-box">
                <button type="submit" onclick="location.href='/wishlist/sending'">
                    <div class="tk_wishlist-text-box">
                        <div class="jp-text">ご祝儀</div>
<%--                        <div class="eg-text">REMITTANCE</div>--%>
                    </div>
                    <div class="tk_wishlist-img-box">
                        <img src="/img/sendMoney.png" alt="sendMoney">
                    </div>
                </button>
            </div>
<%--            <div class="tk_wishlist-btn-box">--%>
<%--                <button type="button" onclick="openAmazonAndRedirect()">--%>
<%--                    <div class="tk_wishlist-text-box">--%>
<%--                        <div class="jp-text">プレゼント</div>--%>
<%--                        <div class="eg-text">PRESENT</div>--%>
<%--                    </div>--%>
<%--                    <div class="tk_wishlist-img-box">--%>
<%--                        <img src="/img/amazon.png" alt="amazon">--%>
<%--                    </div>--%>
<%--                </button>--%>
<%--            </div>--%>
            <div class="tk_wishlist-btn-box">
<%--                <a href="${amazonUrl}" target="_blank" class="wishlist-button" onclick="redirectToFinanceResult()">--%>
                    <a href="/survey/${sessionScope.authenticatedMember.m_id}-${sessionScope.e_no}/amazon" class="wishlist-button" onclick="openInNewTab('${amazonUrl}'); //redirectToFinanceResult();">
                    <div class="tk_wishlist-text-box">
                        <div class="jp-text">プレゼント</div>
<%--                        <div class="eg-text">PRESENT</div>--%>
                    </div>
                    <div class="tk_wishlist-a-img-box">
                        <img src="/img/amazon.png" alt="amazon">
                    </div>
                </a>
            </div>
        </div>
    </div>
</div>
</body>
</html>