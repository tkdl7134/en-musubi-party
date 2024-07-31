document.addEventListener("DOMContentLoaded", function() {
    // 카드 플립 기능
    document.querySelectorAll('.hw_card').forEach(function(hw_card) {
        hw_card.addEventListener('click', function(event) {
            let elem = event.currentTarget;
            elem.classList.toggle('flipped');
        });
    });

    const handleScroll = (event) => {
        event.preventDefault();
        const delta = event.deltaY;
        const container = document.querySelector('.hw_container');
        const cards = document.querySelectorAll('.hw_card');
        let currentIndex = Array.from(cards).findIndex(card => card.getBoundingClientRect().top === 0);

        if (delta > 0 && currentIndex < cards.length - 1) {
            cards[currentIndex + 1].scrollIntoView({ behavior: 'smooth' });
        } else if (delta < 0 && currentIndex > 0) {
            cards[currentIndex - 1].scrollIntoView({ behavior: 'smooth' });
        }
    };

    const container = document.querySelector('.hw_container');
    container.addEventListener('wheel', handleScroll);

    // 버튼 클릭 이벤트
    const buttons = document.querySelectorAll('.hw_button button');
    buttons.forEach(button => {
        button.addEventListener('click', (e) => {
            e.preventDefault();
            const buttonType = e.currentTarget.textContent.trim();
            handleButtonClick(buttonType);
        });
    });

    const handleButtonClick = (buttonType) => {
        switch (buttonType) {
            case 'テンプレート':
                alert('テンプレート 버튼 클릭');
                break;
            case 'アンケート':
                alert('アンケート 버튼 클릭');
                break;
            case '通計':
                alert('通計 버튼 클릭');
                break;
            case 'line':
                alert('line 버튼 클릭');
                break;
            default:
                console.log('알 수 없는 버튼 클릭');
        }
    }
});