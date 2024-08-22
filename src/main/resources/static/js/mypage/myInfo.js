document.addEventListener("DOMContentLoaded", function () {
    const button = document.getElementById('myInfo-info-update');

    if (button) {
        button.addEventListener('click', function() {
            // 클릭 시 배경색과 텍스트 색상 변경
            button.style.backgroundColor = '#333333'; // 변경할 색상
            button.style.color = 'white';

            // 일정 시간 후 원래 색상으로 돌아가기
            setTimeout(function() {
                button.style.backgroundColor = '#555555'; // 원래 색상
                button.style.color = 'white';
            }, 500);
        });
    }
});




