<%@ page language="java" contentType="text/html; charset=utf-8"
		 pageEncoding="utf-8"%>
<%@ include file="../menubar.jsp" %>
<!DOCTYPE html>
<html style="zoom : 100% !important;" lang="en">
<link rel="stylesheet" href="/css/wishlist/send.css" />
<link rel="stylesheet" href="/css/wishlist/tk_slide.css" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css"/>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com/" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+JP:wght@200..900&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
<script src="/js/wishlist/tk_swiper-slide-center.js"></script>
<script src="/js/wishlist/send.js" defer></script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<body>
<input id="e_no" type="hidden" value="${sessionScope.e_no}">
<input id="m_id" type="hidden" value="${sessionScope.authenticatedMember.m_id}">
<div class="tk_sending-title">
	<div class="tk_sending-title-bigTitle">ご祝儀</div>
</div>
	<div class="je_page-content">
		<div class="slider">
			<div class="inner">
<%--				<div class="kh-s-card-container">--%>
					<ul class="swiper-wrapper slide_list">
						<li class="swiper-slide">
								<div class="kh-s-card-out">
									<input type="hidden" />
										<div class="kh-send-card">
											<div style="height: 10rem">
												<img style="height: 100%; width: 12rem" alt="noImg"
											 src="/img/familly.png" />
											</div>
											<div>
												<h3 style="text-align: center; font-weight: 500">家族には</h3>
												<h2 style="text-align: center; color: #ff464a">5万円</h2>
												<h3 style="text-align: center; font-weight: 500">お勧めします✿</h3>
											</div>
											<div>
												<button class="kh-s-btn" onclick="sendModal('50000')">選択</button>
											</div>
										</div>
								</div>
						</li>
						<li class="swiper-slide">
						<div class="kh-s-card-out">
							<input type="hidden" />
							<div class="kh-send-card">
								<div style="height: 10rem">
									<img style="height: 100%; width: 12rem" alt="noImg"
										 src="/img/relative.png" />
								</div>
								<div>
									<h3 style="text-align: center; font-weight: 500">親戚には</h3>
									<h2 style="text-align: center; color: #ff464a">3万円</h2>
									<h3 style="text-align: center; font-weight: 500">お勧めします✿</h3>
								</div>
								<div>
									<button class="kh-s-btn" onclick="sendModal('30000')">選択</button>
								</div>
							</div>
						</div>
					</li>
						<li class="swiper-slide">
						<div class="kh-s-card-out">
							<input type="hidden" />
							<div class="kh-send-card">
								<div style="height: 10rem">
									<img style="height: 100%; width: 12rem" alt="noImg"
										 src="/img/boss.png" />
								</div>
								<div>
									<h3 style="text-align: center; font-weight: 500">職場の上司には</h3>
									<h2 style="text-align: center; color: #ff464a">5万円</h2>
									<h3 style="text-align: center; font-weight: 500">お勧めします✿</h3>
								</div>
								<div>
									<button class="kh-s-btn" onclick="sendModal('50000')">選択</button>
								</div>
							</div>
						</div>
					</li>
						<li class="swiper-slide">
						<div class="kh-s-card-out">
							<input type="hidden" />
							<div class="kh-send-card">
								<div style="height: 10rem">
									<img style="height: 100%; width: 12rem" alt="noImg"
										 src="/img/teammate.png" />
								</div>
								<div>
									<h3 style="text-align: center; font-weight: 500">職場の同期には</h3>
									<h2 style="text-align: center; color: #ff464a">3万円</h2>
									<h3 style="text-align: center; font-weight: 500">お勧めします✿</h3>
								</div>
								<div>
									<button class="kh-s-btn" onclick="sendModal('30000')">選択</button>
								</div>
							</div>
						</div>
					</li>
						<li class="swiper-slide">
						<div class="kh-s-card-out">
							<input type="hidden" />
							<div class="kh-send-card">
								<div style="height: 10rem">
									<img style="height: 100%; width: 12rem" alt="noImg"
										 src="/img/bestfriend.png" />
								</div>
								<div>
									<h3 style="text-align: center; font-weight: 500">親友には</h3>
									<h2 style="text-align: center; color: #ff464a">5万円</h2>
									<h3 style="text-align: center; font-weight: 500">お勧めします✿</h3>
								</div>
								<div>
									<button class="kh-s-btn" onclick="sendModal('50000')">選択</button>
								</div>
							</div>
						</div>
					</li>
					</ul>
