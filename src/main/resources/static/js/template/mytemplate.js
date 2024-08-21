document.addEventListener("DOMContentLoaded", function () {
    const slides = document.querySelectorAll(".hw_card");
    const indicators = document.querySelectorAll(".indicator");
    let currentIndex = 0;

    function updateIndicators(index) {
        if (index === 0) {
            indicators[0].classList.add("active");
            indicators[1].classList.remove("active");
            indicators[2].classList.remove("active");
        } else if (index === slides.length - 1) {
            indicators[0].classList.remove("active");
            indicators[1].classList.remove("active");
            indicators[2].classList.add("active");
        } else {
            indicators[0].classList.remove("active");
            indicators[1].classList.add("active");
            indicators[2].classList.remove("active");
        }
    }

    function scrollToSlide(index) {
        if (index >= 0 && index < slides.length) {
            slides[index].scrollIntoView({ behavior: "smooth" });
            currentIndex = index;
            updateIndicators(index);
        }
    }

    document.querySelector(".hw_container").addEventListener("wheel", (event) => {
        event.preventDefault();
        if (event.deltaY > 0) {
            scrollToSlide(currentIndex + 1);
        } else {
            scrollToSlide(currentIndex - 1);
        }
    });

    document.addEventListener("keydown", (event) => {
        if (event.key === "ArrowRight") {
            scrollToSlide(currentIndex + 1);
        } else if (event.key === "ArrowLeft") {
            scrollToSlide(currentIndex - 1);
        }
    });


});
