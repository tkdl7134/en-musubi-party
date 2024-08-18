document.addEventListener("DOMContentLoaded", function () {
    const cards = document.querySelectorAll(".card-inner");

    function updateIndicators(index) {
        const indicators = document.querySelectorAll(".indicator");
        indicators.forEach((indicator, i) => {
            indicator.classList.toggle("active", i === index);
        });
    }

    function scrollToSlide(index) {
        const container = document.querySelector('.hw_container');
        const cardWidth = container.offsetWidth;
        const scrollPosition = index * cardWidth;
        container.scrollTo({ left: scrollPosition, behavior: "smooth" });
        updateIndicators(index);
    }

    // 카드 클릭 시 플립 효과
    cards.forEach(card => {
        card.addEventListener("click", function () {
            card.classList.toggle("flipped");
        });
    });

    // 페이지 넘김을 위한 변수 설정
    const container = document.querySelector('.hw_container');
    const totalPages = Math.ceil(cards.length / 3); // 3개의 카드가 한 페이지에 나타남
    let currentIndex = 0;

    container.addEventListener('wheel', (event) => {
        event.preventDefault();
        if (event.deltaY > 0) {
            currentIndex = Math.min(currentIndex + 1, totalPages - 1);
        } else {
            currentIndex = Math.max(currentIndex - 1, 0);
        }
        scrollToSlide(currentIndex);
    });

    document.addEventListener('keydown', (event) => {
        if (event.key === 'ArrowRight') {
            currentIndex = Math.min(currentIndex + 1, totalPages - 1);
            scrollToSlide(currentIndex);
        } else if (event.key === 'ArrowLeft') {
            currentIndex = Math.max(currentIndex - 1, 0);
            scrollToSlide(currentIndex);
        }
    });

    // 초기 페이지를 0으로 설정하여 첫 페이지 콘텐츠를 보여줌
    scrollToSlide(currentIndex);
});
