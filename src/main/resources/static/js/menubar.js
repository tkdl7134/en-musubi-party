// Action Sheet 보이기
function showActionSheet() {
    // document.getElementById("actionSheet-div").classList.add("active");
    document.getElementById("actionSheet").classList.add("active");
}

// Action Sheet 감추기
function hideActionSheet() {
    // document.getElementById("actionSheet-div").classList.remove("active");
    document.getElementById("actionSheet").classList.remove("active");
}

// 각 옵션 클릭 시 처리
// function handleOption(option) {
//     // 여기에 옵션 클릭 시 로직 작성
//     alert("Selected Option: " + option);
//     // Action Sheet 감추기
//     hideActionSheet();
// }

document.getElementById('logout-button').addEventListener('click', function (){
    fetch('/session/invalidate', {
        method: 'GET'
    }).then(response => {
        console.log(response)
        if (response.ok) {
            window.location.href = '/'
        } else{
            console.log('세션만료 실패');
        }
    })
        .catch(error => {
            console.error('오류발생', error);
        })
})