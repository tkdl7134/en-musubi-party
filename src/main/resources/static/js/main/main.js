// .main-enMusubi-envelope -> 정은언니 페이지로
document.addEventListener("DOMContentLoaded", function () {

    const enMusubiEnvelope = document.querySelector(".main-enMusubi-envelope");
    const enMusubiEnvelopeTop = document.querySelector(".main-enMusubi-envelope-top");
    const enMusubiEnvelopePaper = document.querySelector(".main-enMusubi-envelope-paper");
    const enMusubiEnvelopeText = document.querySelector(".main-enMusubi-envelope-text");

    enMusubiEnvelope.addEventListener("click", function () {
        enMusubiEnvelopeTop.classList.add("change-color");
        enMusubiEnvelopePaper.classList.add("move-up");
        enMusubiEnvelopeText.classList.add("enlarge");
        setTimeout(function () {
            window.location.href = "/product";
        }, 1000);
    });

    enMusubiEnvelopePaper.addEventListener("transitionend", function () {
        enMusubiEnvelopeTop.classList.remove("change-color");
        enMusubiEnvelopePaper.classList.remove("move-up");
        enMusubiEnvelopeText.classList.remove("enlarge");
    });

});

// .main-enParty-envelope -> 엔파티 소개 페이지로
document.addEventListener("DOMContentLoaded", function () {

    const enPartyEnvelope = document.querySelector(".main-enParty-envelope");
    const enPartyEnvelopeTop = document.querySelector(".main-enParty-envelope-top");
    const enPartyEnvelopePaper = document.querySelector(".main-enParty-envelope-paper");
    const enPartyEnvelopeText = document.querySelector(".main-enParty-envelope-text");

    enPartyEnvelope.addEventListener("click", function () {
        enPartyEnvelopeTop.classList.add("change-color")
        enPartyEnvelopePaper.classList.add("move-up")
        enPartyEnvelopeText.classList.add("enlarge")
        setTimeout(function () {
            window.location.href = "/";
        }, 1000);
    });

    enPartyEnvelopePaper.addEventListener("transitionend", function () {
        enPartyEnvelopeTop.classList.remove("change-color");
        enPartyEnvelopePaper.classList.remove("move-up");
        enPartyEnvelopeText.classList.remove("enlarge");
    });

});


// .main-userinfo-envelope -> 회원정보수정 페이지로
document.addEventListener("DOMContentLoaded", function () {
    const userInfoEnvelope = document.querySelector(".main-userinfo-envelope");
    const userInfoEnvelopeTop = document.querySelector(
        ".main-userinfo-envelope-top"
    );
    const userInfoEnvelopePaper = document.querySelector(
        ".main-userinfo-envelope-paper"
    );
    const userInfoEnvelopeText = document.querySelector(
        ".main-userinfo-envelope-text"
    );

    userInfoEnvelope.addEventListener("click", function () {
        userInfoEnvelopeTop.classList.add("change-color");
        userInfoEnvelopePaper.classList.add("move-up");
        userInfoEnvelopeText.classList.add("enlarge");
        setTimeout(function () {
            window.location.href = "/???";
        }, 2000);
    });

    userInfoEnvelopePaper.addEventListener("transitionend", function () {
        userInfoEnvelopeTop.classList.remove("change-color");
        userInfoEnvelopePaper.classList.remove("move-up");
        userInfoEnvelopeText.classList.remove("enlarge");
    });
});

// .main-invitationmanage-envelope -> 회원정보수정 페이지로
document.addEventListener("DOMContentLoaded", function () {
    const invitationmanageEnvelope = document.querySelector(
        ".main-invitationmanage-envelope"
    );
    const invitationmanageEnvelopeTop = document.querySelector(
        ".main-invitationmanage-envelope-top"
    );
    const invitationmanageEnvelopePaper = document.querySelector(
        ".main-invitationmanage-envelope-paper"
    );
    const invitationmanageEnvelopeText = document.querySelector(
        ".main-invitationmanage-envelope-text"
    );

    invitationmanageEnvelope.addEventListener("click", function () {
        invitationmanageEnvelopeTop.classList.add("change-color");
        invitationmanageEnvelopePaper.classList.add("move-up");
        invitationmanageEnvelopeText.classList.add("enlarge");
        setTimeout(function () {
            window.location.href = "/???";
        }, 2000);
    });

    invitationmanageEnvelopePaper.addEventListener("transitionend", function () {
        invitationmanageEnvelopeTop.classList.remove("change-color");
        invitationmanageEnvelopePaper.classList.remove("move-up");
        invitationmanageEnvelopeText.classList.remove("enlarge");
    });
});

// .main-grouplist-envelope -> 회원정보수정 페이지로
document.addEventListener("DOMContentLoaded", function () {
    const grouplistEnvelope = document.querySelector(".main-grouplist-envelope");
    const grouplistEnvelopeTop = document.querySelector(
        ".main-grouplist-envelope-top"
    );
    const grouplistEnvelopePaper = document.querySelector(
        ".main-grouplist-envelope-paper"
    );
    const grouplistEnvelopeText = document.querySelector(
        ".main-grouplist-envelope-text"
    );

    grouplistEnvelope.addEventListener("click", function () {
        grouplistEnvelopeTop.classList.add("change-color");
        grouplistEnvelopePaper.classList.add("move-up");
        grouplistEnvelopeText.classList.add("enlarge");
        setTimeout(function () {
            window.location.href = "/???";
        }, 2000);
    });

    grouplistEnvelopePaper.addEventListener("transitionend", function () {
        grouplistEnvelopeTop.classList.remove("change-color");
        grouplistEnvelopePaper.classList.remove("move-up");
        grouplistEnvelopeText.classList.remove("enlarge");
    });
});

// 아래 뾰롱 (추가)
// 로그인 / 회원가입
function showBottomSheet() {
    document.getElementById("actionSheet").classList.add("active");
}
function hideBottomSheet() {
    document.getElementById("actionSheet").classList.remove("active");
}

// myPage Sheet
function showMypageSheet() {
    document.getElementById("mypageSheet").classList.add("active");
}
function hideMypageSheet() {
    document.getElementById("mypageSheet").classList.remove("active");
}