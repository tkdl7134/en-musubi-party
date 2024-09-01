document.addEventListener("DOMContentLoaded", () => {
    const cards = document.querySelectorAll(".hw_card");
    const indicators = document.querySelectorAll(".indicator");
    const container = document.querySelector('.hw_container');
    let currentIndex = 0;
    let isDragging = false;
    let startX = 0;
    let currentTranslate = 0;
    let prevTranslate = 0;
    let animationID;
    let threshold = 0.3; // 슬라이드를 넘기기 위한 최소 드래그 비율
    let slideWidth = container.offsetWidth; // 슬라이드의 너비

    if (!cards.length || !container) {
        console.warn("Required elements are not found in the DOM.");
        return;
    }

    const totalPages = Math.ceil(cards.length / 3);

    const updateIndicators = (index) => {
        indicators.forEach((indicator, i) => {
            indicator.classList.toggle("active", i === index);
        });
    };

    const setPositionByIndex = () => {
        currentTranslate = currentIndex * -slideWidth;
        prevTranslate = currentTranslate;
        setSliderPosition();
        updateIndicators(currentIndex);
    };

    const setSliderPosition = () => {
        container.style.transform = `translateX(${currentTranslate}px)`;
    };

    const animate = () => {
        setSliderPosition();
        if (isDragging) requestAnimationFrame(animate);
    };

    const handleGesture = () => {
        const movedBy = currentTranslate - prevTranslate;

        if (movedBy < -slideWidth * threshold && currentIndex < totalPages - 1) {
            currentIndex += 1;
        }

        if (movedBy > slideWidth * threshold && currentIndex > 0) {
            currentIndex -= 1;
        }

        setPositionByIndex();
    };

    container.addEventListener("mousedown", (event) => {
        startX = event.clientX;
        isDragging = true;
        animationID = requestAnimationFrame(animate);
        container.style.cursor = 'grabbing';
    });

    container.addEventListener("mousemove", (event) => {
        if (isDragging) {
            const currentX = event.clientX;
            currentTranslate = prevTranslate + currentX - startX;
        }
    });

    container.addEventListener("mouseup", () => {
        isDragging = false;
        cancelAnimationFrame(animationID);
        container.style.cursor = 'grab';
        handleGesture();
    });

    container.addEventListener("mouseleave", () => {
        if (isDragging) {
            isDragging = false;
            cancelAnimationFrame(animationID);
            handleGesture();
        }
    });

    container.addEventListener("touchstart", (event) => {
        startX = event.touches[0].clientX;
        isDragging = true;
        animationID = requestAnimationFrame(animate);
    });

    container.addEventListener("touchmove", (event) => {
        if (isDragging) {
            const currentX = event.touches[0].clientX;
            currentTranslate = prevTranslate + currentX - startX;
        }
    });

    container.addEventListener("touchend", () => {
        isDragging = false;
        cancelAnimationFrame(animationID);
        handleGesture();
    });

    // 휠 스크롤로 페이지 전환
    container.addEventListener('wheel', (event) => {
        event.preventDefault();
        if (event.deltaY > 0 && currentIndex < totalPages - 1) {
            currentIndex++;
        } else if (event.deltaY < 0 && currentIndex > 0) {
            currentIndex--;
        }
        setPositionByIndex();
    });

    window.addEventListener('resize', () => {
        slideWidth = container.offsetWidth;
        setPositionByIndex();
    });

    setPositionByIndex();
});
