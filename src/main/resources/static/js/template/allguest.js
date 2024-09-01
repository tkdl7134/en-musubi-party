$(document).ready(function () {
    console.log($('.hw_tab-content.active .hw_tab-item'));

    $('.hw_sub-tabs .hw_tab-button').on('click', function () {
        var tab = $(this).data('tab');
        $(this).siblings().removeClass('active');
        $(this).addClass('active');
        $(this).closest('.hw_section').find('.hw_tab-content').removeClass('active');
        $('#' + tab).addClass('active');
    });

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
        const walk = (x - startX) * 3;
        slider.scrollLeft(scrollLeft - walk);
    });

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

    $('.toggle-details').on('click', function () {
        const details = $(this).closest('.hw_tab-item').find('.guest-details');
        if (details.is(':visible')) {
            details.slideUp();
            $(this).text('見る');
        } else {
            details.slideDown();
            $(this).text('閉じる');
        }
    });

    $('.prev-page').on('click', function () {
        slider.animate({scrollLeft: '-=' + slider.width()}, 500, 'swing');  // 'swing' 애니메이션 추가
    });

    $('.next-page').on('click', function () {
        slider.animate({scrollLeft: '+=' + slider.width()}, 500, 'swing');  // 'swing' 애니메이션 추가
    });

    function debounce(func, wait) {
        let timeout;
        return function (...args) {
            clearTimeout(timeout);
            timeout = setTimeout(() => func.apply(this, args), wait);
        };
    }
});
