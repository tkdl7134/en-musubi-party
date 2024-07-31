// dimlayout만 적용할 때

$(function () {
    var scrollPosition = 0;

    $(".je_example-closeUp-button").click(function () {
        var $el = $("#je_layer"); // pop-up 창
        scrollPosition = $(window).scrollTop(); // 현재 스크롤 위치 저장
        $("body").css({
            overflow: "hidden",
            position: "fixed",
            top: -scrollPosition + "px",
            width: "100%",
        });

        // 템플릿 예시 설정
        var exampleSrc = $(this).data("example");
        $("#je_layer .je_pop-image img").attr("src", exampleSrc);

        $(".je_dim-layer").fadeIn();
        $el.scrollTop(0); // 팝업 레이어의 스크롤을 최상단으로 이동
        $(".je_pop-container").scrollTop(0); // 팝업 레이어 안의 스크롤 가능한 컨텐츠의 스크롤을 최상단으로 이동

        var $elWidth = ~~$el.outerWidth(),
            $elHeight = ~~$el.outerHeight(),
            docWidth = $(document).width(),
            docHeight = $(document).height();

        if ($elHeight < docHeight || $elWidth < docWidth) {
            $el.css({
                marginTop: -$elHeight / 2,
                marginLeft: -$elWidth / 2,
            });
        } else {
            $el.css({ top: 0, left: 0 });
        }
    });

    function closeLayer() {
        $(".je_dim-layer").fadeOut();
        $("body").css({
            overflow: "",
            position: "",
            top: "",
            width: "",
        }); // 바디 스크롤 다시 활성화
        $(window).scrollTop(scrollPosition); // 저장된 위치로 스크롤 이동
    }

    $("a.je_btn-layerClose").click(function () {
        event.preventDefault();
        closeLayer();
    });

    $(".je_dimBg").click(function () {
        closeLayer();
    });
});

document.addEventListener("DOMContentLoaded", function () {
    const overlay = document.getElementById("je_overlay");
    const container = document.querySelector(".je_preview-phone");

    function hideOverlay() {
        overlay.classList.add("hidden");
    }

    function showOverlay() {
        overlay.classList.remove("hidden");
    }

    container.addEventListener("mouseover", hideOverlay);
    container.addEventListener("mouseout", showOverlay);
    container.addEventListener("touchstart", hideOverlay);
    container.addEventListener("touchend", showOverlay);
});
