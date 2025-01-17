// 각 버튼 체크 시, 추가 요소
const moneyChk = document.getElementById("je_money-switch");
const moneyOk = document.getElementById("je_moneyOkMsg");
const moneyNo = document.getElementById("je_moneyNoMsg");

moneyChk.addEventListener("change", function () {
    if (moneyChk.checked) {
        moneyOKToast();
    } else {
        moneyNOToast();
    }
});

function moneyOKToast() {
    moneyOk.classList.add("show");
    setTimeout(function () {
        moneyOk.classList.remove("show");
    }, 2000);
}
function moneyNOToast() {
    moneyNo.classList.add("show");
    setTimeout(function () {
        moneyNo.classList.remove("show");
    }, 2000);
}

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



// AMAZON 입력창 관련
const amazonInput = document.getElementById("amazonLink");
    if (amazonInput.value === "https://www.amazon.co.jp/"){
        amazonInput.value = "";
        amazonInput.placeholder = "Amazon「ほしい物リスト」のURL";
    } else {
        amazonInput.placeholder = "";

    }


// AMAZON-LINK 등록(비동기)
function updateAmazonLink(e_no){
      const e_amazon = document.querySelector("#amazonLink");

      const obj = {
          e_amazon : e_amazon.value
      };
      console.log(obj)

      fetch(`/${e_no}/wishlist-setting`, {
          method: 'PUT',
          headers: {
              'Content-Type': 'application/json'
          },
          body: JSON.stringify(obj)
      }).then(result => {
              console.log(result);
              // 성공 이미지 표시
              const successImg = document.getElementById('checkIcon');
              successImg.style.display = 'block';
              setTimeout(() => {
                  successImg.style.display = 'none';
              }, 1100);

          })

}