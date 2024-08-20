const allInput = document.querySelector("input");
const allTextarea = document.querySelector("textarea");


function emptyChk(){
    if(isEmpty(allInput)|| isEmpty(allTextarea)){
        console.log('false');
        return emptyToastOn();
    }
}


// 한자 -> 한자 | 히라가나 | 가타가나
document.querySelectorAll('.jp-input').forEach(function(input) {
    let isComposing = false;

    // compositionstart 이벤트 리스너: 입력 시작 시 실행됨
    input.addEventListener('compositionstart', function(event) {
        isComposing = true;
    });

    // compositionend 이벤트 리스너: 입력 종료 시 실행됨
    input.addEventListener('compositionend', function(event) {
        isComposing = false;
        const value = input.value;
        const allowedRegex = /^[\u4E00-\u9FFF\u30A0-\u30FF\u3040-\u309F]*$/; // 한자, 가타카나, 히라가나 범위 정규식

        if (!allowedRegex.test(value)) {
            // 입력된 값이 한자, 가타카나, 히라가나가 아닌 경우, 해당 문자를 제거
            input.value = value.replace(/[^\u4E00-\u9FFF\u30A0-\u30FF\u3040-\u309F]/g, '');
            jpToastOn();
        }
    });

    // input 이벤트 리스너: 입력 중 발생하는 이벤트
    input.addEventListener('input', function(event) {
        if (isComposing) {
            return; // 입력이 완료되기 전에는 아무 작업도 하지 않음
        }

        const value = input.value;
        const allowedRegex = /^[\u4E00-\u9FFF\u30A0-\u30FF\u3040-\u309F]*$/; // 한자, 가타카나, 히라가나 범위 정규식

        if (!allowedRegex.test(value)) {
            // 입력된 값이 한자, 가타카나, 히라가나가 아닌 경우, 해당 문자를 제거
            input.value = value.replace(/[^\u4E00-\u9FFF\u30A0-\u30FF\u3040-\u309F]/g, '');
            jpToastOn();
        }
    });
});


// 로마자 -> only 영어
document.querySelectorAll('.eng-input').forEach(function(input) {
    let isComposing = false;

    input.addEventListener('compositionstart', function(event) {
        isComposing = true;
    });

    input.addEventListener('compositionend', function(event) {
        isComposing = false;
        const value = input.value;
        const englishRegex = /^[a-zA-Z]*$/;

        if (!englishRegex.test(value)) {
            // 입력된 값 > 영어 알파벳 외의 모든 문자를 제거
            input.value = value.replace(/[^a-zA-Z]/g, '');
            engToastOn();
        }
    });

    // input 이벤트 리스너: 입력 중 발생하는 이벤트
    input.addEventListener('input', function(event) {
        if (isComposing) {
            return; // 입력이 완료되기 전에는 아무 작업도 하지 않음
        }

        const value = input.value;
        const englishRegex = /^[a-zA-Z]*$/; // 영어 알파벳 범위 정규식

        if (!englishRegex.test(value)) {
            // 입력된 값이 영어 알파벳이 아닌 경우, 영어 알파벳 외의 모든 문자를 제거
            input.value = value.replace(/[^a-zA-Z]/g, '');
            engToastOn();
        }
    });
});



// EMPTY - ALERT BUTTON
var emptyWarning = document.getElementById("emptyWarning-msg");
function emptyToastOn() {
    emptyWarning.classList.add("active");
    setTimeout(function () {
        emptyWarning.classList.remove("active");
    }, 3000);
    return false;
}


// LANGUAGE - ALERT BUTTON
var jpWarning = document.getElementById("jpWarning-msg");
function jpToastOn() {
    jpWarning.classList.add("active");
    setTimeout(function () {
        jpWarning.classList.remove("active");
    }, 3000);
    return false;
}

var engWarning = document.getElementById("engWarning-msg");
function engToastOn() {
    engWarning.classList.add("active");
    setTimeout(function () {
        engWarning.classList.remove("active");
    }, 3000);
    return false;
}