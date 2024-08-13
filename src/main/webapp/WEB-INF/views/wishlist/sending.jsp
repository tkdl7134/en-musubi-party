<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="finance/css/send.css" />
<script src="finance/js/send.js" defer></script>
<div class="kh-s-card-container">
	<div class="kh-s-mousemove kh-f-none">
		<img alt="" src="finance/img/dragbtn.png" />
	</div>
	<div class="kh-s-fake-card"></div>
	<div class="kh-s-card-out">
		<input type="hidden" />
		<div class="kh-send-card">
			<div style="height: 10rem">
				<img style="height: 100%; width: 12rem" alt="noImg"
					src="finance/img/familly.png" />
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

	<div class="kh-s-card-out">
		<input type="hidden" />
		<div class="kh-send-card">
			<div style="height: 10rem">
				<img style="height: 100%; width: 12rem" alt="noImg"
					src="finance/img/relative.png" />
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

	<div class="kh-s-card-out">
		<input type="hidden" />
		<div class="kh-send-card">
			<div style="height: 10rem">
				<img style="height: 100%; width: 12rem" alt="noImg"
					src="finance/img/boss.png" />
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

	<div class="kh-s-card-out">
		<input type="hidden" />
		<div class="kh-send-card">
			<div style="height: 10rem">
				<img style="height: 100%; width: 12rem" alt="noImg"
					src="finance/img/teammate.png" />
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

	<div class="kh-s-card-out">
		<input type="hidden" />
		<div class="kh-send-card">
			<div style="height: 10rem">
				<img style="height: 100%; width: 12rem" alt="noImg"
					src="finance/img/bestfriend.png" />
			</div>
			<div>
				<h3 style="text-align: center; font-weight: 500">親友には</h3>
				<h2 style="text-align: center; color: #ff464a">5万円</h2>
				<h3 style="text-align: center; font-weight: 500">お勧めします✿</h3>
			</div>
			<div>
				<button class="kh-s-btn" onclick="sendModal('30000')">選択</button>
			</div>
		</div>
	</div>
	<div class="kh-s-fake-card"></div>
</div>

<dialog id="modal">
<div class="kh-s-popup">
	<div class="kh-s-popup-in">
		<div class="kh-s-envelope">
			<img alt="noImg" src="finance/img/envelope01.png" style="width: 100%">
		</div>
		<div>
			<img alt="noImg" src="finance/img/mark_syuku.png">
		</div>
		<div class="kh-s-modal-box">
			<div>
				<h2>欠席の場合</h2>
			</div>
			<div style="display: flex; flex-direction: column; gap: 1rem;">
				<div>
					<button class="kh-s-btn" onclick="setMoney('10000')">1万円</button>
				</div>
				<div style="font-size: 1rem;">
					ささやかながら心を込めて、<br> お二人の幸せをお祈りできます✿
				</div>
			</div>
		</div>
		<div class="kh-s-modal-box">
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
		<div style="font-size: 2rem" id="kh-input-box">
			&nbsp;総<input class="kh-s-input" type="text" maxlength="8"
				onclick="removeWarn()" readonly />円 <img alt=""
				src="finance/img/money.png">
		</div>
		<div>
			<button class="kh-s-btn" onclick="goFinal('nodata')">送金</button>
		</div>
	</div>
</div>
</dialog>
</html>
