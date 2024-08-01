src="https://cdn.jsdelivr.net/npm/chart.js"
let chart ;
function goToTop() {


    document.querySelector("#jh_top").scrollIntoView({behavior: "smooth"});


}

function goToSendPage() {
    /*나중에 여기에다가 필요한거 보낼거면 추가로 보낼것*/


    location.href = '/statistics/send/';


}

const price = document.getElementById('jh_price_test').value;
document.getElementById("jh_select_tag").onchange = function () {
    let priceData = document.getElementById('jh_price_input');

    console.log(price);

    fetch('/statistics/getProductPrice/' + price).then(response => response.json())
        .then(data => {
            console.log(data);

            priceData.value = data;
            console.log(priceData.value);

            let config2 = document.getElementById('jh_product_chart').getContext('2d');



            let PaidPriceData = document.getElementById('jh_price_input').value;
            let WishlistPrice = document.getElementById('jh_price_test').getAttribute('name');
            const data2 = {
                labels: [
                    'ウィッシュリスト',
                    '到達まで'
                ],
                datasets: [{
                    label: '頂いた想い',
                    data: [PaidPriceData, WishlistPrice - PaidPriceData],
                    backgroundColor: [
                        'rgb(255, 99, 132)',
                        'rgb(255, 255, 255)'
                    ],
                    hoverOffset: 4
                }]
            };

            if (chart){
                alert(11);
                chart.destroy();

            }
      chart =      new Chart(config2, {
                type: 'doughnut',
                data: data2,
            });

        })

}