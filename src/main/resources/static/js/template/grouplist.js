document.addEventListener("DOMContentLoaded", () => {
    const cards = document.querySelectorAll(".card-inner");
    const indicators = document.querySelectorAll(".indicator");
    const container = document.querySelector('.hw_container');
    const totalPages = Math.ceil(cards.length / 3);
    let currentIndex = 0;




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
        const cardWidth = container.offsetWidth;
        const scrollPosition = index * cardWidth;
        container.scrollTo({ left: scrollPosition, behavior: "smooth" });
        updateIndicators(index);
    };

    cards.forEach(card => {
        card.addEventListener("click", () => {
            card.classList.toggle("flipped");
        });
    });

    const changePage = (direction) => {
        if (direction === 'next') {
            currentIndex = Math.min(currentIndex + 1, totalPages - 1);
        } else {
            currentIndex = Math.max(currentIndex - 1, 0);
        }
        scrollToSlide(currentIndex);
    };

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

    scrollToSlide(currentIndex);
});
