function togglePWVisibility(inputID) {
    const input = document.getElementById(inputID);
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

function validatePasswords() {
    const newPW = document.getElementById('newPW').value;
    const confirmPW = document.getElementById('confirmPW').value;
    const errorElement = document.getElementById('password-error');

    if (newPW !== confirmPW) {
        errorElement.textContent = '비밀번호가 일치하지 않습니다.';
        return false;
    }

    errorElement.textContent = '';
    return true;
}