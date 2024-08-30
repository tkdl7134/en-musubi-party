document.addEventListener("DOMContentLoaded", () => {
    const cards = document.querySelectorAll(".card-inner");
    const indicators = document.querySelectorAll(".indicator");
    const container = document.querySelector('.hw_container');
    let currentIndex = 0;
    let isDragging = false;
    let startX = 0;
    const cardsPerPage = 3;

    if (!cards.length || !container) {
        console.warn("Required elements are not found in the DOM.");
        return;
    }

    const totalPages = Math.ceil(cards.length / cardsPerPage);

    const updateIndicators = (index) => {
        const pageIndex = Math.floor(index / cardsPerPage);
        indicators.forEach((indicator, i) => {
            if (i === 0 && pageIndex === 0) {
                indicator.classList.add("active");
            } else if (i === 2 && pageIndex === totalPages - 1) {
                indicator.classList.add("active");
            } else if (i === 1 && pageIndex > 0 && pageIndex < totalPages - 1) {
                indicator.classList.add("active");
            } else {
                indicator.classList.remove("active");
            }
        });
    };

    const scrollToSlide = (index) => {
        const cardWidth = container.offsetWidth;
        const pageIndex = Math.floor(index / cardsPerPage);
        const scrollPosition = pageIndex * cardWidth;

        container.scrollTo({ left: scrollPosition, behavior: "smooth" });
        updateIndicators(index);
    };

    const changePage = (direction) => {
        currentIndex = direction === 'next' ? Math.min(currentIndex + cardsPerPage, cards.length - 1) : Math.max(currentIndex - cardsPerPage, 0);
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

    container.addEventListener("touchstart", (event) => {
        startX = event.touches[0].clientX;
        isDragging = true;
    });

    container.addEventListener("touchmove", (event) => {
        if (isDragging) {
            const deltaX = startX - event.touches[0].clientX;
            if (Math.abs(deltaX) > 50) {
                changePage(deltaX > 0 ? 'next' : 'prev');
                isDragging = false;
            }
        }
    });

    container.addEventListener("mousedown", (event) => {
        startX = event.clientX;
        isDragging = true;
    });

    container.addEventListener("mousemove", (event) => {
        if (isDragging) {
            const deltaX = startX - event.clientX;
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
