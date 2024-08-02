$(document).ready(function(){
    for(let i = 0; i < $('.hw_tab-button').length; i++){
        $('.hw_tab-button').eq(i).on('click',function(){
            $('.hw_tab-button').removeClass('active');
            $('.hw_tab-button').eq(i).addClass('active');
            $('.hw_tab-button-content').removeClass('show');
            $('.hw_tab-button-content').eq(i).addClass('show');
        });
    }
    $(function(){
        $(".hw_detail-guest").slice(0, 0).show(); // 초기갯수
        $("#more").click(function(e){ // 클릭시 more
            e.preventDefault();
            $(".hw_detail-guest:hidden").slice(0, 1).show(); // 클릭시 more 갯수 지저정
            if($(".hw_detail-guest:hidden").length == 0){ // 컨텐츠 남아있는지 확인
                alert("게시물의 끝입니다."); // 컨텐츠 없을시 alert 창 띄우기
            }
        });
    });



});
