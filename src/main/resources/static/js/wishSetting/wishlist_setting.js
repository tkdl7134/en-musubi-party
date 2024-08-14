const presentChk = document.getElementById("je_present-switch");
const hiddenInput = document.getElementById("je_amazon-link");

presentChk.addEventListener("change", function () {
    if (presentChk.checked) {
        hiddenInput.classList.add("show");
    } else {
        hiddenInput.classList.remove("show");
    }
});

const fundingChk = document.getElementById("je_funding-switch");
const hiddenBtn = document.getElementById("je_nextpage-button");

fundingChk.addEventListener("change", function () {
    if (fundingChk.checked) {
        hiddenBtn.classList.add("show");
    } else {
        hiddenBtn.classList.remove("show");
    }
});
