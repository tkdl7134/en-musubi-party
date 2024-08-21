document.addEventListener("DOMContentLoaded", function () {
    const slides = document.querySelectorAll(".hw_card");
    const indicators = document.querySelectorAll(".indicator");
    const container = document.querySelector(".hw_container");
    let currentIndex = 0;
    let startX = 0;
    let isDragging = false;

    // 인디케이터 업데이트 함수
    function updateIndicators(index) {
        if (index === 0) {
            indicators[0].classList.add("active");
            indicators[1].classList.remove("active");
            indicators[2].classList.remove("active");
        } else if (index === slides.length - 1) {
            indicators[0].classList.remove("active");
            indicators[1].classList.remove("active");
            indicators[2].classList.add("active");
        } else {
            indicators[0].classList.remove("active");
            indicators[1].classList.add("active");
            indicators[2].classList.remove("active");
        }
    }



    // 슬라이드 이동 함수
    function scrollToSlide(index) {
        if (index >= 0 && index < slides.length) {
            slides[index].scrollIntoView({ behavior: "smooth" });
            currentIndex = index;
            updateIndicators(index);
        }
    }

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
