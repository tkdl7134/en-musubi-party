document.addEventListener("DOMContentLoaded", function () {
    const cards = document.querySelectorAll(".card");

    // 카드 클릭 시 플립과 버튼 표시
    cards.forEach(card => {
        card.addEventListener("click", function () {
            card.classList.toggle("flipped");
        });
    });

    // 버튼 클릭 이벤트
    const buttons = document.querySelectorAll('.card-back button, .line-button button');
    buttons.forEach(button => {
        button.addEventListener('click', function(e) {
            e.stopPropagation();
            const buttonType = e.currentTarget.textContent.trim();
            handleButtonClick(buttonType);
        });
    });

    function handleButtonClick(buttonType) {
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

    const container = document.querySelector('.hw_container');
    const contents = document.querySelectorAll('.hw_content');

    let currentIndex = 0;

    function scrollToContent(index) {
        if (index >= 0 && index < contents.length) {
            contents[index].scrollIntoView({ behavior: 'smooth' });
            currentIndex = index;
        }
    }

    container.addEventListener('wheel', (event) => {
        event.preventDefault(); // 기본 스크롤 이벤트 방지
        if (event.deltaY > 0) {
            scrollToContent(currentIndex + 1);
        } else {
            scrollToContent(currentIndex - 1);
        }
    });

    document.addEventListener('keydown', (event) => {
        if (event.key === 'ArrowDown') {
            scrollToContent(currentIndex + 1);
        } else if (event.key === 'ArrowUp') {
            scrollToContent(currentIndex - 1);
        }
    });
});
