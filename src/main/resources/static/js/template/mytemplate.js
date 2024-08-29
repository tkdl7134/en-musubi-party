document.addEventListener("DOMContentLoaded", function () {
    const slides = document.querySelectorAll(".hw_card");
    const indicators = document.querySelectorAll(".indicator");
    const container = document.querySelector(".hw_container");
    const shareButtons = document.querySelectorAll(".share-button");
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
            if (diff > 0) scrollToSlide(currentIndex + 1); // Swipe or drag left
            else scrollToSlide(currentIndex - 1); // Swipe or drag right

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
        if (event.deltaY > 0) scrollToSlide(currentIndex + 1); // Scroll down
        else scrollToSlide(currentIndex - 1); // Scroll up
    });

    document.addEventListener("keydown", (event) => {
        if (event.key === "ArrowRight") scrollToSlide(currentIndex + 1);
        else if (event.key === "ArrowLeft") scrollToSlide(currentIndex - 1);
    });

    shareButtons.forEach(button => {
        button.addEventListener("click", function () {
            const url = this.getAttribute("data-url");
            shareUrlInput.value = url;
            sharePopup.style.display = "block";
        });
    });

    closePopup.addEventListener("click", () => {
        sharePopup.style.display = "none";
    });

    copyButton.addEventListener("click", () => {
        shareUrlInput.select();
        document.execCommand("copy");
        alert("URL이 복사되었습니다!");
    });

    updateIndicators(currentIndex);
});
