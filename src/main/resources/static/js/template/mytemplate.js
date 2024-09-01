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

    const slidesPerPage = 1;  // 슬라이드당 한 카드만 표시되도록 수정
    const totalPages = slides.length;

    function createIndicators() {
        indicatorContainer.innerHTML = '';
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
        const indicators = document.querySelectorAll(".indicator");
        indicators.forEach((indicator, i) => {
            if (i === index) {
                indicator.classList.add("active");
            } else {
                indicator.classList.remove("active");
            }
        });
    }

    function scrollToSlide(index) {
        if (index >= 0 && index < slides.length) {
            container.scrollTo({
                left: index * container.clientWidth,
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
            if (diff > 0) scrollToSlide(currentIndex + 1);
            else scrollToSlide(currentIndex - 1);

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
        if (event.deltaY > 0) scrollToSlide(currentIndex + 1);
        else scrollToSlide(currentIndex - 1);
    });

    document.addEventListener("keydown", (event) => {
        if (event.key === "ArrowRight") scrollToSlide(currentIndex + 1);
        else if (event.key === "ArrowLeft") scrollToSlide(currentIndex - 1);
    });

    shareButtons.forEach(button => {
        button.addEventListener("click", function () {
            // 모든 버튼에서 'active' 클래스 제거 (다른 버튼의 active 상태를 해제)
            shareButtons.forEach(btn => btn.classList.remove('active'));

            this.classList.add('active');

            const imageContainer = this.closest('.card-inner').querySelector('.image-container');
            imageContainer.classList.add('darken');

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
