const e_no = document.querySelector("#eventNo").value;
console.log(e_no);
window.onload = () => {
    loadFundingList(e_no);
    insertFunding(e_no)
}
window.onscroll = function () {
    checkScroll();
};


// CRUD
function loadFundingList(e_no){
    fetch(`/${e_no}/wishlist-setting/funding/all`)
        .then(response => response.json())
        .then(allFundingWish => {
            const fundingList = document.querySelector("#existing-fundingList");

            // 다시 로드할 때 기존 값 초기화
            fundingList.innerHTML = '';

            allFundingWish.forEach(funding => {
                const item = document.querySelector(".item.temp").cloneNode(true);
                // 데이터 삽입
                item.querySelector('.je_funding-name').innerText = funding.wl_product;
                item.querySelector('.je_funding-price input').placeholder = funding.wl_price + '　円';

                item.classList.remove('temp');
                fundingList.appendChild(item);

                // update button 활성화
                item.querySelector('#fundingItem-update-button').addEventListener("click", () => {
                    console.log(funding.wl_no);
                    updateFunding(e_no, funding.wl_no);
                });

                // delete button 활성화
                item.querySelector('#fundingItem-delete-button').addEventListener("click", () => {
                    delete_confirm('削除してもよろしいですか？', funding.wl_product, funding.wl_no);
                    // deleteFunding(e_no, funding.wl_no);
                });

            })
        })
}

function insertFunding(e_no){
    const itemNameEl = document.querySelector("#fundingItem-name");
    const itemPriceEl = document.querySelector("#fundingItem-price");
    const insertBtn = document.querySelector("#fundingItem-insert-button");

    insertBtn.addEventListener("click", () => {
        const obj = {
            wl_product : itemNameEl.value,
            wl_price : itemPriceEl.value,
            e_no : e_no
        }
        console.log(obj);

        fetch(`/${e_no}/wishlist-setting/funding`, {
            method : "POST",
            headers : {
                'Content-Type' : 'application/json'
            },
            body: JSON.stringify(obj)
        }).then(response=> {
            console.log('성공')
            loadFundingList(e_no);
            itemNameEl.value = '';
            itemPriceEl.value = '';
        })
    });
}

function updateFunding(e_no, wl_no){
    const newPrice = document.querySelector("#new-price").value;
    const obj = {
        wl_price : newPrice
    };
    console.log(obj)

    fetch(`/${e_no}/wishlist-setting/funding/${wl_no}`, {
        method: 'PUT',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(obj)
    }).then(response => response.json())
        .then(result => {
            console.log(result)
            loadFundingList(e_no)
        })
}

function deleteFunding(e_no, wl_no){

    fetch(`/${e_no}/wishlist-setting/funding/${wl_no}`, {
        method: 'DELETE',
        headers : {
            'Content-Type' : 'application/json'
        }
    }).then(response => response.json())
        .then(result => {
            loadFundingList(e_no)
        })
}


// TOP button

function checkScroll() {
    const scrollToTopBtn = document.getElementById("scrollToTopBtn");

    if (document.body.scrollTop > 100 || document.documentElement.scrollTop > 100) {
        // scrollToTopBtn.classList.remove("hide");
        scrollToTopBtn.classList.add("show"); // 스크롤이 일정 수준을 넘으면 버튼이 부드럽게 나타남
    } else {
        scrollToTopBtn.classList.remove("show");
    }
}

// 버튼 클릭 시 페이지 맨 위로 부드럽게 스크롤
document.getElementById("scrollToTopBtn").onclick = function() {
    window.scrollTo({
        top: 0,
        behavior: 'smooth' // 부드럽게 스크롤 이동
    });

    setTimeout(() => {
        document.getElementById("scrollToTopBtn").classList.remove("show");
    }, 1000); // 스크롤이 끝난 후 버튼이 부드럽게 사라짐
};


// delete_confirm
function customConfirm(message, productName, callback) {
    // 대화 상자를 HTML 요소로 생성(동적)
    var confirmBox = document.createElement("div");
    confirmBox.setAttribute("class", "je_confirm-box");
    confirmBox.innerHTML =
        '<div class="je_confirm-message">' +
        "<div> " +
        productName +
        "</div>" +
        "<div>" +
        message +
        "</div>" +
        "</div>" +
        '<div class="je_confirm-buttons"><button class="confirm">削除</button><button class="cancel">キャンセル</button></div>';

    // HTML 요소를 body 요소의 하위 요소로 추가합니다.
    document.body.appendChild(confirmBox);

    // 배경을 회색으로 덮어서 모달 창을 띄웠을 때 다른 요소들을 클릭할 수 없도록 제어
    var overlay = document.createElement("div");
    overlay.setAttribute("class", "je_confirmbox-overlay");
    document.body.appendChild(overlay);

    var removeAlert = function () {
        document.body.removeChild(confirmBox);
        document.body.removeChild(overlay);
        window.removeEventListener("keydown", handleKeyDown);
    };

    var handleKeyDown = function (event) {
        event.preventDefault();
    };

    return new Promise(function (resolve) {
        // 확인 버튼을 클릭했을 때 이벤트
        var confirmButton = document.querySelector(".confirm");
        confirmButton.addEventListener("click", function () {
            // 확인 버튼을 눌렀을 때 resolve 메서드를 호출
            removeAlert();
            setTimeout(function () {
                resolve(true);
            }, 100);
        });

        // 취소 버튼을 클릭했을 때 이벤트
        var cancelButton = document.querySelector(".cancel");
        cancelButton.addEventListener("click", function () {
            // 취소 버튼을 눌렀을 때 resolve 메서드를 호출
            removeAlert();
            setTimeout(function () {
                resolve(false);
            }, 100);
        });

        // 회색 영역 클릭할 때 창을 닫도록 이벤트 추가
        overlay.addEventListener("click", function () {
            removeAlert();
        });

        // 키를 눌렀을 때 기본 동작을 막습니다.
        window.addEventListener("keydown", handleKeyDown);
    });
}

// 함수 호출
function delete_confirm(message, productName, wl_no) {
    customConfirm(message, productName).then(function (result) {
        if (result) {
            console.log(wl_no);
            deleteFunding(e_no, wl_no);
        } else {
        }
    });
}