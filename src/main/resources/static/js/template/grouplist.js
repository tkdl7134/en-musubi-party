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

    const container = document.querySelector('.hw_container');
    const contents = document.querySelectorAll('.hw_content');

    let currentIndex = 0;
    const itemsPerPage = 3;
    let totalPages = Math.ceil(contents.length / itemsPerPage);

    function showPage(index) {
        // 모든 콘텐츠를 숨기고
        contents.forEach(content => content.style.display = 'none');

        // 현재 페이지에 해당하는 콘텐츠만 표시
        const start = index * itemsPerPage;
        const end = start + itemsPerPage;
        for (let i = start; i < end && i < contents.length; i++) {
            contents[i].style.display = 'block';
        }
    }

    function scrollToContent(index) {
        if (index >= 0 && index < totalPages) {
            showPage(index);
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

    // 초기 페이지를 0으로 설정하여 첫 페이지 콘텐츠를 보여줌
    showPage(currentIndex);
});
