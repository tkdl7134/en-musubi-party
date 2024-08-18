const allInput = document.querySelector("input");
const allTextarea = document.querySelector("textarea");

const groomJP_fam = document.querySelector("input[name='w_fam_jp_groom']");
const groomJP_name = document.querySelector("input[name='w_name_jp_groom']");
const groomENG_fam = document.querySelector("input[name='w_fam_eng_groom']");
const groomENG_name = document.querySelector("input[name='w_name_eng_groom']");

const brideJP_fam = document.querySelector("input[name='w_fam_jp_bride']");
const brideJP_name = document.querySelector("input[name='w_name_jp_bride']");
const brideENG_fam = document.querySelector("input[name='w_fam_eng_bride']");
const brideENG_name = document.querySelector("input[name='w_name_eng_bride']");

function emptyChk(){

    if (isEmpty(allInput) || isEmpty(allTextarea)){
        alert("必須で入力してください。");
        return false;
    } else {
        return true;
    }
}