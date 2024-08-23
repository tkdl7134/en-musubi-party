document.addEventListener("DOMContentLoaded", () => {
    const cards = document.querySelectorAll(".card-inner");
    const indicators = document.querySelectorAll(".indicator");
    const container = document.querySelector('.hw_container');
    let currentIndex = 0;
    let startX = 0;
    let isDragging = false;

    const attendVal = document.getElementById("Hw_attend_btn")?.value;

    if (attendVal === 'ご出席') {
        document.getElementById("Hw_attend_div").style.display = 'block';
    }

    if (!cards.length || !container) {
        console.warn("Required elements are not found in the DOM.");
        return;
    }

    const updateIndicators = (index) => {
        indicators.forEach((indicator, i) => {
            indicator.classList.toggle("active", i === index);
        });
    };

    const scrollToSlide = (index) => {
        const cardWidth = cards[index].offsetWidth;
        const scrollPosition = index * cardWidth;
        container.scrollTo({ left: scrollPosition, behavior: "smooth" });
        currentIndex = index;
        updateIndicators(index);
    };

    const changePage = (direction) => {
        if (direction === 'next') {
            currentIndex = Math.min(currentIndex + 1, cards.length - 1);
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

    scrollToSlide(currentIndex);
});
