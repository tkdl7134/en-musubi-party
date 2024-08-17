// 해당 div 누르면 input 창 활성화
function addClickListener(boxId, photoId) {
    document.getElementById(boxId).addEventListener("click", function () {
        document.getElementById(photoId).click();
    });
}
addClickListener("je_photobox1", "je_photoInput1");
addClickListener("je_photobox2", "je_photoInput2");
addClickListener("je_photobox3", "je_photoInput3");

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
    .getElementById("je_photoInput1")
    .addEventListener("change", function (event) {
        handleFileInputChange(event, "je_photoOut1");
    });
document
    .getElementById("je_photoInput2")
    .addEventListener("change", function (event) {
        handleFileInputChange(event, "je_photoOut2");
    });
document
    .getElementById("je_photoInput3")
    .addEventListener("change", function (event) {
        handleFileInputChange(event, "je_photoOut3");
    });


// 파일 여러개 업로드한 거 리스트 보여주기
var fileNo = 0;
var filesArr = [];

function addFile(obj) {
    var maxFileCnt = 9; // 첨부파일 최대 갯수
    var attFileCnt = document.querySelectorAll(".je_filebox").length; // 기존 추가된 첨부파일 개수
    var remainFileCnt = maxFileCnt - attFileCnt; // 추가 첨부 가능 개수
    var curFileCnt = obj.files.length;

    // 첨부파일 개수 확인
    if (curFileCnt > remainFileCnt) {
        alert("共有写真は最大" + maxFileCnt + "枚まで添付できます。");
    }

    for (var i = 0; i < Math.min(curFileCnt, remainFileCnt); i++) {
        const file = obj.files[i];

        // 첨부파일 검증
        if (validChk(file)) {
            // 파일 배열에 담기
            var reader = new FileReader();
            reader.onload = function () {
                filesArr.push(file);
            };
            reader.readAsDataURL(file);

            // 목록 추가
            var htmlData = '';
            htmlData += '<div id="je_file' + fileNo + '" class="je_filebox">';
            htmlData += '   <p class="je_file-name">' + file.name + "</p>";
            htmlData +=
                '   <a class="je_file-delete" onclick="deleteFile(' +
                fileNo +
                ');">⌫</a>';
            htmlData += "</div>";
            $(".je_photo-list").append(htmlData);
            fileNo++;
        } else {
            continue;
        }
    }
    //
    // // 초기화
    // document.querySelector("#je_photo-input").value = "";
}

// 파일 목록 업데이트 함수
function updateFileList(files) {
    files.forEach((file) => {
        filesArr.push(file);
    });
}

// 유효성 검사
function validChk(obj) {
    const fileTypes = ["image/gif", "image/jpeg", "image/jpg", "image/png"];
    if (obj.name.length > 50) {
        alert("ファイル名が50文字以上のものは除外されました。");
        return false;
    } else if (obj.size > 10 * 1024 * 1024) {
        alert("最大ファイル容量の 10MB を超えたものは除外されました。");
        return false;
    } else if (obj.name.lastIndexOf(".") == -1) {
        alert("拡張子のないファイルは除外されました。");
        return false;
    } else if (!fileTypes.includes(obj.type)) {
        alert("添付できないファイルは除外されました。");
        return false;
    } else {
        return true;
    }
}

// 첨부파일 삭제
function deleteFile(num) {
    document.querySelector("#je_file" + num).remove();
    filesArr[num].is_delete = true;

}

// 슬릭 슬라이드를 업데이트
function updateSlickSlider() {
    $(".je_photo-list").slick("refresh"); // 슬릭 슬라이드를 리프레시하여 즉시 반영
}

// 확정된 파일 리스트 담기
function setFilesList(event){

    event.preventDefault();
    console.log('폼제출 막음')

    var form = document.querySelector("form");
    var formData = new FormData(form);
    for (var i = 0; i < filesArr.length; i++) {
        // 삭제되지 않은 파일만 폼데이터에 담기
        if (!filesArr[i].is_delete) {
            formData.append("attach_file", filesArr[i]);
        }
    }

    // FormData를 폼에 직접 설정하여 제출
    var input = document.createElement("input");
    input.type = "hidden";
    input.name = "w_img_share_files";
    input.value = JSON.stringify([...formData.entries()]);
    form.appendChild(input);

    form.submit(); // 폼 제출
}


/*-----------------------------------------------------------------------------------------*/
// MODAL 창

// 초대문구
var invitation = document.getElementById("je_invitation-modal");
var invitationBtn = document.getElementById("je_invitation-button");
var invitationClose = document.getElementById("je_invitation-close");

// 마무리문구
var closing = document.getElementById("je_closing-modal");
var closingBtn = document.getElementById("je_closing-button");
var closingClose = document.getElementById("je_closing-close");

// 버튼 클릭 시 모달 열기
invitationBtn.onclick = function () {
    console.log('click');
    invitation.style.display = "block";
};

closingBtn.onclick = function () {
    closing.style.display = "block";
};

// 닫기 버튼 클릭 시 모달 닫기
invitationClose.onclick = function () {
    invitation.style.display = "none";
};

closingClose.onclick = function () {
    closing.style.display = "none";
};

