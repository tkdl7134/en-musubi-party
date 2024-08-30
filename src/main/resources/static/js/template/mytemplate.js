document.addEventListener("DOMContentLoaded", function () {
    const slides = document.querySelectorAll(".hw_card");
    const container = document.querySelector(".hw_container");
    const shareButtons = document.querySelectorAll(".share-button");
    const sharePopup = document.getElementById("share-popup");
    const shareUrlInput = document.getElementById("share-url");
    const copyButton = document.getElementById("copy-button");
    const closePopup = document.getElementById("close-popup");
    const indicatorContainer = document.querySelector(".slider-indicators");

    let currentIndex = 0;
    let startX = 0;
    let isDragging = false;

    const slidesPerPage = 3; // 한 페이지에 표시할 슬라이드 수
    const totalPages = Math.ceil(slides.length / slidesPerPage); // 총 페이지 수 계산

    // 인디케이터 동적 생성
    function createIndicators() {
        indicatorContainer.innerHTML = ''; // 기존 인디케이터 초기화
        for (let i = 0; i < totalPages; i++) {
            const indicator = document.createElement("span");
            indicator.classList.add("indicator");
            if (i === 0) {
                indicator.classList.add("active");
            }
            indicatorContainer.appendChild(indicator);
        }
    }

    function updateIndicators(index) {
        const pageIndex = Math.floor(index / slidesPerPage);
        const indicators = document.querySelectorAll(".indicator");
        indicators.forEach((indicator, i) => {
            if (i === pageIndex) {
                indicator.classList.add("active");
            } else {
                indicator.classList.remove("active");
            }
        });
    }

    function scrollToSlide(index) {
        if (index >= 0 && index < slides.length) {
            const pageIndex = Math.floor(index / slidesPerPage);
            container.scrollTo({
                left: pageIndex * container.clientWidth,
                behavior: "smooth"
            });
            currentIndex = index;
            updateIndicators(index);
        }
    }

    function startDrag(event) {
        startX = event.type.includes("mouse") ? event.clientX : event.touches[0].clientX;
        isDragging = true;
    }

    function onDrag(event) {
        if (!isDragging) return;

        const moveX = event.type.includes("mouse") ? event.clientX : event.touches[0].clientX;
        const diff = startX - moveX;

        if (Math.abs(diff) > 50) {
            if (diff > 0) scrollToSlide(currentIndex + slidesPerPage); // Swipe or drag left
            else scrollToSlide(currentIndex - slidesPerPage); // Swipe or drag right

            isDragging = false;
        }
    }

    function endDrag() {
        isDragging = false;
    }

    container.addEventListener("touchstart", startDrag);
    container.addEventListener("mousedown", startDrag);

    container.addEventListener("touchmove", onDrag);
    container.addEventListener("mousemove", onDrag);

    container.addEventListener("touchend", endDrag);
    container.addEventListener("mouseup", endDrag);
    container.addEventListener("mouseleave", endDrag);

    container.addEventListener("wheel", (event) => {
        event.preventDefault();
        if (event.deltaY > 0) scrollToSlide(currentIndex + slidesPerPage); // Scroll down
        else scrollToSlide(currentIndex - slidesPerPage); // Scroll up
    });

    document.addEventListener("keydown", (event) => {
        if (event.key === "ArrowRight") scrollToSlide(currentIndex + slidesPerPage);
        else if (event.key === "ArrowLeft") scrollToSlide(currentIndex - slidesPerPage);
    });

    shareButtons.forEach(button => {
        button.addEventListener("click", function () {
            // 모든 버튼에서 'active' 클래스 제거 (다른 버튼의 active 상태를 해제)
            shareButtons.forEach(btn => btn.classList.remove('active'));

            // 현재 클릭된 버튼에 'active' 클래스 추가
            this.classList.add('active');

            // 해당 버튼의 부모 요소에서 이미지 컨테이너를 찾아 'darken' 클래스 추가
            const imageContainer = this.closest('.card-inner').querySelector('.image-container');
            imageContainer.classList.add('darken');

            // 공유할 URL을 입력 필드에 설정하고, 팝업을 표시
            const url = this.getAttribute("data-url");
            shareUrlInput.value = url;
            sharePopup.style.display = "block";

           
            setTimeout(() => {
                imageContainer.classList.remove('darken');
                this.classList.remove('active');
            }, 2000);
        });
    });



    closePopup.addEventListener("click", () => {
        sharePopup.style.display = "none";
    });

    copyButton.addEventListener("click", () => {
        shareUrlInput.select();
        document.execCommand("copy");
        alert("URLがコピーされました!");
    });

    createIndicators();
    updateIndicators(currentIndex);
});
