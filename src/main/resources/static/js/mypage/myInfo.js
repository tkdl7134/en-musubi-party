document.addEventListener("DOMContentLoaded", function () {
    const homeButton = document.querySelector('#myInfo-home-button');

    function homeClick(button, formSelector) {
        console.log('Button clicked:', button.id);
        button.style.backgroundColor = '#ffeeee';
        button.style.border = '3px solid #ffc700';
        button.style.color = '#3f3f3f';

        setTimeout(function () {
            console.log('Submitting form:', formSelector);
            document.querySelector(formSelector).submit();
        }, 500);
    }

    if (homeButton) {
        homeButton.addEventListener('click', function (event) {
            event.preventDefault(); // 폼 제출 방지
            homeClick(homeButton, '#myInfo-home-form');
        });
    }
});


document.addEventListener("DOMContentLoaded", function () {
    const updateButton = document.querySelector('#myInfo-info-update');

    function updateClick(button, formSelector) {
        console.log('Button clicked:', button.id);
        button.style.backgroundColor = '#ffeeee';
        button.style.border = '3px solid #ff5155';
        button.style.color = '#3f3f3f';

        setTimeout(function () {
            console.log('Submitting form:', formSelector);
            document.querySelector(formSelector).submit(); // 폼 제출
        }, 500);
    }

    if (updateButton) {
        updateButton.addEventListener('click', function (event) {
            event.preventDefault(); // 폼 제출 방지
            updateClick(updateButton, '#myInfo-update-form');
        });
    }
});