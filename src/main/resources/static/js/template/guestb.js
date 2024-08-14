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
    $('.hw_tab-button').each(function (index) {
        $(this).on('click', function () {
            $('.hw_tab-button').removeClass('active');
            $(this).addClass('active');
            $('.hw_tab-button-content').removeClass('show');
            $('.hw_tab-button-content').eq(index).addClass('show');
        });
    });

    // 全体 버튼 클릭 시 정렬
    let sortOrder = 'asc';
    $('#all-button').on('click', function () {
        let guestList = $('#guest-list .hw_tab-content').get();
        guestList.sort(function(a, b) {
            let nameA = $(a).find('span:first').text().toUpperCase();
            let nameB = $(b).find('span:first').text().toUpperCase();
            if (sortOrder === 'asc') {
                return (nameA > nameB) ? 1 : (nameA < nameB) ? -1 : 0;
            } else {
                return (nameA < nameB) ? 1 : (nameA > nameB) ? -1 : 0;
            }
        });
        sortOrder = sortOrder === 'asc' ? 'desc' : 'asc';
        $('#guest-list').html(guestList);
    });

    // 新郎 버튼 클릭 시 필터링
    $('#groom-button').on('click', function () {
        $('.hw_tab-content').hide();
        $('.hw_tab-content[data-type="新郎"]').show();
    });

    // 新婦 버튼 클릭 시 필터링
    $('#bride-button').on('click', function () {
        $('.hw_tab-content').hide();
        $('.hw_tab-content[data-type="新婦"]').show();
    });

    // 초기 로드 시 新郎 탭 데이터만 표시
    $('#groom-button').click();

    // "더보기" 버튼 클릭 시 처리
    $("#more").click(function () {
        $(".hw_detail-guest").toggle(); // 모든 숨겨진 콘텐츠를 토글
        if ($(".hw_detail-guest:visible").length > 0) {
            $("#more").text("접기"); // 표시되면 버튼 텍스트를 "접기"로 변경
        } else {
            $("#more").text("더보기"); // 숨겨지면 버튼 텍스트를 "더보기"로 변경
        }
    });
});
