function changeColorNRedirect(button) {
    button.classList.add('active');  // active 상태를 강제로 추가
    setTimeout(function() {
        location.href = '/main';
    }, 300);
}