// 해당 div 누르면 input 창 활성화
function addClickListener(boxID, photoID) {
    document.getElementById(boxID).addEventListener("click", function () {
        document.getElementById(photoID).click();
    });
}

addClickListener("myInfoUpdate-profile-container", "newProfile");

// div에 띄우기
function handleFileInputChange(event, outputId) {
    const file = event.target.files[0];
    if (file) {
        const reader = new FileReader();
        reader.onload = function (e) {
            const img = document.createElement("img");
            img.src = e.target.result;

            const imageDisplay = document.getElementById(outputId);

            // 기존이미지 제거
            imageDisplay.innerHTML = "";

            imageDisplay.appendChild(img);
        };
        reader.readAsDataURL(file);
    }
}

document
    .getElementById("newProfile")
    .addEventListener("change", function (event) {
        handleFileInputChange(event, "myInfoUpdate-profile");
    });

function toggleDeleteButton() {
    var deleteButtonContainer = document.getElementById('myInfo-account-delete');
    if (deleteButtonContainer.style.display === 'none' || deleteButtonContainer.style.display === '') {
        deleteButtonContainer.style.display = 'block';
    } else {
        deleteButtonContainer.style.display = 'none';
    }
}

// function deleteCheck(ID) {
//
//     console.log(ID)
//
//     // confirm 함수의 반환값을 ok 변수에 저장
//     let ok = confirm('정말로 삭제하시겠습니까?');
//
//     // 사용자가 '확인'을 누르면 true가 반환되고, '취소'를 누르면 false가 반환됩니다.
//     if (ok) {
//         // 사용자가 확인을 누른 경우 해당 URL로 이동 (삭제 처리)
//         location.href = '/myInfo-delete/' + ID;
//     } else {
//         // 사용자가 취소를 누른 경우 아무런 동작도 하지 않습니다.
//         // 추가적인 작업이 필요하면 여기에 추가할 수 있습니다.
//     }
// }


// delete_confirm
function customConfirm(message, callback) {
    var confirmBox = document.createElement("div");
    confirmBox.setAttribute("class", "je_confirm-box");
    confirmBox.innerHTML =
        '<div class="je_confirm-message">' +
        '<div>' +
        '</div>' +
        '<div>' +
        message +
        '</div>' +
        '</div>' +
        '<div class="je_confirm-buttons"><button class="confirm">削除</button><button class="cancel">キャンセル</button></div>';

    document.body.appendChild(confirmBox);

    var overlay = document.createElement("div");
    overlay.setAttribute("class", "je_confirmbox-overlay");
    document.body.appendChild(overlay);

    // 화면에 부드럽게 나타나도록 클래스를 추가
    setTimeout(() => {
        confirmBox.classList.add("show");
        overlay.classList.add("show");
    }, 10); // 약간의 지연 후 클래스 추가

    var removeAlert = function () {
        confirmBox.classList.remove("show");
        overlay.classList.remove("show");
        setTimeout(() => {
            document.body.removeChild(confirmBox);
            document.body.removeChild(overlay);
        }, 300); // CSS의 전환 시간과 맞추기 위해 지연 후 제거
        window.removeEventListener("keydown", handleKeyDown);
    };

    var handleKeyDown = function (event) {
        event.preventDefault();
    };

    return new Promise(function (resolve) {
        var confirmButton = document.querySelector(".confirm");
        confirmButton.addEventListener("click", function () {
            removeAlert();
            setTimeout(function () {
                resolve(true);
            }, 100);
        });

        var cancelButton = document.querySelector(".cancel");
        cancelButton.addEventListener("click", function () {
            removeAlert();
            setTimeout(function () {
                resolve(false);
            }, 100);
        });

        overlay.addEventListener("click", function () {
            removeAlert();
        });

        window.addEventListener("keydown", handleKeyDown);
    });
}

// 함수 호출
function delete_confirm(message, ID) {
    customConfirm(message).then(function (result) {
        if (result) {
            location.href = '/myInfo-delete/' + ID;
        } else {
        }
    });
}