<%--				</div>--%>
			</div>
			<!-- 양 옆 버튼 -->
			<div class="je_slider-buttons">
				<div class="je_slider-btn btn_prev">
					<img src="/img/left-arrow-icon.png" alt="이전" />
				</div>
				<div style="display: flex;
    						justify-content: center;
    						align-items: center;
    						font-size: 1.2rem;
    						gap: 0.3rem;"
					 class="je_template-slide-paging fraction">
				</div>
				<div class="je_slider-btn btn_next">
					<img src="/img/right-arrow-icon.png" alt="다음" />
				</div>
			</div>
		</div>
	</div>
</div>

<%--<div class="kh-s-card-container">--%>
<%--	<div class="kh-s-mousemove kh-f-none">--%>
<%--		<img alt="" src="/img/dragbtn.png" />--%>
<%--	</div>--%>
<%--	<div class="kh-s-fake-card"></div>--%>
<%--	<div class="kh-s-card-out">--%>
<%--		<input type="hidden" />--%>
<%--		<div class="kh-send-card">--%>
<%--			<div style="height: 10rem">--%>
<%--				<img style="height: 100%; width: 12rem" alt="noImg"--%>
<%--					src="/img/familly.png" />--%>
<%--			</div>--%>
<%--			<div>--%>
<%--				<h3 style="text-align: center; font-weight: 500">家族には</h3>--%>
<%--				<h2 style="text-align: center; color: #ff464a">5万円</h2>--%>
<%--				<h3 style="text-align: center; font-weight: 500">お勧めします✿</h3>--%>
<%--			</div>--%>
<%--			<div>--%>
<%--				<button class="kh-s-btn" onclick="sendModal('50000')">選択</button>--%>
<%--			</div>--%>
<%--		</div>--%>
<%--	</div>--%>

<%--	<div class="kh-s-card-out">--%>
<%--		<input type="hidden" />--%>
<%--		<div class="kh-send-card">--%>
<%--			<div style="height: 10rem">--%>
<%--				<img style="height: 100%; width: 12rem" alt="noImg"--%>
<%--					src="/img/relative.png" />--%>
<%--			</div>--%>
<%--			<div>--%>
<%--				<h3 style="text-align: center; font-weight: 500">親戚には</h3>--%>
<%--				<h2 style="text-align: center; color: #ff464a">3万円</h2>--%>
<%--				<h3 style="text-align: center; font-weight: 500">お勧めします✿</h3>--%>
<%--			</div>--%>
<%--			<div>--%>
<%--				<button class="kh-s-btn" onclick="sendModal('30000')">選択</button>--%>
<%--			</div>--%>
<%--		</div>--%>
<%--	</div>--%>

<%--	<div class="kh-s-card-out">--%>
<%--		<input type="hidden" />--%>
<%--		<div class="kh-send-card">--%>
<%--			<div style="height: 10rem">--%>
<%--				<img style="height: 100%; width: 12rem" alt="noImg"--%>
<%--					src="/img/boss.png" />--%>
<%--			</div>--%>
<%--			<div>--%>
<%--				<h3 style="text-align: center; font-weight: 500">職場の上司には</h3>--%>
<%--				<h2 style="text-align: center; color: #ff464a">5万円</h2>--%>
<%--				<h3 style="text-align: center; font-weight: 500">お勧めします✿</h3>--%>
<%--			</div>--%>
<%--			<div>--%>
<%--				<button class="kh-s-btn" onclick="sendModal('50000')">選択</button>--%>
<%--			</div>--%>
<%--		</div>--%>
<%--	</div>--%>

