document.addEventListener("DOMContentLoaded", function () {
    const homeButton = document.getElementById('myInfo-home-button');
    const updateButton = document.getElementById('myInfo-info-update');

    function handleClick(button) {
        button.style.backgroundColor = '#333333'; // 변경할 색상
        button.style.color = 'white';

        setTimeout(function() {
            button.style.backgroundColor = '#555555'; // 원래 색상
            button.style.color = 'white';
        }, 500);
    }

    if (homeButton) {
        homeButton.addEventListener('click', function() {
            console.log('Home button clicked')
            handleClick(homeButton);
        });
    }

    if (updateButton) {
        updateButton.addEventListener('click', function() {
            handleClick(updateButton);
        });
    }
});
