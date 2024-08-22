$(document).ready(function () {
    $(window).on("load", function () {
        slider();
    });

    function slider() {
        let swiper = undefined;
        let slideNum = $(".slider .swiper-slide").length; //슬라이드 총 개수
        let slideInx = 0; //현재 슬라이드 index

        //디바이스 체크
        let oldWChk = window.innerWidth > 767 ? "pc" : "mo";
        sliderAct();

        let resizeTimer;
        $(window).on("resize", function () {
            clearTimeout(resizeTimer);
            resizeTimer = setTimeout(function () {
                let newWChk = window.innerWidth > 767 ? "pc" : "mo";
                if (newWChk != oldWChk) {
                    oldWChk = newWChk;
                    sliderAct();
                }
            }, 300);
        });

        //슬라이드 실행
        function sliderAct() {
            //슬라이드 초기화
            if (swiper != undefined) {
                swiper.destroy();
                swiper = undefined;
            }

            //slidesPerView 옵션 설정
            let viewNum = oldWChk == "pc" ? 3 : 2;
            //loop 옵션 체크
            let loopChk = slideNum > viewNum;

            swiper = new Swiper(".slider .inner", {
                slidesPerView: viewNum,
                initialSlide: slideInx,
                loop: loopChk,
                centeredSlides: true,
                navigation: {
                    nextEl: ".slider .btn_next",
                    prevEl: ".slider .btn_prev",
                },
                pagination: {
                    el: ".fraction",
                    type: "fraction",
                },
                on: {
                    slideChangeTransitionStart: function () {
                        slideInx = this.realIndex;
                        updateClass();
                    },
                    init: function () {
                        updateClass();
                    },
                },
            });

            function updateClass() {
                $slider.find(".swiper-slide").removeClass("first last");
                $slider.find(".swiper-slide-prev").prev().addClass("first");
                $slider.find(".swiper-slide-next").next().addClass("last");
            }
        }
    }
});
