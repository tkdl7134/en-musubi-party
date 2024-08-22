// ID & PW 情報 消去(X)ボタン
function clearInput(inputInfo) {
    document.getElementById(inputInfo).value = '';
}

// PW toggle ボタン
function togglePWVisibility(inputInfo) {
    const input = document.getElementById(inputInfo);
    const icon = input.nextElementSibling;

    if (input.type === "password") {
        input.type = "text";
        icon.classList.remove('fa-eye-slash');
        icon.classList.add('fa-eye');
    } else {
        input.type = "password";
        icon.classList.remove('fa-eye');
        icon.classList.add('fa-eye-slash');
    }
}
