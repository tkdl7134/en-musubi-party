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
    const enPartyEnvelopeTop = document.querySelector(
        ".main-enParty-envelope-top"
    );
    const enPartyEnvelopePaper = document.querySelector(
        ".main-enParty-envelope-paper"
    );
    const enPartyEnvelopeText = document.querySelector(
        ".main-enParty-envelope-text"
    );

    enPartyEnvelope.addEventListener("click", function () {
        // 팝업창에 주어진 이름을 변수로 던져 저장된 쿠키가 있는지 확인
        var popup1 = getCookie("enparty-info-popup");

        // 변수가 없을 경우 팝업 출력
        if (!popup1) {
            popUpAction("enparty-info-popup");
        } else {
            enPartyEnvelopeTop.classList.add("change-color");
            enPartyEnvelopePaper.classList.add("move-up");
            enPartyEnvelopeText.classList.add("enlarge");
            setTimeout(function () {
                window.location.href = "/r/join-user";
            }, 1000);
        }
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

        var m_id = document.getElementById('memberID').value;
        console.log(m_id); // 세션 값이 출력됩니다.
        setTimeout(function () {
            window.location.href = `/myInfo?m_id=${m_id}`;
        }, 1000);
    });

    userInfoEnvelopePaper.addEventListener("transitionend", function () {
        userInfoEnvelopeTop.classList.remove("change-color");
        userInfoEnvelopePaper.classList.remove("move-up");
        userInfoEnvelopeText.classList.remove("enlarge");
    });
});

// .main-invitationmanage-envelope -> 초대장 관리
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

        var m_id = document.getElementById('memberID').value;
        console.log(m_id); // 세션 값이 출력됩니다.

        setTimeout(function () {
            window.location.href = `/mypage/mytemplate/${m_id}`;
        }, 1000);
    });

    invitationmanageEnvelopePaper.addEventListener("transitionend", function () {
        invitationmanageEnvelopeTop.classList.remove("change-color");
        invitationmanageEnvelopePaper.classList.remove("move-up");
        invitationmanageEnvelopeText.classList.remove("enlarge");
    });
});

// .main-grouplist-envelope -> 참가한 이벤트 리스트
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

        var m_id = document.getElementById('memberID').value;
        console.log(m_id); // 세션 값이 출력됩니다.
        setTimeout(function () {
            window.location.href =`/mypage/grouplist/${m_id}`;
        }, 1000);
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


//POPUP - 오늘 하루 보지 않기
$(document).ready(function () {
    $(".main_pop").click(function () {
        $(this).fadeOut();
    });

    // .main_notice_pop 영역 클릭 시 이벤트 전파 중지
    $(".main_notice_pop").click(function (event) {
        event.stopPropagation();
    });

    // 닫기버튼 클릭 이벤트
    $(".btn_close").click(function () {
        $(this).parent().parent().parent(".main_pop").fadeOut();

        // 오늘하루 보지않기 체크 확인
        if ($("input:checkbox[name=today_close1]").is(":checked") == true) {
            setCookie00("enparty-info-popup", "done", 1);
        }
    });
});

function cookieChk() {}

// 쿠키 가져오기
function getCookie(name) {
    var nameOfCookie = name + "=";
    var x = 0;
    while (x <= document.cookie.length) {
        var y = x + nameOfCookie.length;

        if (document.cookie.substring(x, y) == nameOfCookie) {
            if ((endOfCookie = document.cookie.indexOf(";", y)) == -1)
                endOfCookie = document.cookie.length;
            return unescape(document.cookie.substring(y, endOfCookie));
        }

        x = document.cookie.indexOf(" ", x) + 1;

        if (x == 0) break;
    }

    return "";
}

// 24시간 기준 쿠키 설정하기
// expiredays 후의 클릭한 시간까지 쿠키 설정
function setCookie24(name, value, expiredays) {
    var todayDate = new Date();

    todayDate.setDate(todayDate.getDate() + expiredays);

    document.cookie =
        name +
        "=" +
        escape(value) +
        "; path=/; expires=" +
        todayDate.toGMTString() +
        ";";
}

// 00:00 시 기준 쿠키 설정하기
// expiredays 의 새벽 00:00:00 까지 쿠키 설정
function setCookie00(name, value, expiredays) {
    var todayDate = new Date();
    todayDate = new Date(
        parseInt(todayDate.getTime() / 86400000) * 86400000 + 54000000
    );

    if (todayDate > new Date()) {
        expiredays = expiredays - 1;
    }

    todayDate.setDate(todayDate.getDate() + expiredays);

    document.cookie =
        name +
        "=" +
        escape(value) +
        "; path=/; expires=" +
        todayDate.toGMTString() +
        ";";
}

// 팝업출력
function popUpAction(name) {
    // name으로 해당 팝업창 열기
    console.log("아직 보임");
    $("div[name=" + name + "]").fadeIn();
}
