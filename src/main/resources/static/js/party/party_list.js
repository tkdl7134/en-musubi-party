document.addEventListener("DOMContentLoaded", () => {
    const cards = document.querySelectorAll(".card-inner");
    const slides = document.querySelectorAll(".hw_card");
    const indicators = document.querySelectorAll(".indicator");
    const container = document.querySelector('.hw_container');
    let currentIndex = 0;
    let startX = 0;
    let isDragging = false;
    const buttons = document.querySelectorAll(".card-back button");

    buttons.forEach(function (button) {
        button.addEventListener("click", function () {
            button.style.backgroundColor = "#FF494C";
            button.style.color = "#FFFFFF";
        });
    });

    const updateIndicators = (index) => {
        indicators.forEach((indicator, i) => {
            indicator.classList.toggle("active", i === index);
        });
    };

    const scrollToSlide = (index) => {
        const slideWidth = slides[0].offsetWidth;
        container.scrollTo({ left: slideWidth * index, behavior: "smooth" });
        currentIndex = index;
        updateIndicators(index);
    };

    const changePage = (direction) => {
        if (direction === 'next') {
            currentIndex = Math.min(currentIndex + 1, slides.length - 1);
        } else {
            currentIndex = Math.max(currentIndex - 1, 0);
        }
        scrollToSlide(currentIndex);
    };

    cards.forEach(card => {
        card.addEventListener("click", () => {
            card.classList.toggle("flipped");
        });
    });

    indicators.forEach((indicator, index) => {
        indicator.addEventListener("click", () => {
            scrollToSlide(index);
        });
    });

    container.addEventListener('wheel', (event) => {
        event.preventDefault();
        changePage(event.deltaY > 0 ? 'next' : 'prev');
    });

    document.addEventListener('keydown', (event) => {
        if (event.key === 'ArrowRight') {
            changePage('next');
        } else if (event.key === 'ArrowLeft') {
            changePage('prev');
        }
    });

    container.addEventListener("touchstart", (event) => {
        startX = event.touches[0].clientX;
        isDragging = false;
    });

    container.addEventListener("touchmove", (event) => {
        const endX = event.touches[0].clientX;
        const deltaX = startX - endX;

        if (Math.abs(deltaX) > 50) {
            changePage(deltaX > 0 ? 'next' : 'prev');
            isDragging = true;
        }
    });

    container.addEventListener("touchend", () => {
        isDragging = false;
    });

    container.addEventListener("mousedown", (event) => {
        startX = event.clientX;
        isDragging = true;
    });

    container.addEventListener("mousemove", (event) => {
        if (isDragging) {
            const endX = event.clientX;
            const deltaX = startX - endX;

            if (Math.abs(deltaX) > 50) {
                changePage(deltaX > 0 ? 'next' : 'prev');
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

    // 초기 슬라이드 설정
    scrollToSlide(currentIndex);
});
