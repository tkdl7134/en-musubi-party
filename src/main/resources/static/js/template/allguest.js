$(document).ready(function () {
    // 로그 추가
    console.log($('.hw_tab-content.active .hw_tab-item'));

    // 탭 전환 기능
    $('.hw_sub-tabs .hw_tab-button').on('click', function () {
        var tab = $(this).data('tab');
        $(this).siblings().removeClass('active');
        $(this).addClass('active');
        $(this).closest('.hw_section').find('.hw_tab-content').removeClass('active');
        $('#' + tab).addClass('active');
    });

    // 필터링 기능
    $('#filter-input').on('input', function () {
        var filterText = $(this).val().toLowerCase();
        $('.hw_tab-content.active .hw_tab-item').each(function () {
            var contentText = $(this).text().toLowerCase();
            if (contentText.includes(filterText)) {
                $(this).show();
            } else {
                $(this).hide();
            }
        });
    });

    // 드래그를 통한 스크롤 기능
    let isDown = false;
    let startX;
    let scrollLeft;

    const slider = $('.hw_scroll-container');

    slider.on('mousedown', function (e) {
        isDown = true;
        slider.addClass('active');
        startX = e.pageX - slider.offset().left;
        scrollLeft = slider.scrollLeft();
    });

    slider.on('mouseleave', function () {
        isDown = false;
        slider.removeClass('active');
    });

    slider.on('mouseup', function () {
        isDown = false;
        slider.removeClass('active');
    });

    slider.on('mousemove', function (e) {
        if (!isDown) return;
        e.preventDefault();
        const x = e.pageX - slider.offset().left;
        const walk = (x - startX) * 3; // 드래그 감도 조절
        slider.scrollLeft(scrollLeft - walk);
    });

    // 페이지 인디케이터 및 스크롤 동기화
    slider.on('scroll', debounce(function () {
        const sections = $('.hw_section');
        const indicators = $('.indicator');
        const sliderScrollLeft = slider.scrollLeft();
        const sliderWidth = slider.width();

        let closestSection = null;
        let closestDistance = Infinity;

        sections.each(function (index) {
            const sectionLeft = $(this).offset().left + sliderScrollLeft;
            const sectionCenter = sectionLeft + $(this).outerWidth() / 2;
            const distance = Math.abs(sectionCenter - (sliderScrollLeft + sliderWidth / 2));

            if (distance < closestDistance) {
                closestDistance = distance;
                closestSection = index;
            }
        });

        indicators.removeClass('active');
        indicators.eq(closestSection).addClass('active');
    }, 100)); // debounce 적용으로 성능 최적화

    slider.trigger('scroll');

    // 상세 정보 토글 기능
    $('.toggle-details').on('click', function () {
        const details = $(this).closest('.hw_tab-item').find('.guest-details');
        if (details.is(':visible')) {
            details.hide();
            $(this).text('見る');
        } else {
            details.show();
            $(this).text('閉じる');
        }
    });

    // 이전 페이지로 스크롤
    $('.prev-page').on('click', function () {
        slider.animate({ scrollLeft: '-=' + slider.width() }, 500);
    });

    // 다음 페이지로 스크롤
    $('.next-page').on('click', function () {
        slider.animate({ scrollLeft: '+=' + slider.width() }, 500);
    });

    // debounce 함수 정의 (성능 최적화)
    function debounce(func, wait) {
        let timeout;
        return function(...args) {
            clearTimeout(timeout);
            timeout = setTimeout(() => func.apply(this, args), wait);
        };
    }
});
