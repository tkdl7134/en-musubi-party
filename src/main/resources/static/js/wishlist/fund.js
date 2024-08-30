let eventno = 5;
let scrollTimeout;
let isMouseOverCard;
let jsoninfos;
var eno = document.getElementById("e_no").value;
var e_no = parseInt(eno);
var m_id = document.getElementById("m_id").value;
window.onload = () => {
	getFunds(e_no)
}
//카드 초기배치
function getFunds(e_no) {

$.ajax({
	type: "post",
	url: `/wishlist/funding/${e_no}`,
	data: {eno: e_no},
	async: false,
	dataType: "json",
	success: function (response) {
		jsoninfos = response;
		console.log(jsoninfos)

		response.forEach((element, index) => {
			eventno = element.e_no;
			$(".kh-f-card-container").append(`
				<div class="kh-f-card-out">
					<div class="kh-fund-card" value="${element.wl_no}">
						<div class="kh-fund-card-box">
							<div style="height: 18rem">
							<div style="width:100%; height: 18rem; background-color: transparent; position: absolute; z-index: 999"></div>

								<img style="height: 80%" alt="noImg" src="/img/${element.wl_product}.png" onerror="this.onerror=null; this.src='/img/プレゼント.png';"/>
							</div>
							<div>
								<h1 style="margin:0">${element.wl_product}</h1>
							</div>
						</div>
					</div>
				</div>`);
		});

		$(".kh-f-card-container").append(`<div class="kh-f-card-fake"></div>`)


		// 카드 스타일 초기화
		let card = document.querySelectorAll(".kh-f-card-out");

		card.forEach((element, index) => {
			let cardIn = element.querySelector(".kh-fund-card");

			// 모든 카드 크기를 동일하게 설정
			element.style.transform = "scale(1)"; // 모든 카드를 원래 크기로 설정

			// 애니메이션 설정
			element.style.transition = "0.8s ease-in-out";
		});

		// 첫 번째 카드를 중앙에 배치
		const container = document.querySelector(".kh-f-card-container");
		const firstCard = container.querySelector(".kh-f-card-out:first-child");

		if (firstCard) {
			const containerWidth = container.clientWidth;
			const cardWidth = firstCard.clientWidth;
			const initialScrollPosition = firstCard.offsetLeft - (containerWidth / 2 - cardWidth / 2);

			container.scrollLeft = initialScrollPosition;
		}
	}
});

		const cardCon = document.querySelector(".kh-f-card-container");
		// 이벤트 위임으로 모든 카드에 이벤트 리스너 적용
		cardCon.addEventListener("click", function (event) {
			const card = event.target.closest(".kh-fund-card");

			if (card) {
				let wlno = card.getAttribute("value");
				let selectobj = jsoninfos.find(function (element) {
					return element.wl_no == wlno;
				});

				console.log(selectobj);

				let percent = selectobj.percent || 0;
				document.querySelector("#kh-f-price").innerHTML = percent;
				document.querySelector("#kh-f-product").innerHTML = selectobj.wl_product;
				document.querySelector(".kh-f-btn").setAttribute("value", selectobj.wl_no);
				document.querySelector("#kh-f-img").src = "/img/" + selectobj.wl_product + ".png";

				openModal();
				// document.querySelector(".kh-f-mousemove > img").src = "/img/backbtn.png";

				const fpop = document.querySelector(".kh-f-popup");
				fpop.classList.add("kh-f-rotate");

				setTimeout(() => {
					fpop.classList.remove("kh-f-rotate");
				}, 1000);
			}
		})

		// 이벤트 위임으로 마우스 오버 및 아웃 이벤트 처리
		cardCon.addEventListener("mouseover", function (event) {
			const card = event.target.closest(".kh-f-card-out");

			if (card) {
				card.style.transform = "scale(1.1)"; // 모든 카드에서 동일하게 1.1배 확대
				card.style.filter = "none"; // 필터 제거
				event.stopPropagation();
			}
		});

		cardCon.addEventListener("mouseout", function (event) {
			const card = event.target.closest(".kh-f-card-out");

			if (card) {
				card.style.transform = "scale(1)"; // 마우스가 벗어났을 때 원래 크기로 축소
				// card.style.filter = "grayscale(100%)"; // 회색조 필터 적용
				event.stopPropagation();
			}
		})

		//모달 클로즈 이벤트
		const modal = document.getElementById("modal");
		const fpop = document.querySelector(".kh-f-popup");

		modal.addEventListener("click", function(event) {
			if (!fpop.contains(event.target)) {
				closeModal();
			}
		});

		// 모달 내부 클릭 시 이벤트 전파를 막기
		modal.addEventListener("click", function(event) {
			if (!fpop.contains(event.target)) {
				event.stopPropagation();
			}
		});

		//통계 모달 클로즈 이벤트
		let statispop = document.querySelector(".kh-f-statistic-pop");
		const statisticModal = document.getElementById("statisticModal");
		statisticModal.addEventListener("click", function(event) {
			if (!statispop.contains(event.target)) {
				closeStatistic()
			}
		});

		// 통계 모달 내부 클릭 시 이벤트 전파를 막기
		statisticModal.addEventListener("click", function(event) {
			if (!statispop.contains(event.target)) {
				event.stopPropagation();
			}
		});

		//변수 설정
		const cardConAll = document.querySelectorAll(".kh-f-card-container");
		// const mouseicn = document.querySelector(".kh-f-mousemove");

		// 컨테이너 내용을 복제하여 무한 스크롤 구현
		const cards = Array.from(cardCon.children);
		// const cardCount = cards.length;

		// 컨텐츠 복제를 두 번 이상으로 확장하여 스크롤 간격을 줄임
		for (let i = 0; i < 3; i++) {
			cards.forEach(card => cardCon.appendChild(card.cloneNode(true)))
		}

		const card = cardCon.children[0];
		const cardWidth = card.offsetWidth; // 카드 너비

		// 간격을 줄이기 위한 추가 스크롤 오프셋
		const offset = cardWidth / 4; // 카드 너비의 1/4만큼 스크롤을 더하여 간격 줄임

		// 무한 스크롤 구현
		cardCon.addEventListener("scroll", function () {
		const scrollWidthHalf = cardCon.scrollWidth / 2;

		if (cardCon.scrollLeft >= scrollWidthHalf) {
		// 오른쪽 끝에 도달하면 첫 번째 카드를 복제하여 추가
			cardCon.scrollLeft -= scrollWidthHalf;
		} else if (cardCon.scrollLeft <= cardWidth) {
		// 왼쪽 끝에 도달하면 마지막 카드가 바로 보이도록 처리
			cardCon.scrollLeft += scrollWidthHalf - cardWidth;
		}
		});


// 부드러운 스크롤을 위한 설정
	let scrollAmount = 0;
	let scrollTarget = 0;
	let isScrolling = false;

	function smoothScroll() {
		if (!isScrolling) return;

		scrollAmount += (scrollTarget - scrollAmount) * 2; // 부드러운 감속 효과
		cardCon.scrollLeft = scrollAmount;

		if (Math.abs(scrollTarget - scrollAmount) < 4) {
			isScrolling = false;
		} else {
			requestAnimationFrame(smoothScroll);
		}
	}

	// cardCon.addEventListener("wheel", function (event) {
	// 	event.preventDefault();
	//
	// 	// 스크롤 속도 조정
	// 	scrollTarget += event.deltaY * 0.5; // 스크롤 속도를 줄임
	// 	scrollTarget = Math.max(0, Math.min(cardCon.scrollWidth - cardCon.clientWidth, scrollTarget)); // 범위 제한
	//
	// 	if (!isScrolling) {
	// 		isScrolling = true;
	// 		requestAnimationFrame(smoothScroll);
	// 	}
	// });

		let isDown = false;
		let startX;
		let scrollLeft;

		cardCon.addEventListener("mousedown", (e) => {
			isDown = true;
			cardCon.classList.add("active");
			startX = e.pageX - cardCon.offsetLeft;
			scrollLeft = cardCon.scrollLeft;
		});

		cardCon.addEventListener("mouseleave", () => {
			isDown = false;
			cardCon.classList.remove("active");
		});

		cardCon.addEventListener("mouseup", () => {
			isDown = false;
			cardCon.classList.remove("active");
		});

		cardCon.addEventListener("mousemove", (e) => {
			if (!isDown) return;
			e.preventDefault();
			const x = e.pageX - cardCon.offsetLeft;
			const walk = (x - startX) * 2; //scroll-fast
			cardCon.scrollLeft = scrollLeft - walk;
		});

		// For touch devices
		cardCon.addEventListener("touchstart", (e) => {
			isDown = true;
			startX = e.touches[0].pageX - cardCon.offsetLeft;
			scrollLeft = cardCon.scrollLeft;
		});

		cardCon.addEventListener("touchend", () => {
			isDown = false;
		});

		cardCon.addEventListener("touchmove", (e) => {
			if (!isDown) return;
			const x = e.touches[0].pageX - cardCon.offsetLeft;
			const walk = (x - startX) * 2; //scroll-fast
			cardCon.scrollLeft = scrollLeft - walk;
		});

}


