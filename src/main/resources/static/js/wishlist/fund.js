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
								<img style="height: 100%" alt="noImg" src="/resources/img/${element.wl_product}.png" onerror="this.onerror=null; this.src='/resources/img/パソコン.png';"/>
							</div>
							<div>
								<h1 style="margin:0">${element.wl_product}</h1>
							</div>
						</div>
					</div>
				</div>`);
		});

		$(".kh-f-card-container").append(`<div class="kh-f-card-fake"></div>`)


		//색상 등
		// let card = document.querySelectorAll(".kh-f-card-out");
		// let fpop = document.querySelector(".kh-f-popup");
		// const modal = document.getElementById("modal");
		// card.forEach((element, index, array) => {
		// 	let cardIn = element.querySelector(".kh-fund-card");
		// 	if (index % 2 == 0) {
		// 		element.style.transform = "scale(0.9)";
		// 		element.classList.add("kh-f-card-min");
		// 		cardIn.style.backgroundColor = "#FFF1E0";
		// 	} else {
		// 		cardIn.style.backgroundColor = "#FFE0E0";
		// 	}
		// 	element.style.transition = "0.8s ease-in-out";
		// 	element.addEventListener("mouseenter", () => {
		// 		isMouseOverCard = true;
		// 	});
		// 	element.addEventListener("mouseleave", () => {
		// 		isMouseOverCard = false;
		// 	});
		// 	element.addEventListener("mouseover", function(event) {
		// 		card.forEach((otherCard) => {
		// 			if (otherCard !== element) {
		// 				if (otherCard.classList.contains("kh-f-card-min")) {
		// 					otherCard.style.transform = "scale(0.8)";
		// 				} else {
		// 					otherCard.style.transform = "scale(0.9)";
		// 				}
		// 				otherCard.style.filter = "grayscale(100%)";
		// 			}
		// 			document.querySelector(".kh-f-mousemove > img").src =
		// 				"/resources/img/viewbtn.png";
		// 			mouseicn.classList.remove("kh-f-none");
		// 			mouseicn.classList.add("kh-f-block");
		// 		});
		// 		if (element.classList.contains("kh-f-card-min")) {
		// 			this.style.transform = "scale(1)";
		// 		} else {
		// 			this.style.transform = "scale(1.1)";
		// 		}
		// 		event.stopPropagation();
		// 	});
		// 	element.addEventListener("mouseout", function(event) {
		// 		card.forEach((otherCard) => {
		// 			if (otherCard !== element) {
		// 				if (otherCard.classList.contains("kh-f-card-min")) {
		// 					otherCard.style.transform = "scale(0.9)";
		// 				} else {
		// 					otherCard.style.transform = "scale(1)";
		// 				}
		// 				otherCard.style.filter = "none";
		// 			}
		// 		});
		// 		if (element.classList.contains("kh-f-card-min")) {
		// 			this.style.transform = "scale(0.9)";
		// 		} else {
		// 			this.style.transform = "scale(1)";
		// 		}
		// 		event.stopPropagation();
		// 	});
		//
		// 	element.addEventListener("click", function(event) {
		// 		let cardParent = event.target.closest(".kh-fund-card");
		// 		element.classList.add("kh-f-rotate");
		// 		if (cardParent) {
		// 			let wlno = event.target.closest(".kh-fund-card").getAttribute("value");
		// 			let selectobj = jsoninfos.find(function(element) {
		// 				return element.wl_no == wlno;
		// 			});
		// 			console.log(selectobj)
		// 			if (selectobj.percent === undefined) {
		// 				percent = 0;
		// 			}
		// 			else {
		// 				percent = selectobj.percent;
		// 			};
		// 			document.querySelector("#kh-f-price").innerHTML = percent;
		// 			document.querySelector("#kh-f-product").innerHTML = selectobj.wl_product;
		// 			document.querySelector(".kh-f-btn").setAttribute("value", selectobj.wl_no);
		// 			document.querySelector("#kh-f-img").src = "/resources/img/" + selectobj.wl_product + ".png";
		// 			openModal()
		// 			document.querySelector(".kh-f-mousemove > img").src =
		// 				"/resources/img/backbtn.png";
		// 			fpop.classList.add("kh-f-rotate");
		// 		}
		// 		scrollTimeout = setTimeout(() => {
		// 			element.classList.remove("kh-f-rotate");
		// 			fpop.classList.remove("kh-f-rotate");
		// 		}, 1000);
		// 		event.stopPropagation();
		// 	});
		// });

		// 카드 스타일 초기화
		let card = document.querySelectorAll(".kh-f-card-out");
		const colors = ['#FDEEF4', '#FFF5F8', '#FDF7FF', '#FFF0F5', '#FEEEF5', '#FFE4E6'];

		card.forEach((element, index) => {
			let cardIn = element.querySelector(".kh-fund-card");

			// 모든 카드 크기를 동일하게 설정
			element.style.transform = "scale(1)"; // 모든 카드를 원래 크기로 설정

			// 각 카드에 다른 색상을 적용
			cardIn.style.background = colors[index % colors.length];

			// 애니메이션 설정
			element.style.transition = "0.8s ease-in-out";
		});
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
				document.querySelector("#kh-f-img").src = "/resources/img/" + selectobj.wl_product + ".png";

				openModal();
				document.querySelector(".kh-f-mousemove > img").src = "/resources/img/backbtn.png";

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
		const mouseicn = document.querySelector(".kh-f-mousemove");

		// 컨테이너 내용을 복제하여 무한 스크롤 구현
		const cards = Array.from(cardCon.children);
		// const cardCount = cards.length;

		// 컨텐츠 복제를 두 번 이상으로 확장하여 스크롤 간격을 줄임
		for (let i = 0; i < 3; i++) {
			cards.forEach(card => cardCon.appendChild(card.cloneNode(true)))
		}

		//마우스 따라다니는 요소
		cardCon.addEventListener("mouseover", function(event) {
			if (event.target === cardCon) {
				document.querySelector(".kh-f-mousemove > img").src =
					"/resources/img/dragbtn.png";
			}
			cardCon.style.cursor = "none";
			mouseicn.classList.remove("kh-f-none");
			mouseicn.classList.add("kh-f-block");
			event.stopPropagation();
		});

		document.addEventListener("mousemove", (event) => {
			const mouseX = event.clientX;
			const mouseY = event.clientY;
			mouseicn.style.pointerEvents = "none";
			mouseicn.style.left = mouseX + "px";
			mouseicn.style.top = mouseY + "px";
		});

		cardCon.addEventListener("mouseout", function() {
			mouseicn.classList.remove("kh-f-block");
			mouseicn.classList.add("kh-f-none");
		});

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

		//마우스 휠할때 도는 애니메이션
		// cardCon.addEventListener("wheel", function(event) {
		// 	if (isMouseOverCard) return;
		// 	card.forEach((element) => {
		// 		// Prevent the default vertical scroll
		// 		event.preventDefault();
		// 		// Scroll horizontally
		// 		const scrollSpeed = 0.5;
		// 		this.scrollLeft += event.deltaY * scrollSpeed;
		// 		if (scrollTimeout) {
		// 			if (element.classList.contains("kh-f-card-min")) {
		// 				element.style.transform = "scale(0.9) rotateY(30deg)";
		// 			} else {
		// 				element.style.transform = "rotateY(30deg)";
		// 			}
		// 			clearTimeout(scrollTimeout);
		// 		}
		// 		scrollTimeout = setTimeout(() => {
		// 			card.forEach(function(element) {
		// 				element.style.transform = "rotateY(0deg)";
		// 				if (element.classList.contains("kh-f-card-min")) {
		// 					element.style.transform = "scale(0.9)";
		// 				} else {
		// 					element.style.transform = "scale(1)";
		// 				}
		// 			});
		// 			isRotated = false;
		// 		}, 300); // 1초 동안 유지
		// 	});
		// });

		cardCon.addEventListener("wheel", function (event) {
			event.preventDefault();
			const scrollSpeed = 0.5;
			cardCon.scrollLeft += event.deltaY * scrollSpeed;
		})

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
						<div class="kh-f-none"><span>私の選択</span><img alt="noImg" src="/resources/img/flash.png"> </div>
						<h1>${element.wl_product}</h1>
					</div>
					<div class="kh-f-statistic-bar">
						<div>
							<div class="kh-f-statistic-abled-bar" data-value="${element.percent}"><div><img alt="noImg" src="/resources/img/menubtn.png"></div></div>
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