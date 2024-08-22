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

// 아래 뾰롱 JS 추가 부분
// Show
function showBottomSheet() {
    document.getElementById("actionSheet").classList.add("active");
}

// Hide
function hideBottomSheet() {
    document.getElementById("actionSheet").classList.remove("active");
}