//ajax 종료
//크기,색상 호버시 확대 및 다른요소 비활성화

function goStatistic(wlno) {
	const container = document.querySelector("#kh-input-box");
	const finput = document.querySelector(".kh-f-input");
	const warnspan = document.querySelector("#kh-warn-text");
	if (finput.value == "") {
		container.classList.add("vibration");
		setTimeout(function() {
			container.classList.remove("vibration");
		}, 300);
		if (warnspan.classList.contains("kh-none")) {
			warnspan.classList.remove("kh-none");
			warnspan.classList.add("kh-show");
		}
	} else {
		let justnum = finput.value.replace(',', '');
		$.ajax({
			type: "post",
			url: `/wishlist/funding/${e_no}/insert`,
			data: {e_no, p_type: 'fund', p_price: justnum, wl_no: wlno, m_id },
			dataType: "json",
			success: function(response) {
				console.log(response)
				$(".kh-f-statistic-conCon").html("");
				closeModal();
				response.forEach((element, index) => {
					let doms = `
				<div class="kh-f-statistic-content">
					<div class="kh-f-statistic-name">
						<div class="kh-f-none">
							<span style="font-size: 0.7rem;color: red;">私の選択</span>
							<img alt="noImg" src="/img/flash.png" style="width: 1.5rem;"> 
						</div>
						<h1>${element.wl_product}</h1>
					</div>
					<div class="kh-f-statistic-bar">
						<div>
							<div class="kh-f-statistic-abled-bar" data-value="${element.percent}"><div><img alt="noImg" src="/img/menubtn.png"></div></div>
						</div>
					</div>
					<div class="kh-f-statistic-percent" >
						<img class="kh-f-none" alt="noImg" src="resources/img/threehearts.png">
						<h1><span data-value="${element.percent}">${element.percent}</span> ％ 達成</h1>
					</div>
				</div>
			`;

					if (element.wl_no == wlno) {
						$(".kh-f-statistic-conCon").prepend(doms)
					}
					else {
						$(".kh-f-statistic-conCon").append(doms);
					}
				});

				openStatistic();
				statisticModal.querySelector('.kh-f-statistic-name > div:nth-child(1)').classList.remove('kh-f-none');
				let statisBars = statisticModal.querySelectorAll('.kh-f-statistic-abled-bar')
				statisBars.forEach((element) => {
					element.style.width = element.getAttribute("data-value") + "%";
				});
				let statisNumber = statisticModal.querySelectorAll('.kh-f-statistic-percent > h1 > span')
				statisNumber.forEach((element) => {
					animateValue(element, 0, parseInt(element.getAttribute("data-value")), 1000);
				});

				// 복제된 요소도 포함하여 초기화 작업 수행
				let staticBars = document.querySelectorAll('.kh-f-statistic-abled-bar');
				staticBars.forEach((element) => {
					element.style.width = element.getAttribute("data-value") + "%";
				});

				//카운트다운
				let countDown = document.getElementById('finalCount');
				let count = 10;
				let interval = setInterval(function() {
					count--;
					countDown.textContent = count;
					if (count <= 0) {
						clearInterval(interval);
					}
				}, 1000);

				//페이지 이동
				setTimeout(function() {
					location.href = `/wishlist/funding/${e_no}/result`;
				}, 10000);


			},
			error: function(request, status, error) {
			}
		});

	}
}

