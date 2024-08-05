document.addEventListener("DOMContentLoaded", function () {
    // 카드 플립 기능
    document.querySelectorAll('.hw_card').forEach(function (hw_card) {
        hw_card.addEventListener('click', function (event) {
            let elem = event.currentTarget;
            elem.classList.toggle('flipped');
        });
    });

    const handleScroll = (event) => {
        event.preventDefault();
        const delta = event.deltaY;
        const container = document.querySelector('.hw_container');
        const cards = document.querySelectorAll('.hw_card');
        let currentIndex = Array.from(cards).findIndex(card => Math.abs(card.getBoundingClientRect().top) < 5); // 근접한 값을 사용

        if (delta > 0 && currentIndex < cards.length - 1) {
            cards[currentIndex + 1].scrollIntoView({behavior: 'smooth'});
        } else if (delta < 0 && currentIndex > 0) {
            cards[currentIndex - 1].scrollIntoView({behavior: 'smooth'});
        }
    };

    const container = document.querySelector('.hw_container');
    container.addEventListener('wheel', handleScroll);
});
