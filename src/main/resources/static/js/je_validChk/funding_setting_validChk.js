function checkMaxPrice(object){
    if(object.value.length > 8){
        object.value = object.value.slice(0, 8);
    }
};