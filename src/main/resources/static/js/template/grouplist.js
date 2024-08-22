document.addEventListener("DOMContentLoaded", () => {
    const cards = document.querySelectorAll(".card-inner");
    const indicators = document.querySelectorAll(".indicator");
    const container = document.querySelector('.hw_container');
    const totalPages = Math.ceil(cards.length / 3); // 페이지 수를 계산
    let currentIndex = 0;
    let startX = 0;
    let isDragging = false;

    if (!cards.length || !container) {
        console.warn("Required elements are not found in the DOM.");
        return;
    }

    const updateIndicators = (index) => {
        if (index === 0) {
            indicators[0].classList.add("active");
            indicators[1].classList.remove("active");
            indicators[2].classList.remove("active");
        } else if (index === totalPages - 1) {
            indicators[0].classList.remove("active");
            indicators[1].classList.remove("active");
            indicators[2].classList.add("active");
        } else {
            indicators[0].classList.remove("active");
            indicators[1].classList.add("active");
            indicators[2].classList.remove("active");
        }
    };

    const scrollToSlide = (index) => {
        const cardWidth = container.offsetWidth;
        const scrollPosition = index * cardWidth;
        container.scrollTo({ left: scrollPosition, behavior: "smooth" });
        currentIndex = index;
        updateIndicators(index);
    };

    const changePage = (direction) => {
        if (direction === 'next') {
            currentIndex = Math.min(currentIndex + 1, totalPages - 1);
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

    // 마우스 휠 이벤트 처리
    container.addEventListener('wheel', (event) => {
        event.preventDefault();
        changePage(event.deltaY > 0 ? 'next' : 'prev');
    });

    // 키보드 이벤트 처리
    document.addEventListener('keydown', (event) => {
        if (event.key === 'ArrowRight') {
            changePage('next');
        } else if (event.key === 'ArrowLeft') {
            changePage('prev');
        }
    });

    // 터치 이벤트 처리
    container.addEventListener("touchstart", (event) => {
        startX = event.touches[0].clientX;
    });

    container.addEventListener("touchmove", (event) => {
        const endX = event.touches[0].clientX;
        if (startX > endX + 50) {
            changePage('next');  // 왼쪽으로 드래그
        } else if (startX < endX - 50) {
            changePage('prev');  // 오른쪽으로 드래그
        }
    });

    // 마우스 드래그 이벤트 처리
    container.addEventListener("mousedown", (event) => {
        startX = event.clientX;
        isDragging = true;
    });

    container.addEventListener("mousemove", (event) => {
        if (isDragging) {
            const endX = event.clientX;
            if (startX > endX + 50) {
                changePage('next');  // 왼쪽으로 드래그
                isDragging = false;
            } else if (startX < endX - 50) {
                changePage('prev');  // 오른쪽으로 드래그
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

    // 초기 인디케이터 설정
    scrollToSlide(currentIndex);
});
