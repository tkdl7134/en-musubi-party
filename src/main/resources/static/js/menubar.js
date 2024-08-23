// Action Sheet
function showActionSheet() {
    // document.getElementById("actionSheet-div").classList.add("active");
    document.getElementById("actionSheet").classList.add("active");
}
function hideActionSheet() {
    // document.getElementById("actionSheet-div").classList.remove("active");
    document.getElementById("actionSheet").classList.remove("active");
}

// mypage 내려오는 메뉴
const mypageBtn = document.getElementById("user-mypage-button");
const mypageMenu = document.getElementById("user-mypage-menuBox");

mypageBtn.addEventListener("click", function (){
    if (mypageMenu.classList.contains("show")){
            mypageMenu.classList.remove("show");
    } else{
        mypageMenu.classList.add("show");
    }
});



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
});

