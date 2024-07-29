
document.addEventListener('DOMContentLoaded', function() {
    let hw_card = document.querySelector('.hw_card');
    hw_card.addEventListener('click', function(event) {
        let elem = event.currentTarget;
        if (elem.style.transform === "rotateY(180deg)") {
            elem.style.transform = "rotateY(0deg)";
        } else {
            elem.style.transform = "rotateY(180deg)";
        }
    });
});
