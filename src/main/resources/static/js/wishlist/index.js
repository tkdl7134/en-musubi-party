function numberMaxLength(money) {
  if (money.value.length > money.maxLength) {
    money.value = money.value.slice(0, money.maxLength);
  }
  let value = money.value.replace(/\D/g, '');
      // 숫자를 현지화된 문자열로 변환하여 천 단위마다 쉼표를 추가
      value = Number(value).toLocaleString('ja-JP');
      // 포맷된 값을 입력 상자에 설정
      money.value = value;
}

//let furin = document.querySelector(".kh-furin");
//furin.classList.add("kh-swaying");
// furin.addEventListener("mouseover", function () {
//   this.classList.add("kh-swaying");
// });
function getRandomInt(min, max) {
  min = Math.ceil(min);
  max = Math.floor(max);
  return Math.floor(Math.random() * (max - min + 1)) + min;
}
function removeWarn(){
	const warnspan = document.querySelector("#kh-warn-text");
	if(warnspan.classList.contains("kh-show")){
		warnspan.classList.remove("kh-show");
		warnspan.classList.add("kh-none");
	}
}