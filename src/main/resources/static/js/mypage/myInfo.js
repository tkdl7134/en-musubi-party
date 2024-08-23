document.addEventListener("DOMContentLoaded", function () {
    const homeButton = document.querySelector('#myInfo-home-button');
    const updateButton = document.querySelector('#myInfo-info-update');

    function handleClick(button, formSelector) {
        console.log('Button clicked:', button.id);
        button.style.backgroundColor = '#333333'; // 변경할 색상
        button.style.color = 'white';

        setTimeout(function() {
            console.log('Submitting form:', formSelector);
            document.querySelector(formSelector).submit(); // 폼 제출
        }, 500);
    }

    if (homeButton) {
        homeButton.addEventListener('click', function(event) {
            event.preventDefault(); // 폼 제출 방지
            handleClick(homeButton, '#myInfo-home-form');
        });
    }

    if (updateButton) {
        updateButton.addEventListener('click', function(event) {
            event.preventDefault(); // 폼 제출 방지
            handleClick(updateButton, '#myInfo-update-form');
        });
    }
});