function animateValue(element, start, end, duration) {
	let startTime = null;
	const step = (currentTime) => {
		if (!startTime) startTime = currentTime;
		const progress = currentTime - startTime;
		const value = Math.min(Math.floor(progress / duration * (end - start) + start), end);
		element.innerText = value;
		if (progress < duration) {
			requestAnimationFrame(step);
		} else {
			element.innerText = end;
		}
	};
	requestAnimationFrame(step);
}




function openModal() {
	const modal = document.getElementById("modal");
	modal.showModal();
}

function closeModal() {
	const modal = document.getElementById("modal");
	modal.close();
}
function openStatistic() {
	const modal = document.getElementById("statisticModal");
	modal.showModal();
}

function closeStatistic() {
	const modal = document.getElementById("statisticModal");
	modal.close();
}

document.addEventListener("DOMContentLoaded", function () {
	const overlay = document.getElementById("je_overlay");
	const container = document.querySelector(".kh-f-card-container");

	function hideOverlay(){
		overlay.classList.add("hidden");
	}

	function showOverlay() {
		overlay.classList.remove("hidden");
	}

	container.addEventListener("mouseover", hideOverlay);
	container.addEventListener("mouseout", showOverlay);
	container.addEventListener("touchstart", hideOverlay);
	container.addEventListener("touchend", showOverlay);
});