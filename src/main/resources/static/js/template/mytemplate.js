document.addEventListener("DOMContentLoaded", function () {
    const slides = document.querySelectorAll(".hw_card");
    const indicators = document.querySelectorAll(".indicator");
    const container = document.querySelector(".hw_container");

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

    container.addEventListener("touchstart", (event) => {
        startX = event.touches[0].clientX;
        isDragging = true;
    });

    container.addEventListener("touchmove", (event) => {
        if (!isDragging) return;
        const moveX = event.touches[0].clientX;
        const diff = startX - moveX;
        if (Math.abs(diff) > 50) {
            if (diff > 0) scrollToSlide(currentIndex + 1); // Swipe left
            else scrollToSlide(currentIndex - 1); // Swipe right
            isDragging = false;
        }
    });

    container.addEventListener("mousedown", (event) => {
        startX = event.clientX;
        isDragging = true;
    });

    container.addEventListener("mousemove", (event) => {
        if (!isDragging) return;
        const moveX = event.clientX;
        const diff = startX - moveX;
        if (Math.abs(diff) > 50) {
            if (diff > 0) scrollToSlide(currentIndex + 1); // Drag left
            else scrollToSlide(currentIndex - 1); // Drag right
            isDragging = false;
        }
    });

    container.addEventListener("mouseup", () => isDragging = false);
    container.addEventListener("mouseleave", () => isDragging = false);

    container.addEventListener("wheel", (event) => {
        event.preventDefault();
        if (event.deltaY > 0) scrollToSlide(currentIndex + 1); // Scroll down
        else scrollToSlide(currentIndex - 1); // Scroll up
    });

    document.addEventListener("keydown", (event) => {
        if (event.key === "ArrowRight") scrollToSlide(currentIndex + 1);
        else if (event.key === "ArrowLeft") scrollToSlide(currentIndex - 1);
    });

    updateIndicators(currentIndex);
});
