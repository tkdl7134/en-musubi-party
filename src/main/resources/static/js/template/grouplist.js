document.addEventListener("DOMContentLoaded", function () {
    const cards = document.querySelectorAll(".card-inner");
    const slides = document.querySelectorAll(".hw_card");
    const container = document.querySelector(".hw_container");
    const indicatorContainer = document.querySelector(".slider-indicators");

    let currentIndex = 0;
    let startX = 0;
    let isDragging = false;
    let isScrolling = false;
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

    function adjustScrollPosition() {
        if (currentIndex === totalPages - 1) {
            container.scrollLeft = container.scrollWidth - container.clientWidth;
        }
    }

    function scrollToSlide(index) {
        if (index >= 0 && index < totalPages && !isScrolling) {
            isScrolling = true;
            container.scrollTo({
                left: index * container.clientWidth,
                behavior: "smooth"
            });

            currentIndex = index;
            updateIndicators(index);

            setTimeout(() => {
                isScrolling = false;
                adjustScrollPosition();
            }, 800);
        }
    }

    function startDrag(event) {
        if (isScrolling) return;
        startX = event.type.includes("mouse") ? event.clientX : event.touches[0].clientX;
        isDragging = true;
    }

    function onDrag(event) {
        if (!isDragging || isScrolling) return;

        const moveX = event.type.includes("mouse") ? event.clientX : event.touches[0].clientX;
        const diff = startX - moveX;

        if (Math.abs(diff) > 50) {
            if (diff > 0 && currentIndex < totalPages - 1) {
                scrollToSlide(currentIndex + 1);
            } else if (diff < 0 && currentIndex > 0) {
                scrollToSlide(currentIndex - 1);
            }

            isDragging = false;
        }
    }

    function endDrag() {
        isDragging = false;
    }

    cards.forEach(card => {
        card.addEventListener('click', () => {
            card.classList.toggle('flipped');
        });
    });

    container.addEventListener("touchstart", startDrag);
    container.addEventListener("mousedown", startDrag);

    container.addEventListener("touchmove", onDrag);
    container.addEventListener("mousemove", onDrag);

    container.addEventListener("touchend", endDrag);
    container.addEventListener("mouseup", endDrag);
    container.addEventListener("mouseleave", endDrag);

    container.addEventListener("wheel", (event) => {
        if (isScrolling) return;
        event.preventDefault();
        if (event.deltaY > 0 && currentIndex < totalPages - 1) {
            scrollToSlide(currentIndex + 1);
        } else if (event.deltaY < 0 && currentIndex > 0) {
            scrollToSlide(currentIndex - 1);
        }
    });


    document.addEventListener("keydown", (event) => {
        if (isScrolling) return;
        if (event.key === "ArrowRight" && currentIndex < totalPages - 1) {
            scrollToSlide(currentIndex + 1);
        } else if (event.key === "ArrowLeft" && currentIndex > 0) {
            scrollToSlide(currentIndex - 1);
        }
    });

    createIndicators();
    updateIndicators(currentIndex);
});
