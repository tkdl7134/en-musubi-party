

function goToTop() {


    document.querySelector("#jh_top").scrollIntoView({behavior: "smooth"});


}
function goToSendPage() {
    /*나중에 여기에다가 필요한거 보낼거면 추가로 보낼것*/


    location.href= '/statistics/send/';



}

document.getElementById("jh_select_tag").onchange = function (){

    fetch('/statistics/getProductPrice').then(response => response.json())
        .then(data=>{
            console.log(data);
        })

}