document.addEventListener("DOMContentLoaded", function () {
    // 슬라이드쇼 관련 코드
    const images = document.querySelectorAll(".image-container img");
    let currentImageIndex = 0;


    // 나머지 이벤트 리스너들 (공유 버튼 클릭, 팝업, 슬라이드 이동 등)
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

    function updateIndicators(index) {
        indicators.forEach((indicator, i) => {
            indicator.classList.toggle("active", i === index);
        });
    }

    function scrollToSlide(index) {
        if (index >= 0 && index < slides.length) {
            slides[index].scrollIntoView({ behavior: "smooth" });
            currentIndex = index;
            updateIndicators(index);
        }
    }

    // 공유 버튼 클릭 이벤트
    document.querySelectorAll(".share-button").forEach(button => {
        button.addEventListener("click", function () {
            const invitationUrl = button.getAttribute("data-url");
            shareUrlInput.value = invitationUrl;

            const imageContainer = button.closest(".image-container");
            imageContainer.classList.add("darken");

            setTimeout(() => {
                imageContainer.classList.remove("darken");
            }, 3000);

            button.classList.toggle("active");
            sharePopup.style.display = "block";
        });
    });

    closePopup.addEventListener("click", function () {
        sharePopup.style.display = "none";
    });

    copyButton.addEventListener("click", function () {
        shareUrlInput.select();
        document.execCommand("copy");
        alert("URLがコピーされました!");
    });

    window.addEventListener("click", function (event) {
        if (event.target === sharePopup) {
            sharePopup.style.display = "none";
        }
    });

    // 슬라이드 관련 터치 및 마우스 이벤트 리스너
    container.addEventListener("touchstart", (event) => startX = event.touches[0].clientX);

    container.addEventListener("touchmove", (event) => {
        const endX = event.touches[0].clientX;
        if (startX > endX + 50) scrollToSlide(currentIndex + 1);
        if (startX < endX - 50) scrollToSlide(currentIndex - 1);
    });

    container.addEventListener("mousedown", (event) => {
        startX = event.clientX;
        isDragging = true;
    });

    container.addEventListener("mousemove", (event) => {
        if (isDragging) {
            const endX = event.clientX;
            if (startX > endX + 50) scrollToSlide(currentIndex + 1);
            if (startX < endX - 50) scrollToSlide(currentIndex - 1);
            isDragging = false;
        }
    });

    container.addEventListener("mouseup", () => isDragging = false);
    container.addEventListener("mouseleave", () => isDragging = false);

    container.addEventListener("wheel", (event) => {
        event.preventDefault();
        if (event.deltaY > 0) scrollToSlide(currentIndex + 1);
        else scrollToSlide(currentIndex - 1);
    });

    document.addEventListener("keydown", (event) => {
        if (event.key === "ArrowRight") scrollToSlide(currentIndex + 1);
        else if (event.key === "ArrowLeft") scrollToSlide(currentIndex - 1);
    });

    // 초기 인디케이터 설정
    updateIndicators(currentIndex);
});