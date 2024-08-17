$(document).ready(function () {
    // 최상위 탭 버튼 클릭 시 처리
    $('.hw_top-tabs .hw_tab-button').on('click', function () {
        var tab = $(this).data('tab');

        // 현재 클릭된 탭 활성화
        $('.hw_top-tabs .hw_tab-button').removeClass('active');
        $(this).addClass('active');

        // 모든 탭 콘텐츠 숨기고, 해당하는 탭 콘텐츠만 보여줌
        $('.hw_content > .hw_tab-content').removeClass('active');
        $('#' + tab).addClass('active');
    });

    // 중첩된 탭 버튼 클릭 시 처리
    $('.hw_sub-tabs .hw_tab-button').on('click', function () {
        var tab = $(this).data('tab');

        // 현재 클릭된 탭 활성화
        $(this).siblings().removeClass('active');
        $(this).addClass('active');

        // 모든 중첩 탭 콘텐츠 숨기고, 해당하는 탭 콘텐츠만 보여줌
        $(this).closest('.hw_tab-content').find('> .hw_tab-content').removeClass('active');
        $('#' + tab).addClass('active');
    });

    // 필터링 기능 구현 (현재 활성화된 탭에서만 필터 적용)
    $('#filter-input').on('input', function () {
        var filterText = $(this).val().toLowerCase();

        // 현재 활성화된 최상위 탭에서 필터링 적용
        $('.hw_tab-content.active .hw_tab-item').each(function () {
            var contentText = $(this).text().toLowerCase();
            if (contentText.includes(filterText)) {
                $(this).show(); // 필터 텍스트가 포함된 콘텐츠 표시
            } else {
                $(this).hide(); // 포함되지 않은 콘텐츠 숨김
            }
        });
    });
});
