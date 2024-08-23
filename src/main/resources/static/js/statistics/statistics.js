src="https://cdn.jsdelivr.net/npm/chart.js"
let chart ;
function goToTop() {


    document.querySelector("#jh_top").scrollIntoView({behavior: "smooth"});


}

function goToSendPage() {
    /*나중에 여기에다가 필요한거 보낼거면 추가로 보낼것*/

    document.getElementById('jh_pageNavi1').style.cssText = 'width : 64% ; transform : translateX(-25%);transition : 0.2s';
    document.getElementById('jh_pageNavi2').style.cssText ='background-color : #EDEDED; width: 64vw ;transition : 0.2s'
    document.getElementById('jh_pageNavi3').style.cssText ='color : black;transition : 0.2s'
    document.getElementById('jh_pageNavi4').style.cssText ='width : 64vw; background-color : red;transition : 0.2s'
    document.getElementById('jh_pageNavi5').style.cssText = 'color : white;transition : 0.2s'
    document.getElementById('jh_slick2').style.cssText = 'display : block;'
    document.getElementById('jh_slick1').style.cssText = 'display : none'
    document.getElementsByClassName('slick-list').item(1).cssText = 'height : 1142px;'
    document.getElementById('jh_slider111').style.cssText = 'width : 100vw;'
    document.getElementById('jh_slider222').style.cssText = 'width : 100vw;'
    document.getElementById('jh_slider333').style.cssText = 'width : 100vw;'
    document.querySelector('.slick-list').cssText = 'height : 1142px;'
/*    location.href = '/statistics/send';*/


}
function goToFundPage(){

 document.getElementById('jh_pageNavi1').style.cssText = 'width: 64%; transform: translateX(-25%); transition : 0.2s;'
    document.getElementById('jh_pageNavi2').style.cssText ='background-color: red;     width: 64vw; transition : 0.2s'
    document.getElementById('jh_pageNavi3').style.cssText ='color : white;transition : 0.2s'
    document.getElementById('jh_pageNavi4').style.cssText ='background-color :#EDEDED ;transition : 0.2s'
    document.getElementById('jh_pageNavi5').style.cssText = 'color : black; transition : 0.2s'
    document.getElementById('jh_slick2').style.cssText = 'display : none;'
    document.getElementById('jh_slick1').style.cssText = 'display : block'
    document.getElementById('jh_slider11').style.cssText = 'width : 100vw;'
    document.getElementById('jh_slider22').style.cssText = 'width : 100vw;'
    document.getElementById('jh_slider33').style.cssText = 'width : 100vw;'




    /*location.href = '/statistics/funding';*/

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
        const eno = this.getAttribute('data-eno');
        hiddenInput.value = price;  // 숨겨진 인풋에 가격 값을 설정
        console.log(`Selected Value: ${value}, Price: ${price}`);
        modal.style.display = 'none'; // 선택 후 모달 닫기
        console.log(eno);

        const buttonText = this.innerText;
        // 클릭된 버튼의 value와 name 속성 값을 가져오기
        const optionVal = this.value;
        const WishlistPrice = this.getAttribute('name');

        console.log(optionVal);
        // priceData는 숨겨진 인풋 필드
        let priceData = document.getElementById('jh_price_input');
        let enoVal = document.getElementById("jh_eno_input").value;
        // fetch 요청으로 데이터를 가져옴
        fetch('/statistics/getProductPrice/' + optionVal +'/' + enoVal  )
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
                            'rgb(255, 194, 194)'
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
        fetch('/statistics/getNewProductDetails/' + Wlno + '/' + eno)
            .then(response => response.json())
            .then(
                data => {
                console.log(data);
            let highestPrice = data[0];
            let numberOfPeople = data[1];
            let rankingOfWishlist = data[2];
            let popularDate = data[3];

            console.log(highestPrice);
            console.log(numberOfPeople);
            console.log(rankingOfWishlist);
            console.log(popularDate);

           let dateOnly = popularDate.split(' ')[0];
                    const [year, month, day] = dateOnly.split('-');
                    const formattedDate = `${year}年-${month}月-${day}日`;
            document.getElementById('jh_detailHead').innerText = buttonText + 'の情報'
            document.getElementById('jh_numberOfPeople').innerText ='繋がれた因縁 :' + numberOfPeople + '名';
            document.getElementById('jh_highestPrice').innerText ='最も大きい思い :' +highestPrice.toLocaleString() + '円';
            document.getElementById('jh_rankingOfWishlist').innerText ='人気ランキング :'+ rankingOfWishlist + '位';
            document.getElementById('jh_popularDate').innerText ='一番数多くの因縁が訪れた日 : ' +  formattedDate;








                }
            );




    }
});