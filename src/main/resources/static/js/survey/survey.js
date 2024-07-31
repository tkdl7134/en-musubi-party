
// guest-type 체크 하나만 할 수 있도록 기능
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