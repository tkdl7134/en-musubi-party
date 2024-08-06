$(document).ready(function(){
    $('.single-item').slick({
        dots: true,          // 점 네비게이션을 표시
        infinite: false,
        arrows: false,
        draggable: false,
    });

    $('.next-button').on('click', function(){
        $('.single-item').slick('slickNext');
    });
});

function submitForm() {
    // 여기에 폼 제출 로직 추가
    alert("회원가입이 완료되었습니다!");
}
