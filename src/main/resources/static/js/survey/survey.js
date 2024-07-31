
// guest-type(게스트 타입) 체크 하나만 할 수 있도록 기능
document.addEventListener('DOMContentLoaded', function (){
    const groomGuestCheckbox = document.getElementById('groomGuest');
    const brideGuestCheckbox = document.getElementById('brideGuest');

    groomGuestCheckbox.addEventListener('change', function (){
        if (this.checked) {
            brideGuestCheckbox.checked = false;
        }
    });

    brideGuestCheckbox.addEventListener('change', function (){
        if(this.checked) {
            groomGuestCheckbox.checked = false;
        }
    });
});

// gender(성별) 체크 하나만 할 수 있도록 기능
document.addEventListener('DOMContentLoaded', function () {
    const maleGenderCheckbox = document.getElementById('maleGender');
    const femaleGenderCheckbox = document.getElementById('femaleGender');
    const othersGenderCheckbox = document.getElementById('othersGender');

    maleGenderCheckbox.addEventListener('change', function () {
        if (this.checked){
            femaleGenderCheckbox.checked = false;
            othersGenderCheckbox.checked = false;
        }
    });

    femaleGenderCheckbox.addEventListener('change', function (){
       if (this.checked){
           maleGenderCheckbox.checked = false;
           othersGenderCheckbox.checked = false;
       }
    });

    othersGenderCheckbox.addEventListener('change', function (){
        if (this.checked){
            maleGenderCheckbox.checked = false;
            femaleGenderCheckbox.checked = false;
        }
    })

});

$(function (){

// 주소 api 가져오는 Ajax
const japanAddressApi = () => {
    let searchValue;
    $(".search-postcode").on("input", () => {
        searchValue = $(".search-postcode").val();
        console.log(searchValue);
    });

    $(".search-post-btn").on("click", () => {
        console.log('clicked -- ')
        $.get(`https://api.zipaddress.net/?zipcode=${searchValue}`)
            .done((response) => {
            console.log(response);
            if (response.code === 200) {
                const address = response.data.fullAddress;
                $("input[name='a_address']").val(address);
            }else {
                console.log("Address not found");
            }
            })
            .fail((error) => {
                console.log(error);
            });
    });
};
japanAddressApi();


});
