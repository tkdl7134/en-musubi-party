document.addEventListener("DOMContentLoaded", function () {
    const slides = document.querySelectorAll(".hw_card");
    const indicators = document.querySelectorAll(".indicator");
    const container = document.querySelector(".hw_container");
    const sharePopup = document.getElementById("share-popup");
    const shareUrlInput = document.getElementById("share-url");
    const copyButton = document.getElementById("copy-button");
    const closePopup = document.getElementById("close-popup");

    let currentIndex = 0;
    let startX = 0;
    let isDragging = false;

    // 인디케이터 업데이트 함수
    function updateIndicators(index) {
        indicators.forEach((indicator, i) => {
            indicator.classList.toggle("active", i === index);
        });
    }

    // 슬라이드 이동 함수
    function scrollToSlide(index) {
        if (index >= 0 && index < slides.length) {
            slides[index].scrollIntoView({ behavior: "smooth" });
            currentIndex = index;
            updateIndicators(index);
        }
    }

    // 공유 버튼 클릭 시 팝업 열기 및 색상 변경
    const shareButtons = document.querySelectorAll(".share-button");
    shareButtons.forEach(button => {
        button.addEventListener("click", function () {
            const invitationUrl = button.getAttribute("data-url");
            shareUrlInput.value = invitationUrl;

            // 이미지 컨테이너 어둡게 하기
            const imageContainer = button.closest(".image-container");
            imageContainer.classList.add("darken");

            // 3초 후 화면 밝기 복구
            setTimeout(() => {
                imageContainer.classList.remove("darken");
            }, 3000);

            // 버튼 색상 토글
            button.classList.toggle("active");

            // 팝업 표시
            sharePopup.style.display = "block";
        });
    });

    // 팝업 닫기
    closePopup.addEventListener("click", function () {
        sharePopup.style.display = "none";
    });

    // URL 복사
    copyButton.addEventListener("click", function () {
        shareUrlInput.select();
        document.execCommand("copy");
        alert("URLがコピーされました!");
    });

    // 팝업 외부 클릭 시 팝업 닫기
    window.addEventListener("click", function (event) {
        if (event.target === sharePopup) {
            sharePopup.style.display = "none";
        }
    });

    // 터치 이벤트 처리
    container.addEventListener("touchstart", (event) => {
        startX = event.touches[0].clientX;
    });

    container.addEventListener("touchmove", (event) => {
        const endX = event.touches[0].clientX;
        if (startX > endX + 50) {
            scrollToSlide(currentIndex + 1);  // 왼쪽으로 드래그
        } else if (startX < endX - 50) {
            scrollToSlide(currentIndex - 1);  // 오른쪽으로 드래그
        }
    });

    // 마우스 드래그 이벤트 처리
    container.addEventListener("mousedown", (event) => {
        startX = event.clientX;
        isDragging = true;
    });

    container.addEventListener("mousemove", (event) => {
        if (isDragging) {
            const endX = event.clientX;
            if (startX > endX + 50) {
                scrollToSlide(currentIndex + 1);  // 왼쪽으로 드래그
                isDragging = false;
            } else if (startX < endX - 50) {
                scrollToSlide(currentIndex - 1);  // 오른쪽으로 드래그
                isDragging = false;
            }
        }
    });

    container.addEventListener("mouseup", () => {
        isDragging = false;
    });

    container.addEventListener("mouseleave", () => {
        isDragging = false;
    });

    // 스크롤 이벤트 처리
    container.addEventListener("wheel", (event) => {
        event.preventDefault();
        if (event.deltaY > 0) {
            scrollToSlide(currentIndex + 1);
        } else {
            scrollToSlide(currentIndex - 1);
        }
    });

    // 키보드 화살표로 슬라이드 이동
    document.addEventListener("keydown", (event) => {
        if (event.key === "ArrowRight") {
            scrollToSlide(currentIndex + 1);
        } else if (event.key === "ArrowLeft") {
            scrollToSlide(currentIndex - 1);
        }
    });

    // 초기 인디케이터 설정
    updateIndicators(currentIndex);
});
