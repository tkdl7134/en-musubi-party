const groomJP_fam = document.querySelector("input[name='w_fam_jp_groom']");
const groomJP_name = document.querySelector("input[name='w_name_jp_groom']");
const groomENG_fam = document.querySelector("input[name='w_fam_eng_groom']");
const groomENG_name = document.querySelector("input[name='w_name_eng_groom']");

const brideJP_fam = document.querySelector("input[name='w_fam_jp_bride']");
const brideJP_name = document.querySelector("input[name='w_name_jp_bride']");
const brideENG_fam = document.querySelector("input[name='w_fam_eng_bride']");
const brideENG_name = document.querySelector("input[name='w_name_eng_bride']");

const date = document.querySelector("input[name='w_date']");

const w_time = document.querySelector("input[name='w_wedding_time']");
const w_assemble = document.querySelector("input[name='w_wedding_assemble']");
const w_postcode = document.querySelector("input[name='w_wedding_postcode']");
const w_address = document.querySelector("textarea[name='w_wedding_address']");
const w_building = document.querySelector("input[name='w_wedding_building']");

const r_time = document.querySelector("input[name='w_reception_time']");
const r_assemble = document.querySelector("input[name='w_reception_assemble']");
const r_postcode = document.querySelector("input[name='w_reception_postcode']");
const r_address = document.querySelector("textarea[name='w_reception_address']");
const r_building = document.querySelector("input[name='w_reception_building']");

const hi_message = document.querySelector("textarea[name='w_message_invite']");
const bye_message = document.querySelector("textarea[name='w_message_bye']");

const m_photo1 = document.querySelector("input[name='w_img1_file']");
const m_photo2 = document.querySelector("input[name='w_img2_file']");
const m_photo3 = document.querySelector("input[name='w_img3_file']");
const share_photo = document.querySelector("input[name='w_img_share_files']");


function emptyChk(){

// 이름정보
// 신랑
    if(isEmpty(groomJP_fam)|| isEmpty(groomJP_name)){
        alert("必須で入力してください。");
        if (isEmpty(groomJP_fam)) {
            groomJP_fam.focus();
        } else {
            groomJP_name.focus();
        }
        return false;
    }
    if(isEmpty(groomENG_fam)|| isEmpty(groomENG_name)){
        alert("必須で入力してください。");
        if (isEmpty(groomENG_fam)) {
            groomENG_fam.focus();
        } else {
            groomENG_name.focus();
        }
        return false;
    }

// 신부
    if(isEmpty(brideJP_fam)|| isEmpty(brideJP_name)){
        alert("必須で入力してください。");
        if (isEmpty(brideJP_fam)) {
            brideJP_fam.focus();
        } else {
            brideJP_name.focus();
        }
        return false;
    }
    if(isEmpty(brideENG_fam)|| isEmpty(brideENG_name)){
        alert("必須で入力してください。");
        if (isEmpty(brideENG_fam)) {
            brideENG_fam.focus();
        } else {
            brideENG_name.focus();
        }
        return false;
    }

// 식 날짜 및 시간
    if(isEmpty(date)){
        alert("必須で入力してください。");
        date.focus();
        return false;
    }

    if(isEmpty(w_time)|| isEmpty(w_assemble)){
        alert("必須で入力してください。");
        if (isEmpty(w_time)) {
            w_time.focus();
        } else {
            w_assemble.focus();
        }
        return false;
    }

    if(isEmpty(w_postcode)|| isEmpty(w_address) || isEmpty(w_building)){
        alert("必須で入力してください。");
        if (isEmpty(w_postcode)) {
            w_postcode.focus();
        } else if (isEmpty(w_address)){
            w_address.focus();
        } else {
            w_building.focus();
        }
        return false;
    }

    if(isEmpty(r_time)|| isEmpty(r_assemble)){
        alert("必須で入力してください。");
        if (isEmpty(r_time)) {
            r_time.focus();
        } else {
            r_assemble.focus();
        }
        return false;
    }

    if(isEmpty(r_postcode)|| isEmpty(r_address) || isEmpty(r_building)){
        alert("必須で入力してください。");
        if (isEmpty(r_postcode)) {
            r_postcode.focus();
        } else if (isEmpty(r_address)){
            r_address.focus();
        } else {
            r_building.focus();
        }
        return false;
    }

// 메세지
    if(isEmpty(hi_message)|| isEmpty(bye_message)){
        alert("必須で入力してください。");
        if (isEmpty(hi_message)) {
            hi_message.focus();
        } else {
            bye_message.focus();
        }
        return false;
    }

// 사진
    if(isEmpty(m_photo1) || isEmpty(m_photo2)|| isEmpty(m_photo3)|| isEmpty(share_photo)){
        alert("写真を添付してください。");
        if (isEmpty(m_photo1)) {
            m_photo1.focus();
        } else if (isEmpty(m_photo2)){
            m_photo2.focus();
        } else if (isEmpty(m_photo3)){
            m_photo3.focus();
        } else {
            share_photo.focus();
        }
        return false;
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
        }
    });
});

// 메인 사진 확장자 체크
function photoType1(){
    if (isNotType(m_photo1, "jpg") && isNotType(m_photo1, "png") && isNotType(m_photo1, "jpeg")) {
        alert("「jpg・png・jpeg」 のような形式のファイルを添付してください。 ");
        m_photo1.value = "";
        return false;
    }
}
function photoType2(){
    if (isNotType(m_photo2, "jpg") && isNotType(m_photo2, "png") && isNotType(m_photo2, "jpeg")) {
        alert("「jpg・png・jpeg」 のような形式のファイルを添付してください。 ");
        m_photo2.value = "";
        return false;
    }
}
function photoType3(){
    if (isNotType(m_photo3, "jpg") && isNotType(m_photo3, "png") && isNotType(m_photo3, "jpeg")) {
        alert("「jpg・png・jpeg」 のような形式のファイルを添付してください。 ");
        m_photo3.value = "";
        return false;
    }
}