$(document).ready(function () {
    // 현재 페이지 URL에 따라 select 필드에서 선택된 옵션 설정
    var currentPage = window.location.pathname.split("/").pop();
    $('#dropdown-select option[value="' + currentPage + '"]').prop('selected', true);

    // 선택한 옵션에 따라 페이지 이동
    $('#dropdown-select').change(function () {
        var selectedPage = $(this).val();
        if (selectedPage) {
            window.location.href = selectedPage; // 선택된 값으로 페이지 이동
        }
    });

    // 탭 버튼 클릭 시 처리
    $('.hw_tab-button').on('click', function () {
        $('.hw_tab-button').removeClass('active');
        $(this).addClass('active');

        var tabType = $(this).text(); // 탭 버튼의 텍스트를 가져옴 (전체, 신郎, 신부)

        if (tabType === '全体') {
            $('.hw_tab-content').show(); // 전체를 보여줌
        } else {
            $('.hw_tab-content').hide(); // 모든 콘텐츠를 숨기고
            $('.hw_tab-content[data-type*="' + tabType + '"]').show(); // 선택된 유형만 표시
        }
    });

    // 초기 로드 시 전체 탭의 데이터를 표시
    $('.hw_tab-button.active').click();

    // "더보기" 버튼 클릭 시 처리
    $("#more").click(function () {
        $(".hw_detail-guest").toggle(); // 모든 숨겨진 콘텐츠를 토글
        if ($(".hw_detail-guest:visible").length > 0) {
            $("#more").text("접기"); // 표시되면 버튼 텍스트를 "접기"로 변경
        } else {
            $("#more").text("더보기"); // 숨겨지면 버튼 텍스트를 "더보기"로 변경
        }
    });

    // 필터링 기능 구현 (전체 탭에서도 적용)
    $('#filter-input').on('input', function () {
        var filterText = $(this).val().toLowerCase();

        $('.hw_tab-content').each(function () {
            var contentType = $(this).data('type').toLowerCase();
            var contentText = $(this).text().toLowerCase();

            if (contentText.includes(filterText) || contentType.includes(filterText)) {
                $(this).show(); // 필터 텍스트가 포함된 콘텐츠 표시
            } else {
                $(this).hide(); // 포함되지 않은 콘텐츠 숨김
            }
        });
    });
});
