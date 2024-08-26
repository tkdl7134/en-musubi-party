<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%@ include file="../menubar.jsp" %>
<!DOCTYPE html>
<html style="zoom : 100% !important;" lang="en">
<link rel="stylesheet" href="/resources/css/wishlist/wishlist.css" />
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <title>Title</title>
    <script src="/resources/js/wishlist/wishlist.js"></script>
</head>
<body>
<div class="tk_wishlist-body">
    <input type="hidden" name="m_id" value="${sessionScope.authenticatedMember.m_id}">
    <input type="hidden" name="e_no" value="${sessionScope.e_no}">
    <div class="tk_wishlist-container">
        <div class="tk_wishlist-text-container">
            <div style="margin-bottom: 1rem; margin-left: 1rem">“どうやって祝ってあげたいですか”</div>
            <div style="margin-left: 0.5rem;">ご返信いただきありがとうございます。</div>
            <div style="margin-left: 0.5rem;">以下の方法で新郎新婦へのお祝いをお選びいただけます</div>
        </div>
        <div class="tk_wishlist-btn-container">
            <div class="tk_wishlist-btn-box">
                <button type="submit" onclick="location.href='/wishlist/funding/${sessionScope.e_no}'">
                    <div class="tk_wishlist-text-box">
                        <div class="jp-text">ファンディング</div>
                        <div class="eg-text">FUNDING</div>
                    </div>
                    <div class="tk_wishlist-img-box">
                        <img src="/resources/img/funding.png" alt="funding">
                    </div>
                </button>
            </div>
            <div class="tk_wishlist-btn-box">
                <button type="submit" onclick="location.href='/wishlist/sending'">
                    <div class="tk_wishlist-text-box">
                        <div class="jp-text">ご祝儀</div>
                        <div class="eg-text">REMITTANCE</div>
                    </div>
                    <div class="tk_wishlist-img-box">
                        <img src="/resources/img/sendMoney.png" alt="sendMoney">
                    </div>
                </button>
            </div>
            <div class="tk_wishlist-btn-box">
                <button type="button" onclick="openAmazonAndRedirect()">
                    <div class="tk_wishlist-text-box">
                        <div class="jp-text">プレゼント</div>
                        <div class="eg-text">PRESENT</div>
                    </div>
                    <div class="tk_wishlist-img-box">
                        <img src="/resources/img/amazon.png" alt="amazon">
                    </div>
                </button>
            </div>
            <div class="tk_wishlist-btn-box">
                <a href="${amazonUrl}" target="_blank" class="wishlist-button" onclick="redirectToFinanceResult()">
                    <div class="tk_wishlist-text-box">
                        <div class="jp-text">プレゼント</div>
                        <div class="eg-text">PRESENT</div>
                    </div>
                    <div class="tk_wishlist-a-img-box">
                        <img src="/resources/img/amazon.png" alt="amazon">
                    </div>
                </a>
            </div>
        </div>
    </div>
</div>
</body>
</html>