// 모달 바깥 영역 클릭 시 모달 닫기
window.onclick = function (event) {
    if (event.target == invitation) {
        invitation.style.display = "none";
    } else if (event.target == closing) {
        closing.style.display = "none";
    }
};

/* modal 내, tab 메뉴 */
var themeBtn = document.querySelectorAll(".je_theme-buttons div");
var contents = document.querySelectorAll(".invitationM");

var themeBtn2 = document.querySelectorAll(".je_theme2-buttons div");
var contents2 = document.querySelectorAll(".closingM");
var activeBtn = null;

// 처음 화면 - 전체 나오게
for (let i = 0; i < contents.length; i++) {
    contents[i].classList.add("on");
}
for (let i = 0; i < contents2.length; i++) {
    contents2[i].classList.add("on");
}

function resetBtnColor() {
    if (activeBtn) {
        activeBtn.style.backgroundColor = "";
    }
}

// all 버튼
themeBtn[0].addEventListener("click", function () {
    resetBtnColor();
    activeBtn = this;
    activeBtn.style.backgroundColor = "#ffd1d0";
    for (let i = 0; i < contents.length; i++) {
        if (contents[i].classList.contains("invitationM") == false) {
            contents[i].classList.remove("on");
            console.log("실행");
        } else {
            contents[i].classList.add("on");
            console.log("미실행");
        }
    }
});
themeBtn2[0].addEventListener("click", function () {
    resetBtnColor();
    activeBtn = this;
    activeBtn.style.backgroundColor = "#ffd1d0";
    for (let i = 0; i < contents2.length; i++) {
        if (contents2[i].classList.contains("closingM") == false) {
            contents2[i].classList.remove("on");
            console.log("실행");
        } else {
            contents2[i].classList.add("on");
            console.log("미실행");
        }
    }
});

// 계절 버튼
themeBtn[1].addEventListener("click", function () {
    resetBtnColor();
    activeBtn = this;
    activeBtn.style.backgroundColor = "#ffd1d0";
    for (let i = 0; i < contents.length; i++) {
        if (contents[i].classList.contains("seasonsIM") == false) {
            contents[i].classList.remove("on");
            console.log("실행");
        } else {
            contents[i].classList.add("on");
            console.log("미실행");
        }
    }
});
themeBtn2[1].addEventListener("click", function () {
    resetBtnColor();
    activeBtn = this;
    activeBtn.style.backgroundColor = "#ffd1d0";
    for (let i = 0; i < contents2.length; i++) {
        if (contents2[i].classList.contains("seasonsCM") == false) {
            contents2[i].classList.remove("on");
            console.log("실행");
        } else {
            contents2[i].classList.add("on");
            console.log("미실행");
        }
    }
});

// 정중 버튼
themeBtn[2].addEventListener("click", function () {
    resetBtnColor();
    activeBtn = this;
    activeBtn.style.backgroundColor = "#ffd1d0";
    for (let i = 0; i < contents.length; i++) {
        if (contents[i].classList.contains("politeIM") == false) {
            contents[i].classList.remove("on");
        } else {
            contents[i].classList.add("on");
        }
    }
});
themeBtn2[2].addEventListener("click", function () {
    resetBtnColor();
    activeBtn = this;
    activeBtn.style.backgroundColor = "#ffd1d0";
    for (let i = 0; i < contents2.length; i++) {
        if (contents2[i].classList.contains("politeCM") == false) {
            contents2[i].classList.remove("on");
        } else {
            contents2[i].classList.add("on");
        }
    }
});

// 유머 버튼
themeBtn[3].addEventListener("click", function () {
    resetBtnColor();
    activeBtn = this;
    activeBtn.style.backgroundColor = "#ffd1d0";
    for (let i = 0; i < contents.length; i++) {
        if (contents[i].classList.contains("humorIM") == false) {
            contents[i].classList.remove("on");
        } else {
            contents[i].classList.add("on");
        }
    }
});
themeBtn2[3].addEventListener("click", function () {
    resetBtnColor();
    activeBtn = this;
    activeBtn.style.backgroundColor = "#ffd1d0";
    for (let i = 0; i < contents2.length; i++) {
        if (contents2[i].classList.contains("humorCM") == false) {
            contents2[i].classList.remove("on");
        } else {
            contents2[i].classList.add("on");
        }
    }
});

/*-----------------------------------------------------------------------------------------*/
/* modal >> textarea */
// invitation
document.addEventListener("DOMContentLoaded", function () {
    var invitationSendBtn = document.querySelectorAll(".je_invitation-sendBtn");
    var i_textarea = document.getElementById("je_invitation-textarea");

    invitationSendBtn.forEach(function (btn) {
        btn.addEventListener("click", function () {
            var messageText = this.closest(".je_theme-message-box").querySelector(
                ".je_message-txt"
            ).innerText;
            i_textarea.value = messageText;
            invitation.style.display = "none";
        });
    });
});

// closing
document.addEventListener("DOMContentLoaded", function () {
    var closingSendBtn = document.querySelectorAll(".je_closing-sendBtn");
    var c_textarea = document.getElementById("je_closing-textarea");

    closingSendBtn.forEach(function (btn) {
        btn.addEventListener("click", function () {
            var messageText = this.closest(".je_theme-message-box").querySelector(
                ".je_message-txt"
            ).innerText;
            c_textarea.value = messageText;
            closing.style.display = "none";
        });
    });
});
