const hello = document.createElement("span");
const box = document.querySelector("#picked");
box.appendChild(hello);
hello.textContent = "あなたの選択!->";
hello.classList.add('kh-sta-picked');
window.addEventListener('load', function() {
    setTimeout(function() {
        window.location.replace = 'ResultC'; // 변경하고 싶은 URL을 여기에 입력하세요.
    }, 10000); // 10000 밀리초는 10초를 의미합니다.
});