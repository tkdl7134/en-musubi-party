function deleteCheck(ID) {

    console.log(ID)

    // confirm 함수의 반환값을 ok 변수에 저장
    let ok = confirm('정말로 삭제하시겠습니까?');

    // 사용자가 '확인'을 누르면 true가 반환되고, '취소'를 누르면 false가 반환됩니다.
    if (ok) {
        // 사용자가 확인을 누른 경우 해당 URL로 이동 (삭제 처리)
        location.href = '/myInfo-delete/' + ID;
    } else {
        // 사용자가 취소를 누른 경우 아무런 동작도 하지 않습니다.
        // 추가적인 작업이 필요하면 여기에 추가할 수 있습니다.
    }
}