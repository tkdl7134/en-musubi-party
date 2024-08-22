$(document).ready(function () {
    // 중첩된 탭 버튼 클릭 시 처리
    $('.hw_sub-tabs .hw_tab-button').on('click', function () {
        var tab = $(this).data('tab');

        // 현재 클릭된 탭 활성화
        $(this).siblings().removeClass('active');
        $(this).addClass('active');

        // 모든 중첩 탭 콘텐츠 숨기고, 해당하는 탭 콘텐츠만 보여줌
        $(this).closest('.hw_section').find('.hw_tab-content').removeClass('active');
        $('#' + tab).addClass('active');
    });

    // 필터링 기능 구현 (현재 활성화된 섹션에서 필터 적용)
    $('#filter-input').on('input', function () {
        var filterText = $(this).val().toLowerCase();

        // 현재 활성화된 탭에서 필터링 적용
        $('.hw_tab-content.active .hw_tab-item').each(function () {
            var contentText = $(this).text().toLowerCase();
            if (contentText.includes(filterText)) {
                $(this).show(); // 필터 텍스트가 포함된 콘텐츠 표시
            } else {
                $(this).hide(); // 포함되지 않은 콘텐츠 숨김
            }
        });
    });

    // 드래그로 스크롤 기능 추가
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
        const walk = (x - startX) * 3; // 스크롤 속도 조절
        slider.scrollLeft(scrollLeft - walk);
    });

    // 스크롤 이벤트로 섹션 감지 및 인디케이터 업데이트
    slider.on('scroll', function () {
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

        // 인디케이터 업데이트 (출석=0, 정보=1, 결석=2)
        indicators.removeClass('active');
        indicators.eq(closestSection).addClass('active');
    });

    // 초기 인디케이터 상태 설정
    slider.trigger('scroll');
});
