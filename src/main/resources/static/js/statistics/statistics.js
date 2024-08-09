src="https://cdn.jsdelivr.net/npm/chart.js"
let chart ;
function goToTop() {


    document.querySelector("#jh_top").scrollIntoView({behavior: "smooth"});


}

function goToSendPage() {
    /*나중에 여기에다가 필요한거 보낼거면 추가로 보낼것*/


    location.href = '/statistics/send/';


}

// 모달 열기
const modal = document.getElementById('jh_modal');
const modalBtn = document.getElementById('jh_select_tag');
const closeBtn = document.getElementById('jh_close_btn');

modalBtn.onclick = function() {
    modal.style.display = 'block';
}

// 모달 닫기
closeBtn.onclick = function() {
    modal.style.display = 'none';
}

// 모달 외부 클릭 시 닫기
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = 'none';
    }
}

// 항목 선택 시 동작
const selectOptions = document.querySelectorAll('.jh_wishlists');
const hiddenInput = document.getElementById('jh_price_input');

selectOptions.forEach(option => {
    option.onclick = function() {
        const value = this.getAttribute('data-value');
        const price = this.getAttribute('data-price');
        hiddenInput.value = price;  // 숨겨진 인풋에 가격 값을 설정
        console.log(`Selected Value: ${value}, Price: ${price}`);
        modal.style.display = 'none'; // 선택 후 모달 닫기

        const buttonText = this.innerText;
        // 클릭된 버튼의 value와 name 속성 값을 가져오기
        const optionVal = this.value;
        const WishlistPrice = this.getAttribute('name');

        console.log(optionVal);
        // priceData는 숨겨진 인풋 필드
        let priceData = document.getElementById('jh_price_input');

        // fetch 요청으로 데이터를 가져옴
        fetch('/statistics/getProductPrice/' + optionVal)
            .then(response => response.json())
            .then(data => {
                console.log(data);

                // 서버에서 받은 데이터를 priceData에 설정
                priceData.value = data;
                console.log(priceData.value);

                // 차트를 위한 컨텍스트 가져오기
                let config2 = document.getElementById('jh_product_chart').getContext('2d');

                // PaidPriceData는 서버에서 받은 값
                let PaidPriceData = data;

                // 차트 데이터 설정
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

                // 기존 차트가 있으면 삭제
                chart = Chart.getChart("jh_product_chart");
                if (chart) {
                    chart.destroy();
                }

                // 새로운 차트 생성
                chart = new Chart(config2, {
                    type: 'doughnut',
                    data: data2,
                });
                document.getElementById('jh_select_tag').innerText = buttonText;


            });

        let Wlno = this.value;
        console.log(Wlno)
        fetch('/statistics/getNewProductDetails/' + Wlno)
            .then(response => response.json())
            .then(
                data => {
                console.log(data);


                }
            );




    }
});