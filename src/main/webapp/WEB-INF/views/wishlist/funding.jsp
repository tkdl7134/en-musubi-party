<%@ page language="java" contentType="text/html; charset=utf-8"
		 pageEncoding="utf-8"%>
<%@ include file="../menubar.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html style="zoom : 100% !important;" lang="en">
<link rel="stylesheet" type="text/css" href="/resources/css/wishlist/fund.css">
<script src="https://code.jquery.com/jquery-3.7.1.js"
	integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
	crossorigin="anonymous"></script>
<script type="text/javascript" src="/resources/js/wishlist/fund.js" defer></script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />
${fundingList}
<input id="e_no" type="hidden" value="${sessionScope.e_no}">
<input id="m_id" type="hidden" value="${sessionScope.authenticatedMember.m_id}">
<div class="tk_funding-title">
	<div class="tk_funding-title-bigTitle">ご祝儀</div>
</div>
<%--<div class="tk_funding-title">--%>
<%--	<div>--%>
<%--		<span>ファンディング</span>--%>
<%--	</div>--%>
<%--	<div>--%>
<%--		<img src="/resources/img/head.png" alt="">--%>
<%--	</div>--%>
<%--</div>--%>
	<div class="kh-f-card-container" style="position: relative">
	<div id="je_overlay">
		<div class="je_overlay-txt">
			1回タッチした後、 <br /> <br>
			画像をドラッグすると、<br />
			詳しく見ることができます
		</div>
		<div class="scroll-downs">
<%--			<div class="mousey">--%>
<%--				<div class="scroller"></div>--%>
<%--			</div>--%>
<%--				<div class="kh-f-mousemove kh-f-none">--%>
					<img alt="" src="/resources/img/dragbtn.png">
<%--				</div>--%>
		</div>
	</div>
	<div class="kh-f-card-fake"></div>
	<!-- <div class="kh-f-card-out">
		<input type="hidden" class="cardInfos">
		<div class="kh-fund-card">
			<div style="height: 18rem">
				<img style="height: 100%" alt="noImg" src="resources/img/机.png" />
			</div>
			<div>
				<h3></h3>
			</div>
		</div>
	</div> -->
	</div>

<dialog id="modal" class="modal">
<div class="kh-f-popup">
	<div class="kh-f-popup-in">
		<div class="kh-f-img-box">
			<img alt="noImg" style="height: 100%" id="kh-f-img"  src="" onerror="this.onerror=null; this.src='/resources/img/mashine.png';"/>
		</div>
		<div class="kh-f-product-des">
			<h3>
				<span id="kh-f-product"></span>
			</h3>
			<div>
				<span id="kh-f-price"></span><span style="color: #FF7E81">％
					達成</span>
			</div>
		</div>
		<div class="kh-f-des">✿ ファンディング金額を入力してください ✿</div>
		<div style="position: relative;">
			<div style="font-size: 2rem" id="kh-input-box">
				<input class="kh-f-input" type="text" maxlength="8"
					oninput="numberMaxLength(this)" onclick="removeWarn()" />円 <img
					alt="" src="/resources/img/money.png">
			</div>
			<span id="kh-warn-text"
				style="color: red; position: absolute; bottom: -20px"
				class="kh-none">金額をご入力してください。</span>
		</div>
		<div style="display: flex; justify-content: center;">
<%--			<input hidden="hidden" id="m_id" value="${authenticatedMember.m_id}">--%>
			<input hidden="hidden" id="m_id" value="${sessionScope.authenticatedMember.m_id}">
			<div class="kh-f-btn"
				onclick="goStatistic(this.getAttribute('value'))" value="">ファンディング
			</div>
		</div>
	</div>
</div>
</dialog>

<dialog id="statisticModal" class="modal">
<div class="kh-f-statistic-pop">
	<div class="kh-f-statistic-pop-in">
		<div class="kh-f-statistic-title">
			<div>
				<img alt="" src="/resources/img/crown.png">
			</div>
				<div class="kh-f-statistic-title-h1">
					<div>ファンディン</div>
					<div>グランキング</div>
				</div>
			<div>
				<img alt="" src="/resources/img/crown.png">
			</div>
		</div>
		<div class="kh-f-statistic-conCon">
			<!-- <div class="kh-f-statistic-content">
				<div class="kh-f-statistic-name">
					<div class="kh-f-none"><span>私の選択</span><img alt="noImg" src="resources/img/flash.png"> </div>
					<h1>${element.wl_product}</h1>
				</div>
				<div class="kh-f-statistic-bar">
					<div>
						<div class="kh-f-statistic-abled-bar"><div><img alt="noImg" src="resources/img/menubtn.png"></div></div>
					</div>
				</div>
				<div class="kh-f-statistic-percent" data-value="${element.percent}">
					<img class="kh-f-none" alt="noImg" src="resources/img/threehearts.png">
					<h1><span>0</span>％ 達成</h1>
				</div>
			</div> -->
		</div>
		<div class="kh-f-statistic-timer">
			<img alt="" src=""> <span><span id="finalCount"
				style="color: #C82626">10</span>秒後に画面が移動します。</span>

		</div>
	</div>
</div>
</dialog>
</html>
