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


/*------------------------------------------------------*/
// 첨부파일 리스트 보여주기
const share_photo = document.querySelector("input[name='w_img_share_files']");

function addFile(obj) {
    var files = obj.files;
    var htmlData = "";
    var curFileCnt = files.length;

    // 첨부파일 개수 확인
    if (9 < curFileCnt) {
        share_photo.value = "";
        return filesCntToastOn();
    }

    for (var i = 0; i < files.length; i++) {
        const file = files[i];

        // 첨부파일 검증
        if (validChk(file)) {
            htmlData += '<div id="je_file' + i + '" class="je_filebox">';
            htmlData += '   <p class="je_file-name">' + file.name + "</p>";
            // htmlData +=
            //   '   <a class="je_file-delete" onclick="deleteFile(' + i + ');">⌫</a>';
            htmlData += "</div>";
        } else {
            share_photo.value = "";
            return false;
        }
    }

    document.querySelector(".je_photo-list").innerHTML = htmlData;
}

// 유효성 검사
function validChk(obj) {
    const fileTypes = ["image/gif", "image/jpeg", "image/jpg", "image/png"];
    if (obj.name.length > 50) {
        return filesToastOn();
        return false;
    } else if (obj.size > 10 * 1024 * 1024) {
        return filesToastOn();
    } else if (obj.name.lastIndexOf(".") == -1) {
        return TypeToastOn();
    } else if (!fileTypes.includes(obj.type)) {
        return TypeToastOn();
    } else {
        return true;
    }
}



const m_photo1 = document.querySelector("input[name='w_img1_file']");
const m_photo2 = document.querySelector("input[name='w_img2_file']");
const m_photo3 = document.querySelector("input[name='w_img3_file']");

// 메인 사진 확장자 체크
function photoType1(){
    if (isNotType(m_photo1, "jpg") && isNotType(m_photo1, "png") && isNotType(m_photo1, "jpeg")) {
        m_photo1.value = "";
        return TypeToastOn();
    }
}
function photoType2(){
    if (isNotType(m_photo2, "jpg") && isNotType(m_photo2, "png") && isNotType(m_photo2, "jpeg")) {
        m_photo2.value = "";
        return TypeToastOn();
    }
}
function photoType3(){
    if (isNotType(m_photo3, "jpg") && isNotType(m_photo3, "png") && isNotType(m_photo3, "jpeg")) {
        m_photo3.value = "";
        return TypeToastOn();
    }
}


// FILE - ALERT BUTTON
var typeWarning = document.getElementById("typeWarning-msg");
function TypeToastOn() {
    typeWarning.classList.add("active");
    setTimeout(function () {
        typeWarning.classList.remove("active");
    }, 3000);
    return false;
}

var filesWarning = document.getElementById("filesWarning-msg");
function filesToastOn() {
    filesWarning.classList.add("active");
    setTimeout(function () {
        filesWarning.classList.remove("active");
    }, 3000);
    return false;
}

var filesCntWarning = document.getElementById("filesCntWarning-msg");
function filesCntToastOn() {
    filesCntWarning.classList.add("active");
    setTimeout(function () {
        filesCntWarning.classList.remove("active");
    }, 3000);
    return false;
}

