src="https://cdn.jsdelivr.net/npm/chart.js"
let chart ;
function goToTop() {


    document.querySelector("#jh_top").scrollIntoView({behavior: "smooth"});


}

function goToSendPage() {
    /*나중에 여기에다가 필요한거 보낼거면 추가로 보낼것*/


    location.href = '/statistics/send/';


}

document.getElementById("jh_select_tag").onchange = function () {
    const price = document.getElementById('jh_price_test').value;
    let priceData = document.getElementById('jh_price_input');
const selectEL = document.getElementById('jh_select_tag')
    const selectOption = selectEL.options[selectEL.selectedIndex];
const optionVal = selectOption.value;
    console.log(optionVal);
    console.log(price);

    fetch('/statistics/getProductPrice/' + optionVal).then(response => response.json())
        .then(data => {
            console.log(data);

            priceData.value = data;
            console.log(priceData.value);

            let config2 = document.getElementById('jh_product_chart').getContext('2d');



            let PaidPriceData =data;
            let WishlistPrice =selectOption.getAttribute('name');
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
        chart = Chart.getChart("jh_product_chart");
            if (chart){
                chart.destroy();
                alert(optionVal);

            }
      chart =   new Chart(config2, {
                type: 'doughnut',
                data: data2,
            });
        })

}

