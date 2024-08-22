$(document).ready(function () {
    var $slider = $("#je_product-make-slider");
    var slideCount = $slider.children().length;

    $("#je_product-make-slider").slick({
        dots: true,
        infinite: false,
        speed: 300,
        slidesToShow: 1,
        adaptiveHeight: true,
        draggable: false,
        swipe: false,      // 터치 스와이프 비활성화
        touchMove: false,  // 터치 이동 비활성화

        prevArrow: $("#je_prev-button"),
        nextArrow: $("#je_next-button"),
    });

    updateButtons(0);

    // 슬라이더 변화될 때마다 변경되는 사항
    $("#je_product-make-slider").on(
        "afterChange",
        function (event, slick, currentSlide) {
            updateButtons(currentSlide);

            window.scrollTo(0, 0);
        }
    );

    function updateButtons(currentSlide) {
        $("#je_prev-button").hide();
        $("#je_next-button").hide();
        $("#je_submit-button").hide();

        if (currentSlide === 0) {
            $("#je_next-button").show();
        } else if (currentSlide === slideCount - 1) {
            $("#je_prev-button").show();
            $("#je_submit-button").show();
        } else {
            $("#je_prev-button").show();
            $("#je_next-button").show();
        }
    }
});