<%--	<div class="kh-s-card-out">--%>
<%--		<input type="hidden" />--%>
<%--		<div class="kh-send-card">--%>
<%--			<div style="height: 10rem">--%>
<%--				<img style="height: 100%; width: 12rem" alt="noImg"--%>
<%--					src="/img/teammate.png" />--%>
<%--			</div>--%>
<%--			<div>--%>
<%--				<h3 style="text-align: center; font-weight: 500">職場の同期には</h3>--%>
<%--				<h2 style="text-align: center; color: #ff464a">3万円</h2>--%>
<%--				<h3 style="text-align: center; font-weight: 500">お勧めします✿</h3>--%>
<%--			</div>--%>
<%--			<div>--%>
<%--				<button class="kh-s-btn" onclick="sendModal('30000')">選択</button>--%>
<%--			</div>--%>
<%--		</div>--%>
<%--	</div>--%>

<%--	<div class="kh-s-card-out">--%>
<%--		<input type="hidden" />--%>
<%--		<div class="kh-send-card">--%>
<%--			<div style="height: 10rem">--%>
<%--				<img style="height: 100%; width: 12rem" alt="noImg"--%>
<%--					src="/img/bestfriend.png" />--%>
<%--			</div>--%>
<%--			<div>--%>
<%--				<h3 style="text-align: center; font-weight: 500">親友には</h3>--%>
<%--				<h2 style="text-align: center; color: #ff464a">5万円</h2>--%>
<%--				<h3 style="text-align: center; font-weight: 500">お勧めします✿</h3>--%>
<%--			</div>--%>
<%--			<div>--%>
<%--				<button class="kh-s-btn" onclick="sendModal('30000')">選択</button>--%>
<%--			</div>--%>
<%--		</div>--%>
<%--	</div>--%>
<%--	<div class="kh-s-fake-card"></div>--%>
<%--</div>--%>

<dialog id="modal">
	<div class="kh-s-popup-in">
		<button class="close-button" onclick="closeModal()">&times;</button>
		<div class="kh-s-envelope">
			<img alt="noImg" src="/img/envelope01.png" style="width: 100%">
		</div>
		<div>
			<img alt="noImg" src="/img/mark_syuku.png">
		</div>
		<div class="kh-s-modal-box">
			<div>
				<h2>欠席の場合</h2>
			</div>
			<div style="display: flex; flex-direction: column; gap: 1rem;">
				<div>
					<button class="kh-s-btn" onclick="setMoney('10000')">1万円</button>
				</div>
				<div style="font-size: 0.8rem;">
					ささやかながら心を込めて、<br> お二人の幸せをお祈りできます✿
				</div>
			</div>
		</div>
		<div class="kh-s-modal-box2">
			<div>
				<h2>出席の場合</h2>
			</div>
			<div>
				<div class="kh-s-modal-btn-box">
					<button class="kh-s-btn" onclick="setMoney('30000')">3万円</button>
					<button class="kh-s-btn" onclick="setMoney('50000')">5万円</button>
				</div>
				<div class="kh-s-modal-btn-box">
					<button class="kh-s-btn" onclick="setMoney('70000')">7万円</button>
					<button class="kh-s-btn" onclick="setMoney('100000')">10万円</button>
				</div>
			</div>
		</div>
		<div id="kh-input-box">
			&nbsp;総<input class="kh-s-input" type="text" maxlength="8"
				onclick="removeWarn()" readonly />円 <img alt=""
				src="/img/money.png">
			<input hidden="hidden" value="">
		</div>
		<div>
			<button class="kh-send-btn" onclick="goFinal()">送金</button>
		</div>
	</div>
</dialog>
</body>
</html>
