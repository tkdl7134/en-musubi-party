function isEmpty(input){
    return !input.value.trim();
}

function isNotNumber(input){
    return isNaN(input.value);
}

function onlyEng(input){
    let ok = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";

    for (let i = 0; i < input.value.length; i++) {
        if (ok.indexOf(input.value[i]) == -1) {
            return true;
        }
    }
}

function onlyKana(input){
    let ok = "アァイィウゥエェオォカキクケコガギグゲゴサシスセソザジズゼゾタチツテトダヂヅデドッナニヌネノハヒフヘホバビブベボパピプペポマミムメモヤャユュヨョラリルレロワヮヲンヴ―ー";
    for (let i = 0; i < input.value.length; i++) {
        if (ok.indexOf(input.value[i]) == -1) {
            return true;
        }
    }
}

function lessThen(input, length){
    return input.value.length <= length;
}

function isNotType(input, type){
    type ="." + type;
    return input.value.indexOf(type) == -1;
}

