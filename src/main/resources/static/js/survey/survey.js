
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