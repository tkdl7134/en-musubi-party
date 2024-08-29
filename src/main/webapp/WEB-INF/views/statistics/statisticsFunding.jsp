<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html; charset=utf-8" %>
<%@ include file="../menubar.jsp" %>
<!DOCTYPE html>
<html style="zoom : 100% !important;" lang="en">
<link rel="icon" type="image/png" href="/img/favicon.png">
<link rel="stylesheet" href="/css/statistics/statistics.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+JP:wght@200..900&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<script src="/js/statistics/statistics.js" defer></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels"></script>
<script>

    function reorderByProduct(no) {


        let productEl = document.getElementById("jh_button_product");
        let moneyEl = document.getElementById("jh_button_money");
        let dateEl = document.getElementById("jh_button_date");


        // fetch 요청 URL 결정
        let fetchUrl = productEl.innerText.includes("↓")
            ? '/statistics/reorderByProduct/' + no
            : '/statistics/reorderByProductDesc/' + no;

        fetch(fetchUrl)
            .then(response => response.json())
            .then(data => {
                console.log(data);
                let testEl = document.getElementById("jh_foreach_test");

                // 요소의 내용을 제거합니다.
                testEl.innerHTML = '';

                // 데이터를 반복하여 HTML 요소를 생성합니다.
                data.forEach(l => {
                    let div = document.createElement('div');
                    div.style.cssText = 'width: 97%; margin-left: 1.5%; background-color: white; border: 1px solid black; margin-top: 2vh; border-radius: 20px;';

                    // 첫 번째 줄: Kanji 이름과 가격을 포함하는 컨테이너
                    let firstRowDiv = document.createElement('div');
                    firstRowDiv.style.cssText = 'display: flex; justify-content: space-around;';

                    let kanjiDiv = document.createElement('div');
                    kanjiDiv.style.cssText = 'font-size: 24px; text-align: center;';
                    kanjiDiv.textContent = l.m_fam_kanji + l.m_name_kanji;
                    firstRowDiv.appendChild(kanjiDiv);

                    let priceDiv = document.createElement('div');
                    priceDiv.style.cssText = 'font-size: 24px; text-align: center;';
                    priceDiv.textContent = l.p_price + '円';
                    firstRowDiv.appendChild(priceDiv);

                    div.appendChild(firstRowDiv);

                    // 두 번째 줄: 제품명과 날짜를 포함하는 컨테이너
                    let secondRowDiv = document.createElement('div');
                    secondRowDiv.style.cssText = 'display: flex; justify-content: space-around; margin-top: 2.5rem;';

                    let productDiv = document.createElement('div');
                    productDiv.style.cssText = 'font-size: 24px; text-align: center;';
                    productDiv.textContent = l.wl_product;
                    secondRowDiv.appendChild(productDiv);

                    let dateDiv = document.createElement('div');
                    dateDiv.style.cssText = 'font-size: 24px; text-align: center;';
                    dateDiv.textContent = new Date(l.p_date).toISOString().split('T')[0];
                    secondRowDiv.appendChild(dateDiv);

                    div.appendChild(secondRowDiv);

                    testEl.appendChild(div);
                });
                moneyEl.innerText = moneyEl.innerText.replace(/↑|↓/g, '');
                dateEl.innerText = dateEl.innerText.replace(/↑|↓/g, '');
                dateEl.style.backgroundColor = 'white';
                dateEl.style.color = 'black';
                productEl.style.backgroundColor = 'red';
                productEl.style.color = 'white';
                moneyEl.style.backgroundColor = 'white';
                moneyEl.style.color = 'black';
                // jh_button_money 버튼의 텍스트에 화살표 토글
                if (productEl.innerText.includes("↓")) {
                    productEl.innerText = productEl.innerText.replace("↓", "↑");
                } else if (productEl.innerText.includes("↑")) {
                    productEl.innerText = productEl.innerText.replace("↑", "↓");
                    fetchUrl = '/statistics/reorderByMoney/' + no;
                } else {
                    productEl.innerText += "↓";
                    fetchUrl = '/statistics/reorderByMoneyDesc/' + no;
                }

            })
            .catch(error => {
                console.error('Error fetching data:', error);
            });


    }
    function reorderSendByRelation(no) {


        let productEl = document.getElementById("jh_button_product2");
        let moneyEl = document.getElementById("jh_button_money2");
        let dateEl = document.getElementById("jh_button_date2");


        // fetch 요청 URL 결정
        let fetchUrl = productEl.innerText.includes("↓")
            ? '/statistics/reorderSendByRelation/' + no
            : '/statistics/reorderSendByRelationDesc/' + no;

        fetch(fetchUrl)
            .then(response => response.json())
            .then(data => {
                console.log(data);
                let testEl = document.getElementById("jh_foreach_test2");

                // 요소의 내용을 제거합니다.
                testEl.innerHTML = '';

                // 데이터를 반복하여 HTML 요소를 생성합니다.
                data.forEach(l => {
                    let div = document.createElement('div');
                    div.style.cssText = 'width: 97%; margin-left: 1.5%; background-color: white; border: 1px solid black; margin-top: 2vh; border-radius: 20px;';

                    // 첫 번째 줄: Kanji 이름과 가격을 포함하는 컨테이너
                    let firstRowDiv = document.createElement('div');
                    firstRowDiv.style.cssText = 'display: flex; justify-content: space-around;';

                    let kanjiDiv = document.createElement('div');
                    kanjiDiv.style.cssText = 'font-size: 24px; text-align: center;';
                    kanjiDiv.textContent = l.m_fam_kanji + l.m_name_kanji;
                    firstRowDiv.appendChild(kanjiDiv);

                    let priceDiv = document.createElement('div');
                    priceDiv.style.cssText = 'font-size: 24px; text-align: center;';
                    priceDiv.textContent = l.p_price + '円';
                    firstRowDiv.appendChild(priceDiv);

                    div.appendChild(firstRowDiv);

                    // 두 번째 줄: 제품명과 날짜를 포함하는 컨테이너
                    let secondRowDiv = document.createElement('div');
                    secondRowDiv.style.cssText = 'display: flex; justify-content: space-around; margin-top: 2.5rem;';

                    let productDiv = document.createElement('div');
                    productDiv.style.cssText = 'font-size: 24px; text-align: center;';
                    productDiv.textContent = l.g_relation;
                    secondRowDiv.appendChild(productDiv);

                    let dateDiv = document.createElement('div');
                    dateDiv.style.cssText = 'font-size: 24px; text-align: center;';
                    dateDiv.textContent = new Date(l.p_date).toISOString().split('T')[0];
                    secondRowDiv.appendChild(dateDiv);

                    div.appendChild(secondRowDiv);

                    testEl.appendChild(div);
                });
                moneyEl.innerText = moneyEl.innerText.replace(/↑|↓/g, '');
                dateEl.innerText = dateEl.innerText.replace(/↑|↓/g, '');
                dateEl.style.backgroundColor = 'white';
                dateEl.style.color = 'black';
                productEl.style.backgroundColor = 'red';
                productEl.style.color = 'white';
                moneyEl.style.backgroundColor = 'white';
                moneyEl.style.color = 'black';
                // jh_button_money 버튼의 텍스트에 화살표 토글
                if (productEl.innerText.includes("↓")) {
                    productEl.innerText = productEl.innerText.replace("↓", "↑");
                } else if (productEl.innerText.includes("↑")) {
                    productEl.innerText = productEl.innerText.replace("↑", "↓");
                    fetchUrl = '/statistics/reorderSendByRelation/' + no;
                } else {
                    productEl.innerText += "↓";
                    fetchUrl = '/statistics/reorderSendByRelationDesc/' + no;
                }

            })
            .catch(error => {
                console.error('Error fetching data:', error);
            });


    }

    function reorderSendByMoney(no) {


        let productEl = document.getElementById("jh_button_product2");
        let moneyEl = document.getElementById("jh_button_money2");
        let dateEl = document.getElementById("jh_button_date2");


        // fetch 요청 URL 결정
        let fetchUrl = moneyEl.innerText.includes("↓")
            ? '/statistics/reorderSendByMoney/' + no
            : '/statistics/reorderSendByMoneyDesc/' + no;

        fetch(fetchUrl)
            .then(response => response.json())
            .then(data => {
                console.log(data);
                let testEl = document.getElementById("jh_foreach_test2");

                // 요소의 내용을 제거합니다.
                testEl.innerHTML = '';

                // 데이터를 반복하여 HTML 요소를 생성합니다.
                data.forEach(l => {
                    let div = document.createElement('div');
                    div.style.cssText = 'width: 97%; margin-left: 1.5%; background-color: white; border: 1px solid black; margin-top: 2vh; border-radius: 20px;';

                    // 첫 번째 줄: Kanji 이름과 가격을 포함하는 컨테이너
                    let firstRowDiv = document.createElement('div');
                    firstRowDiv.style.cssText = 'display: flex; justify-content: space-around;';

                    let kanjiDiv = document.createElement('div');
                    kanjiDiv.style.cssText = 'font-size: 24px; text-align: center;';
                    kanjiDiv.textContent = l.m_fam_kanji + l.m_name_kanji;
                    firstRowDiv.appendChild(kanjiDiv);

                    let priceDiv = document.createElement('div');
                    priceDiv.style.cssText = 'font-size: 24px; text-align: center;';
                    priceDiv.textContent = l.p_price + '円';
                    firstRowDiv.appendChild(priceDiv);

                    div.appendChild(firstRowDiv);

                    // 두 번째 줄: 제품명과 날짜를 포함하는 컨테이너
                    let secondRowDiv = document.createElement('div');
                    secondRowDiv.style.cssText = 'display: flex; justify-content: space-around; margin-top: 2.5rem;';

                    let productDiv = document.createElement('div');
                    productDiv.style.cssText = 'font-size: 24px; text-align: center;';
                    productDiv.textContent = l.g_relation;
                    secondRowDiv.appendChild(productDiv);

                    let dateDiv = document.createElement('div');
                    dateDiv.style.cssText = 'font-size: 24px; text-align: center;';
                    dateDiv.textContent = new Date(l.p_date).toISOString().split('T')[0];
                    secondRowDiv.appendChild(dateDiv);

                    div.appendChild(secondRowDiv);

                    testEl.appendChild(div);
                });
                productEl.innerText = productEl.innerText.replace(/↑|↓/g, '');
                dateEl.innerText = dateEl.innerText.replace(/↑|↓/g, '');
                dateEl.style.backgroundColor = 'white';
                dateEl.style.color = 'black';
                moneyEl.style.backgroundColor = 'red';
                moneyEl.style.color = 'white';
                productEl.style.backgroundColor = 'white';
                productEl.style.color = 'black';
                // jh_button_money 버튼의 텍스트에 화살표 토글
                if (moneyEl.innerText.includes("↓")) {
                    moneyEl.innerText = moneyEl.innerText.replace("↓", "↑");
                } else if (moneyEl.innerText.includes("↑")) {
                    moneyEl.innerText = moneyEl.innerText.replace("↑", "↓");
                    fetchUrl = '/statistics/reorderSendByMoney/' + no;
                } else {
                    moneyEl.innerText += "↓";
                    fetchUrl = '/statistics/reorderSendByMoneyDesc/' + no;
                }

            })
            .catch(error => {
                console.error('Error fetching data:', error);
            });


    }
    function reorderSendByDate(no) {


        let productEl = document.getElementById("jh_button_product2");
        let moneyEl = document.getElementById("jh_button_money2");
        let dateEl = document.getElementById("jh_button_date2");


        // fetch 요청 URL 결정
        let fetchUrl = dateEl.innerText.includes("↓")
            ? '/statistics/reorderSendByMoney/' + no
            : '/statistics/reorderSendByMoneyDesc/' + no;

        fetch(fetchUrl)
            .then(response => response.json())
            .then(data => {
                console.log(data);
                let testEl = document.getElementById("jh_foreach_test2");

                // 요소의 내용을 제거합니다.
                testEl.innerHTML = '';

                // 데이터를 반복하여 HTML 요소를 생성합니다.
                data.forEach(l => {
                    let div = document.createElement('div');
                    div.style.cssText = 'width: 97%; margin-left: 1.5%; background-color: white; border: 1px solid black; margin-top: 2vh; border-radius: 20px;';

                    // 첫 번째 줄: Kanji 이름과 가격을 포함하는 컨테이너
                    let firstRowDiv = document.createElement('div');
                    firstRowDiv.style.cssText = 'display: flex; justify-content: space-around;';

                    let kanjiDiv = document.createElement('div');
                    kanjiDiv.style.cssText = 'font-size: 24px; text-align: center;';
                    kanjiDiv.textContent = l.m_fam_kanji + l.m_name_kanji;
                    firstRowDiv.appendChild(kanjiDiv);

                    let priceDiv = document.createElement('div');
                    priceDiv.style.cssText = 'font-size: 24px; text-align: center;';
                    priceDiv.textContent = l.p_price + '円';
                    firstRowDiv.appendChild(priceDiv);

                    div.appendChild(firstRowDiv);

                    // 두 번째 줄: 제품명과 날짜를 포함하는 컨테이너
                    let secondRowDiv = document.createElement('div');
                    secondRowDiv.style.cssText = 'display: flex; justify-content: space-around; margin-top: 2.5rem;';

                    let productDiv = document.createElement('div');
                    productDiv.style.cssText = 'font-size: 24px; text-align: center;';
                    productDiv.textContent = l.g_relation;
                    secondRowDiv.appendChild(productDiv);

                    let dateDiv = document.createElement('div');
                    dateDiv.style.cssText = 'font-size: 24px; text-align: center;';
                    dateDiv.textContent = new Date(l.p_date).toISOString().split('T')[0];
                    secondRowDiv.appendChild(dateDiv);

                    div.appendChild(secondRowDiv);

                    testEl.appendChild(div);
                });
                moneyEl.innerText = moneyEl.innerText.replace(/↑|↓/g, '');
                productEl.innerText = productEl.innerText.replace(/↑|↓/g, '');
                moneyEl.style.backgroundColor = 'white';
                moneyEl.style.color = 'black';
                dateEl.style.backgroundColor = 'red';
                dateEl.style.color = 'white';
                productEl.style.backgroundColor = 'white';
                productEl.style.color = 'black';
                // jh_button_money 버튼의 텍스트에 화살표 토글
                if (dateEl.innerText.includes("↓")) {
                    dateEl.innerText = dateEl.innerText.replace("↓", "↑");
                } else if (dateEl.innerText.includes("↑")) {
                    dateEl.innerText = dateEl.innerText.replace("↑", "↓");
                    fetchUrl = '/statistics/reorderSendByDate/' + no;
                } else {
                    dateEl.innerText += "↓";
                    fetchUrl = '/statistics/reorderSendByDateDesc/' + no;
                }

            })
            .catch(error => {
                console.error('Error fetching data:', error);
            });


    }

    function reorderByMoney(no) {
        let moneyEl = document.getElementById("jh_button_money");
        let productEl = document.getElementById("jh_button_product");
        let dateEl = document.getElementById("jh_button_date");


        // fetch 요청 URL 결정
        let fetchUrl = moneyEl.innerText.includes("↓")
            ? '/statistics/reorderByMoney/' + no
            : '/statistics/reorderByMoneyDesc/' + no;

        fetch(fetchUrl)
            .then(response => response.json())
            .then(data => {
                console.log(data);
                let testEl = document.getElementById("jh_foreach_test");

                // 요소의 내용을 제거합니다.
                testEl.innerHTML = '';

                // 데이터를 반복하여 HTML 요소를 생성합니다.
                data.forEach(l => {
                    let div = document.createElement('div');
                    div.style.cssText = 'width: 97%; margin-left: 1.5%; background-color: white; border: 1px solid black; margin-top: 2vh; border-radius: 20px;';

                    // 첫 번째 줄: Kanji 이름과 가격을 포함하는 컨테이너
                    let firstRowDiv = document.createElement('div');
                    firstRowDiv.style.cssText = 'display: flex; justify-content: space-around;';

                    let kanjiDiv = document.createElement('div');
                    kanjiDiv.style.cssText = 'font-size: 24px; text-align: center;';
                    kanjiDiv.textContent = l.m_fam_kanji + l.m_name_kanji;
                    firstRowDiv.appendChild(kanjiDiv);

                    let priceDiv = document.createElement('div');
                    priceDiv.style.cssText = 'font-size: 24px; text-align: center;';
                    priceDiv.textContent = l.p_price + '円';
                    firstRowDiv.appendChild(priceDiv);

                    div.appendChild(firstRowDiv);

                    // 두 번째 줄: 제품명과 날짜를 포함하는 컨테이너
                    let secondRowDiv = document.createElement('div');
                    secondRowDiv.style.cssText = 'display: flex; justify-content: space-around; margin-top: 2.5rem;';

                    let productDiv = document.createElement('div');
                    productDiv.style.cssText = 'font-size: 24px; text-align: center;';
                    productDiv.textContent = l.wl_product;
                    secondRowDiv.appendChild(productDiv);

                    let dateDiv = document.createElement('div');
                    dateDiv.style.cssText = 'font-size: 24px; text-align: center;';
                    dateDiv.textContent = new Date(l.p_date).toISOString().split('T')[0];
                    secondRowDiv.appendChild(dateDiv);

                    div.appendChild(secondRowDiv);

                    testEl.appendChild(div);
                });
                productEl.innerText = productEl.innerText.replace(/↑|↓/g, '');
                dateEl.innerText = dateEl.innerText.replace(/↑|↓/g, '');
                dateEl.style.backgroundColor = 'white';
                dateEl.style.color = 'black';
                productEl.style.backgroundColor = 'white';
                productEl.style.color = 'black';
                moneyEl.style.backgroundColor = 'red';
                moneyEl.style.color = 'white';
                // jh_button_money 버튼의 텍스트에 화살표 토글
                if (moneyEl.innerText.includes("↓")) {
                    moneyEl.innerText = moneyEl.innerText.replace("↓", "↑");
                } else if (moneyEl.innerText.includes("↑")) {
                    moneyEl.innerText = moneyEl.innerText.replace("↑", "↓");
                    fetchUrl = '/statistics/reorderByMoney/' + no;
                } else {
                    moneyEl.innerText += "↓";
                    fetchUrl = '/statistics/reorderByMoneyDesc/' + no;
                }

            })
            .catch(error => {
                console.error('Error fetching data:', error);
            });
    }

    function reorderByDate(no) {
        let dateEl = document.getElementById("jh_button_date");
        let productEl = document.getElementById("jh_button_product");
        let moneyEl = document.getElementById("jh_button_money");


        // fetch 요청 URL 결정
        let fetchUrl = dateEl.innerText.includes("↓")
            ? '/statistics/reorderByDate/' + no
            : '/statistics/reorderByDateDesc/' + no;

        fetch(fetchUrl)
            .then(response => response.json())
            .then(data => {
                console.log(data);
                let testEl = document.getElementById("jh_foreach_test");

                // 요소의 내용을 제거합니다.
                testEl.innerHTML = '';

                // 데이터를 반복하여 HTML 요소를 생성합니다.
                data.forEach(l => {
                    let div = document.createElement('div');
                    div.style.cssText = 'width: 97%; margin-left: 1.5%; background-color: white; border: 1px solid black; margin-top: 2vh; border-radius: 20px;';

                    // 첫 번째 줄: Kanji 이름과 가격을 포함하는 컨테이너
                    let firstRowDiv = document.createElement('div');
                    firstRowDiv.style.cssText = 'display: flex; justify-content: space-around;';

                    let kanjiDiv = document.createElement('div');
                    kanjiDiv.style.cssText = 'font-size: 24px; text-align: center;';
                    kanjiDiv.textContent = l.m_fam_kanji + l.m_name_kanji;
                    firstRowDiv.appendChild(kanjiDiv);

                    let priceDiv = document.createElement('div');
                    priceDiv.style.cssText = 'font-size: 24px; text-align: center;';
                    priceDiv.textContent = l.p_price + '円';
                    firstRowDiv.appendChild(priceDiv);

                    div.appendChild(firstRowDiv);

                    // 두 번째 줄: 제품명과 날짜를 포함하는 컨테이너
                    let secondRowDiv = document.createElement('div');
                    secondRowDiv.style.cssText = 'display: flex; justify-content: space-around; margin-top: 2.5rem;';

                    let productDiv = document.createElement('div');
                    productDiv.style.cssText = 'font-size: 24px; text-align: center;';
                    productDiv.textContent = l.wl_product;
                    secondRowDiv.appendChild(productDiv);

                    let dateDiv = document.createElement('div');
                    dateDiv.style.cssText = 'font-size: 24px; text-align: center;';
                    dateDiv.textContent = new Date(l.p_date).toISOString().split('T')[0];
                    secondRowDiv.appendChild(dateDiv);

                    div.appendChild(secondRowDiv);

                    testEl.appendChild(div);
                });
                productEl.innerText = productEl.innerText.replace(/↑|↓/g, '');
                moneyEl.innerText = moneyEl.innerText.replace(/↑|↓/g, '');

                dateEl.style.backgroundColor = 'red';
                dateEl.style.color = 'white';
                productEl.style.backgroundColor = 'white';
                productEl.style.color = 'black';
                moneyEl.style.backgroundColor = 'white';
                moneyEl.style.color = 'black';
                // jh_button_money 버튼의 텍스트에 화살표 토글
                if (dateEl.innerText.includes("↓")) {
                    dateEl.innerText = dateEl.innerText.replace("↓", "↑");

                } else if (dateEl.innerText.includes("↑")) {
                    dateEl.innerText = dateEl.innerText.replace("↑", "↓");
                    fetchUrl = '/statistics/reorderByMoney/' + no;
                } else {
                    dateEl.innerText += "↓";
                    fetchUrl = '/statistics/reorderByMoneyDesc/' + no;
                }

            })
            .catch(error => {
                console.error('Error fetching data:', error);
            });

    }

    $(document).ready(function () {
        $('.slick22').slick({
            dots: false,
            infinite: false,
            speed: 500,
            slidesToShow: 1,
            slidesToScroll: 1,
            adaptiveHeight: true,

            prevArrow: $(".jh_prev_btn2"),
            nextArrow: $(".jh_next_btn2"),


        });


        $('.slick').slick({
            dots: false,
            infinite: false,
            speed: 500,
            slidesToShow: 1,
            slidesToScroll: 1,
            adaptiveHeight: true,

            prevArrow: $(".jh_prev_btn"),
            nextArrow: $(".jh_next_btn"),


        });
       /* $('.slick-slider').slick('setPosition');*/

        let AttendCount = document.getElementById("AttendCount").value;
        let NotAttendCount = document.getElementById("NotAttendCount").value;


        const AttendChart = document.getElementById('jh_attend_chart').getContext('2d')

        const ctx = document.getElementById('myChart').getContext('2d');
        const ctx2 = document.getElementById('myChart2').getContext('2d');
        const config = document.getElementById('week-data-chart').getContext('2d');
        const config3 = document.getElementById('week-data-chart2').getContext('2d');

        const config2 = document.getElementById('jh_product_chart').getContext('2d');
        const config4 = document.getElementById('jh_send_chart').getContext('2d');
        const today = new Date();
        const year = today.getFullYear();
        const month = ('0' + (today.getMonth() + 1)).slice(-2); // 월은 0부터 시작하므로 +1
        const day = ('0' + today.getDate()).slice(-2);
        console.log(day);
        const formattedDate = year + '-' + month + '-' + day; // YYYY-MM-DD 형식
        const dates = [];
        let PaidPriceData = document.getElementById('jh_price_input').value;
        let firstWishlistButton = document.querySelector('.jh_wishlists');
        let WishlistPrice = firstWishlistButton.getAttribute('name');
        let wishlists = document.querySelectorAll('.jh_wishlists');

        console.log(PaidPriceData)
        console.log(WishlistPrice);


        const eno = 5; /*여기 나중에 바뀌어야함, session이던 뭐던가로 eno 가져오기*/
        let array = []

        wishlists.forEach(function (wishlist) {
            array.push(wishlist.innerText);
        });
        console.log(array);
        let array2 = []
        let pricelists = document.querySelectorAll('.jh_wishlist_price').values();
        pricelists.forEach(function (wishlist) {
            array2.push(wishlist.value);
        })
        console.log(array2);
        let array3 = []
        let daylists = document.querySelectorAll('.jh_pay_date').values();
        daylists.forEach(function (wishlist) {
            array3.push(wishlist.value / 10000);
        })
        console.log(array3);
        let array4 = []
        let sendlists = document.getElementsByClassName('jh_send_price')
        Array.from(sendlists).forEach(function (wishlist) {
            let sendPrices = wishlist.value;
            let sendPriceNumber = parseFloat(sendPrices); // Convert the string to a number
            array4.push(sendPriceNumber / 10000); // Divide by 10000 and push to array4
        });

        console.log(array4 );
        console.log('array4');
        let array5 = [];
        let PriceByRelation = document.getElementsByClassName('jh_priceByRelation');

// HTMLCollection을 배열로 변환한 후 forEach 사용
        Array.from(PriceByRelation).forEach(function (wishlist) {
            let sendPrices = wishlist.value;
            let sendPriceNumber = parseFloat(sendPrices); // 문자열을 숫자로 변환
            array5.push(sendPriceNumber / 10000); // 10000으로 나눈 값을 array5에 추가
        });

        let array6 = [];
        let Relation = document.getElementsByClassName('jh_send_relation');

// HTMLCollection을 배열로 변환한 후 forEach 사용
        Array.from(Relation).forEach(function (wishlist) {
            array6.push(wishlist.value); // 값들을 array6에 추가
        });

        for (let i = 6; i > -1; i--) {
            const date = new Date(today);
            date.setDate(today.getDate() - i);
            dates.push(formatDate(date));
        }


        function formatDate(date) {
            const year = date.getFullYear();
            const month = ('0' + (date.getMonth() + 1)).slice(-2); // 월은 0부터 시작하므로 +1
            const day = ('0' + date.getDate()).slice(-2);
            return month + '-' + day;
        }


        new Chart(ctx, {
            type: 'doughnut',
            data: {
                labels: array,
                datasets: [{
                    label: '繋がった想い',
                    data: array2,
                    backgroundColor: ['rgb(255, 0, 0)', 'rgb(255,161,148)', 'rgb(255,194,194)', 'rgb(255,226,75)', 'rgb(251,239,214)'],
                    hoverOffset: 4
                }]
            }, options: {

                responsive: false

            }
        });

        const labels = dates;
        console.log(labels)
        const data = {
            labels: labels,
            datasets: [{
                label: '頂いた想い',
                data: array3,
                backgroundColor: [
                    'rgba(255, 99, 132, 0.2)',
                    'rgba(255, 159, 64, 0.2)',
                    'rgba(255, 205, 86, 0.2)',
                    'rgba(75, 192, 192, 0.2)',
                    'rgba(54, 162, 235, 0.2)',
                    'rgba(153, 102, 255, 0.2)',
                    'rgba(201, 203, 207, 0.2)'
                ],
                borderColor: [
                    'rgb(255, 99, 132)',
                    'rgb(255, 159, 64)',
                    'rgb(255, 205, 86)',
                    'rgb(75, 192, 192)',
                    'rgb(54, 162, 235)',
                    'rgb(153, 102, 255)',
                    'rgb(201, 203, 207)'
                ],
                borderWidth: 1
            }]
        };
        new Chart(config, {
            type: 'bar',
            data: data,
            options: {
                scales: {
                    y: {
                        beginAtZero: true,
                        ticks: {
                            callback: function (value, index, values) {
                                return value + '万円';  // y축 값에 '万円' 추가
                            }
                        }
                    }
                },


            },


        });

        const data3 = {
            labels: labels,
            datasets: [{
                label: '頂いた想い',
                data: array4,
                backgroundColor: [
                    'rgba(255, 99, 132, 0.2)',
                    'rgba(255, 159, 64, 0.2)',
                    'rgba(255, 205, 86, 0.2)',
                    'rgba(75, 192, 192, 0.2)',
                    'rgba(54, 162, 235, 0.2)',
                    'rgba(153, 102, 255, 0.2)',
                    'rgba(201, 203, 207, 0.2)'
                ],
                borderColor: [
                    'rgb(255, 99, 132)',
                    'rgb(255, 159, 64)',
                    'rgb(255, 205, 86)',
                    'rgb(75, 192, 192)',
                    'rgb(54, 162, 235)',
                    'rgb(153, 102, 255)',
                    'rgb(201, 203, 207)'
                ],
                borderWidth: 1
            }]
        };


        new Chart(config3, {
            type: 'bar',
            data: data3,
            options: {
                scales: {
                    y: {
                        beginAtZero: true,
                        ticks: {
                            callback: function (value, index, values) {
                                return value + '万円';  // y축 값에 '万円' 추가
                            }
                        }
                    }
                },


            },


        });





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
        new Chart(config2, {
            type: 'doughnut',
            data: data2,
        });




        new Chart(ctx2, {
            type: 'doughnut',
            data: {
                labels: array6,
                datasets: [{
                    label: '繋がった想い',
                    data: array5,
                    backgroundColor: ['rgb(255, 0, 0)', 'rgb(255,161,148)', 'rgb(255,194,194)', 'rgb(255,226,75)', 'rgb(251,239,214)'],
                    hoverOffset: 4
                }]
            }, options: {

                responsive: false

            }
        });
          let brideCount =  document.getElementById("jh_guest_bribe_count").value
      let groomCount =      document.getElementById("jh_guest_groom_count").value

        new Chart(config4, {
            type: 'doughnut',
            data: {
                labels: ['新郎ゲスト' , '新婦ゲスト'],
                datasets: [{
                    label: '繋がった想い',
                    data: [groomCount , brideCount],
                    backgroundColor: ['rgb(0, 0, 255)', 'rgb(255, 0, 0)'],
                    hoverOffset: 4
                }]
            }, options: {

                responsive: false

            }
        });


        new Chart(AttendChart, {
            type: 'doughnut',
            data: {
                labels: ['ご出席の方' , 'ご欠席の方'],
                datasets: [{
                    label: '繋がった想い',
                    data: [AttendCount , NotAttendCount],
                    backgroundColor: [  'rgb(255, 99, 132)',
                        'rgb(255, 194, 194)' ],
                    hoverOffset: 4
                }]
            }, options: {

                responsive: false

            }
        });




    });
</script>
<head>
    <meta charset="UTF-8">
    <title>✿ ~ 縁結び ~ ✿</title>
    <style>
        body {
            width: 100%;
            height: 100%;
            margin: 0;
            background-color: #FFFBF7;
            font-family: "Noto Serif JP", serif;
            font-optical-sizing: auto;
            font-weight: bold;
            font-style: normal;
            overflow: hidden visible;
        }

        .container {
            width: 100%;
            max-width: 1200px;
            margin: 0 auto;
        }

        .desktop, .tablet, .mobile {
            display: none;
        }

        @media (min-width: 1024px) {
            .desktop {
                display: block;
            }
        }

        @media (min-width: 768px) and (max-width: 1023px) {
            .tablet {
                display: block;
            }
        }

        @media (max-width: 767px) {
            .mobile {

                display: block;

            }
        }
    .slick-list {


        height : auto;
    }

    </style>
</head>
<body>
<div class="container">
    <div class="desktop">
        <h1>Desktop Layout</h1>
        <p>This is a layout for desktop screens.</p>
    </div>
    <div class="tablet">
        <h1>Tablet Layout</h1>
        <p>This is a layout for tablet screens.</p>
    </div>
    <div id="jh_top" class="mobile">
        <div class="jh_head_container" style="background-color: white; display: flex; margin-top : 1vh;">
            <div><img src="/img/JH_Logo.png" alt=""></div>

            <div id="jh_pageNavi1" class="jh_pageNavigation" style="width: 64%; transform: translateX(-25%);">
                <div id="jh_pageNavi2" class="jh_pageNavigationA" style="background-color: red;     width: 64vw;" onclick="goToFundPage()">
                    <div id="jh_pageNavi3" class="jh_pageNavigationB" style="color: white">贈り物</div>
                </div>
                <div id="jh_pageNavi4" class="jh_pageNavigationA" onclick="goToSendPage()">
                    <div  id="jh_pageNavi5" class="jh_pageNavigationB">ご祝儀</div>
                </div>
            </div>

        </div>
        <div id="jh_slick1" class="slick22">

            <div id="jh_slider11" class="jh_slider">



                <div style="background-color: #FFDBDB ; color : red; height: 8vh; align-content: center; text-align: center ; font-size: 20px;">全体ファンディング現況 </div>
                <div class="jh_title" style="margin-top: 10%; width: 90%; transform: translateX(6%);align-items: center; height: 7rem; background-color: white; border : 1px solid #FF8B8B; border-radius: 20px; display: flex; justify-content: center;   ">
                    <div class="jh_titleName" style="width: 42%; ">大切な因縁から繋がった心の証</div>
                    <div style="width : auto; position : absolute;     right: 3%;
    bottom: -15%; "><img width="" src="/img/diagram 1.png" alt=""></div>
                </div>




                <div>
                    <c:forEach items="${wishlists}" var="w">
                        <input class="jh_wishlist_price" type="hidden" value="${w.wl_price}">
                    </c:forEach>
                    <c:forEach items="${dates}" var="d">
                        <input class="jh_pay_date" type="hidden" value="${d.total_price}">
                    </c:forEach>
                        <c:forEach items="${wishlists}" var="wishlists">
                            <input id="jh_eno_input" type="hidden" value = "${wishlists.e_no}">
                        </c:forEach>

                </div>


                <div style="display: flex;    width: 90%;
    margin-left: 5%; justify-content: center; border: 1px solid #FF8B8B ; background-color: white; border-radius: 20px; margin-top: 10vh; ">
                    <canvas style="width: 100vw ;     margin-bottom: 10%; " id="myChart"></canvas>
                </div>
                <div style="background-color: white; margin-top: 5rem; border: 1px solid #FF8B8B; border-radius: 30px"
                     class="jh_week_data">
                    <div class="jh_week_data_message">最近の一週間集まった想い</div>
                    <div style="display: flex; justify-content: center;">
                        <canvas style="margin-bottom : 2rem;" id="week-data-chart"></canvas>
                    </div>

                </div>
                <div   style="text-align: center ; display: flex; align-items: center; justify-content: space-around;">
                    <img class="jh_prev_btn2"  src="/img/Prev.png">
                    <img  src="/img/Dots1.png">
                    <img  class="jh_next_btn2" src="/img/Next.png" alt="">
                </div>


            </div>


            <div id="jh_slider22" class="jh_slider">

                <div style="background-color: #FFDBDB ; color : red; text-align: center; height:  8vh ;align-content: center; font-size: 20px">詳しいファンディング現況 </div>
                <div class="jh_title" style="width: 90%; transform: translateX(6%); margin-top : 10%;align-items: center; height: 7rem; background-color: white; border : 1px solid #FF8B8B; border-radius: 20px; display: flex; justify-content: center;   ">
                    <div class="jh_titleName" style="width: 42%; ">大切な因縁から繋がった心の証</div>
                    <div style="width : auto; position : absolute;     right: 3%;
    bottom: -15%; "><img width="" src="/img/diagram 1.png" alt=""></div>
                </div>
                <div style="      margin-top: 10%;
    padding-top: 10%;  padding-bottom: 10%;background-color: white; margin-top: 5vh; max-height: 700px;     overflow-y: scroll;
    scrollbar-width: none;  " class="jh_allList_container">
                    <div>
                        <div style="display: flex; justify-content: space-around;">
                            <div class="jh_arrange_button">
                                <button onclick="reorderByProduct(5)" class="jh_arrange_button_button"
                                        id="jh_button_product" type="submit">物品順
                                </button>
                            </div>
                            <div class="jh_arrange_button">
                                <button onclick="reorderByMoney(5)" class="jh_arrange_button_button"
                                        id="jh_button_money" type="submit">金額順
                                </button>
                            </div>
                            <div class="jh_arrange_button">
                                <button onclick="reorderByDate(5)" class="jh_arrange_button_button" id="jh_button_date"
                                        type="submit">日付順
                                </button>
                            </div>
                        </div>
                    </div>
                    <div style="    width: 97%;
    margin-left: 1.5%; background-color: white; border : 1px solid #FF8B8B; margin-top: 2vh; border-radius: 20px; ">
                        <div style="display: flex; justify-content: space-around;">
                            <div class="jh_detail_head">恩人</div>
                            <div class="jh_detail_head">金額</div>
                        </div>
                        <div style="display: flex; justify-content: space-around;     margin-top: 2.5rem;">
                            <div class="jh_detail_head">リスト</div>
                            <div class="jh_detail_head">日付</div>
                        </div>
                    </div>
                    <div id="jh_foreach_test">
                        <c:forEach items="${listupDatas}" var="l">
                            <div style="    width: 97%;
    margin-left: 1.5%; background-color: white; border : 1px solid #FF8B8B; margin-top: 2vh; margin-bottom : 2vh; border-radius: 20px; ">
                                <div style="display: flex; justify-content: space-around;">


                                    <div style="  font-size: 24px;text-align: center">${l.m_fam_kanji}${l.m_name_kanji}</div>
                                    <div style="  font-size: 24px;text-align: center">${l.p_price}円</div>
                                </div>
                                <div style="display: flex; justify-content: space-around;margin-top: 2.5rem">
                                    <div style="  font-size: 24px;text-align: center">${l.wl_product}</div>
                                    <div style="  font-size: 24px;text-align: center"><fmt:formatDate
                                            value="${l.p_date}" pattern="yyyy-MM-dd"></fmt:formatDate></div>
                                </div>


                            </div>
                        </c:forEach>
                    </div>
                </div>
                <div   style="height : 6rem;text-align: center ; display: flex; align-items: center; justify-content: space-around;">
                    <img class="jh_prev_btn2"  src="/img/Prev.png">
                    <img  src="/img/Dots2.png">
                    <img  class="jh_next_btn2" src="/img/Next.png" alt="">
                </div>
            </div>
            <div id="jh_slider33" class="jh_slider">

                <div style="background-color: #FFDBDB ; color : red; text-align: center ;align-content: center; font-size: 20px; height: 8vh;">個別贈り物の現況 </div>
                <div class="jh_title" style="width: 90%;  transform: translateX(6%);align-items: center; height: 7rem; margin-top: 10%;; background-color: white; border : 1px solid #FF8B8B; border-radius: 20px; display: flex; justify-content: center;   ">
                    <div class="jh_titleName" style="width: 42%; ">大切な因縁から繋がった心の証</div>
                    <div style="width : auto; position : absolute;     right: 3%;
    bottom: -15%; "><img width="" src="/img/diagram 1.png" alt=""></div>
                </div>
                <div style="display: flex;flex-direction: column;justify-content: center; margin-top: 5vh;  border :1px solid #FF8B8B; border-radius: 20px ; background-color: white"
                     class="jh_other_infos">
                    <div style="margin-top: 2vh;" id="jh_detailHead" class="jh_funding_detail">全体的な情報</div>
                    <div style="margin-top: 5vh;" id="jh_numberOfPeople" class="jh_funding_detail">繋がれた因縁
                        : ${NumberOfPeople}名
                    </div>
                    <div id="jh_popularDate" class="jh_funding_detail">一番数多くの因縁が訪れた日 : ${PopularDate}</div>
                    <div id="jh_highestPrice" class="jh_funding_detail">最も大きい思い :　${highestPrice}円</div>
                    <div id="jh_rankingOfWishlist" class="jh_funding_detail">一番人気のプレゼント
                        : ${PopularWishlist}</div>

                </div>
                <div class="jh_product_detail_container" style="margin-top: 10%;">

                    <button id="jh_select_tag"
                            style="background-color: white; width: 47%; padding: 5%; transform: translateX(47vw); text-align: center; font-family: 'Noto Serif JP', serif; font-weight: bold">
                        物品をお選びください
                    </button>

                    <!-- 모달 구조 -->
                    <div id="jh_modal" class="jh_modal" style="display: none;">
                        <div class="jh_modal_content" style="padding: 20px; text-align: center;">
                            <span id="jh_close_btn" class="jh_closeBtn"
                                  style="float: right; cursor: pointer;">&times;</span>
                            <h2>物品をお選びください</h2>
                            <ul id="jh_wishlist_items" style="list-style-type: none; padding: 0;">
                                <c:forEach items="${wishlists}" var="w">
                                    <li style="margin: 10px 0;">
                                        <button class="jh_wishlists" name="${w.wl_price}" value="${w.wl_no}"
                                                data-eno="${w.e_no}" data-value="${w.wl_no}"
                                                data-price="${w.wl_price}">${w.wl_product}</button>
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>
                    </div>

                    <!-- 기존 숨겨진 인풋 -->
                    <input id="jh_price_input" type="hidden" value="${payPrice}">

                    <%--   <div style="margin-top: 3rem;" class="jh_product_label">
                           <label>
                               <select id="jh_select_tag" onchange="" style="width: 33%; padding: 5% ;
       transform: translateX(60vw); text-align: center;">
                                   <c:forEach items="${wishlists}" var="w">
                                       <option id="jh_price_test" name="${w.wl_price}" value="${w.wl_no}"
                                               class="jh_wishlists">${w.wl_product}</option>
                                   </c:forEach>

                               </select>
                           </label>
                           <input id="jh_price_input" type="hidden" value="${payPrice}">
                       </div>--%>

                    <div class="jh_product_chart">
                        <canvas id="jh_product_chart"></canvas>
                    </div>


                </div>



                <div   style="text-align: center ; display: flex; align-items: center; justify-content: space-around;">
                    <img class="jh_prev_btn2"  src="/img/Prev.png">
                    <img  src="/img/Dots3.png">
                    <img  class="jh_next_btn2" src="/img/Next.png" alt="">
                </div>


            </div>
        </div>

        <div style="display: none;" class="slick" id="jh_slick2">
            <div class="jh_slider" id="jh_slider111" style="width: auto;">



                <div style="background-color: #FFDBDB ; color : red; height: 8vh; align-content: center; text-align: center ; font-size: 20px;">全体ファンディング現況 </div>
                <div class="jh_title" style="margin-top: 10%; width: 90%; transform: translateX(6%);align-items: center; height: 7rem; background-color: white; border : 1px solid #FF8B8B; border-radius: 20px; display: flex; justify-content: center;   ">
                    <div class="jh_titleName" style="width: 42%; ">大切な因縁から繋がった心の証</div>
                    <div style="width : auto; position : absolute;     right: 3%;
    bottom: -15%; "><img width="" src="/img/diagram 1.png" alt=""></div>
                </div>






                <c:forEach var="s" items="${  SendPriceOrderByRelation}">
                    <div><input class="jh_priceByRelation" type="hidden" value="${s.p_price}"></div>
                    <div><input class="jh_send_relation" type="hidden" value="${s.g_relation}"></div>
                </c:forEach>
                <div style="display: flex;     width: 90%;
    margin-left: 5%;justify-content: center; border: 1px solid #FF8B8B ; background-color: white; border-radius: 20px; margin-top: 10vh; ">
                    <canvas style="width: 100vw ; height: 50vh; " id="myChart2"></canvas>
                </div>
                <div style="background-color: white; margin-top: 5rem; border: 1px solid #FF8B8B; border-radius: 30px"
                     class="jh_week_data">
                    <div class="jh_week_data_message">最近の一週間集まった想い</div>
                    <div style="display: flex; justify-content: center;">
                        <canvas style="" id="week-data-chart2"></canvas>
                    </div>
                    <c:forEach var="s" items="${SumPricesOfSend}">
                        <div><input class="jh_send_price" type="hidden" value="${s.p_price}"></div>
                    </c:forEach>

                </div>
                <div   style="text-align: center ; display: flex; align-items: center; justify-content: space-around;">
                    <img class="jh_prev_btn"  src="/img/Prev.png">
                    <img  src="/img/Dots1.png">
                    <img  class="jh_next_btn" src="/img/Next.png" alt="">
                </div>


            </div>
            <div class="jh_slider" id="jh_slider222">

                <div style="background-color: #FFDBDB ; color : red; text-align: center; height:  8vh ;align-content: center; font-size: 20px">詳しいファンディング現況 </div>
                <div class="jh_title" style="width: 90%; transform: translateX(6%); margin-top : 10%;align-items: center; height: 7rem; background-color: white; border : 1px solid #FF8B8B; border-radius: 20px; display: flex; justify-content: center;   ">
                    <div class="jh_titleName" style="width: 45%; ">大切な因縁から繋がった心の証</div>
                    <div style="width : auto; position : absolute;     right: 3%;
    bottom: -15%; "><img width="" src="/img/diagram 1.png" alt=""></div>
                </div>
                <div style="      margin-top: 10%;
    padding-top: 10%;  padding-bottom: 10%;background-color: white; margin-top: 5vh; max-height: 700px;     overflow-y: scroll;
    scrollbar-width: none;  " class="jh_allList_container">
                    <div>
                        <div style="display: flex; justify-content: space-around;">
                            <div class="jh_arrange_button">
                                <button onclick="reorderSendByRelation(5)" class="jh_arrange_button_button"
                                        id="jh_button_product2" type="submit">関係別
                                </button>
                            </div>
                            <div class="jh_arrange_button">
                                <button onclick="reorderSendByMoney(5)" class="jh_arrange_button_button"
                                        id="jh_button_money2" type="submit">金額順
                                </button>
                            </div>
                            <div class="jh_arrange_button">
                                <button onclick="reorderSendByDate(5)" class="jh_arrange_button_button" id="jh_button_date2"
                                        type="submit">日付順
                                </button>
                            </div>
                        </div>
                    </div>
                    <div style="    width: 94%;
    margin-left: 3%; background-color: white; border :1px solid #FF8B8B; margin-top: 2vh; border-radius: 20px; ">
                        <div style="display: flex; justify-content: space-around;">
                            <div class="jh_detail_head">恩人</div>
                            <div class="jh_detail_head">金額</div>
                        </div>
                        <div style="display: flex; justify-content: space-around;     margin-top: 2.5rem;">
                            <div class="jh_detail_head">関係</div>
                            <div class="jh_detail_head">日付</div>
                        </div>
                    </div>
                    <div id="jh_foreach_test2">
                        <c:forEach items="${sendDatas}" var="l">
                            <div style="    width: 94%;
    margin-left: 3%; background-color: white; border :1px solid #FF8B8B; margin-top: 2vh; margin-bottom : 2vh; border-radius: 20px; ">
                                <div style="display: flex; justify-content: space-around;">


                                    <div style="  font-size: 24px;text-align: center">${l.m_fam_kanji}${l.m_name_kanji}</div>
                                    <div   style="  font-size: 24px;text-align: center">${l.p_price}円</div>
                                </div>
                                <div style="display: flex; justify-content: space-around;margin-top: 2.5rem">
                                    <div style="  font-size: 24px;text-align: center">${l.g_relation}</div>
                                    <div style="  font-size: 24px;text-align: center"><fmt:formatDate
                                            value="${l.p_date}" pattern="yyyy-MM-dd"></fmt:formatDate></div>
                                </div>


                            </div>
                        </c:forEach>
                    </div>
                </div>
                <div   style="height : 6rem; text-align: center ; display: flex; align-items: center; justify-content: space-around;">
                    <img class="jh_prev_btn"  src="/img/Prev.png">
                    <img  src="/img/Dots2.png">
                    <img  class="jh_next_btn" src="/img/Next.png" alt="">
                </div>
            </div>
            <div class="jh_slider" id="jh_slider333">

                <div style="background-color: #FFDBDB ; color : red; text-align: center ;align-content: center; font-size: 20px; height: 8vh;">個別贈り物の現況 </div>
                <div class="jh_title" style="width: 90%;  transform: translateX(6%);align-items: center; height: 7rem; margin-top: 10%;; background-color: white; border : 1px solid #FF8B8B; border-radius: 20px; display: flex; justify-content: center;   ">
                    <div class="jh_titleName" style="width: 42%; ">大切な因縁から繋がった心の証</div>
                    <div style="width : auto; position : absolute;     right: 3%;
    bottom: -15%; "><img width="" src="/img/diagram 1.png" alt=""></div>
                </div>
               <%-- <button id="jh_select_tag2"
                                                      style="margin-top : 10%; background-color: white; width: 47%; padding: 5%; transform: translateX(47vw); text-align: center; font-family: 'Noto Serif JP', serif; font-weight: bold">
                    物品をお選びください
                </button>--%>
                <div style="display: flex;flex-direction: column;justify-content: center; margin-top: 5vh;  border :1px solid #FF8B8B ; border-radius: 20px ; background-color: white"
                     class="jh_other_infos">
                    <div style="margin-top: 2vh;" id="jh_detailHead2" class="jh_funding_detail">全体的な情報</div>
                    <div style="margin-top: 5vh;" id="jh_numberOfPeople2" class="jh_funding_detail">ご祝儀を送った人
                        : ${SendNumberOfPeople}名
                    </div>
                    <div id="jh_popularDate2" class="jh_funding_detail">一番数多くの因縁が訪れた日 : ${SendPopularDate}</div>
                    <div id="jh_highestPrice2" class="jh_funding_detail">最も大きい祝儀 :　${SendHighestPrice}円</div>
                    <div id="jh_rankingOfWishlist2" class="jh_funding_detail">一番多い関係
                        : ${SendPopularRelation}</div>

                </div>
                <div class="jh_product_detail_container" style="margin-top: 10%;">
                    <input id="jh_guest_groom_count" type="hidden" value="${GuestTypeCount.groom_guest_count}">
                    <input id="jh_guest_bribe_count" type="hidden" value="${GuestTypeCount.bride_guest_count}">

                    <!-- 모달 구조 -->
                    <div id="jh_modal" class="jh_modal" style="display: none;">
                        <div class="jh_modal_content" style="padding: 20px; text-align: center;">
                            <span id="jh_close_btn2" class="jh_closeBtn"
                                  style="float: right; cursor: pointer;">&times;</span>
                            <h2>物品をお選びください</h2>
                            <ul id="jh_wishlist_items2" style="list-style-type: none; padding: 0;">
                                <c:forEach items="${wishlists}" var="w">
                                    <li style="margin: 10px 0;">
                                        <button class="jh_wishlists2" name="${w.wl_price}" value="${w.wl_no}"
                                                data-eno="${w.e_no}" data-value="${w.wl_no}"
                                                data-price="${w.wl_price}">${w.wl_product}</button>
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>
                    </div>

                    <!-- 기존 숨겨진 인풋 -->
                    <input id="jh_price_input" type="hidden" value="${payPrice}">

                    <%--   <div style="margin-top: 3rem;" class="jh_product_label">
                           <label>
                               <select id="jh_select_tag" onchange="" style="width: 33%; padding: 5% ;
       transform: translateX(60vw); text-align: center;">
                                   <c:forEach items="${wishlists}" var="w">
                                       <option id="jh_price_test" name="${w.wl_price}" value="${w.wl_no}"
                                               class="jh_wishlists">${w.wl_product}</option>
                                   </c:forEach>

                               </select>
                           </label>
                           <input id="jh_price_input" type="hidden" value="${payPrice}">
                       </div>--%>

                    <div style="background-color :white; width : 96%; margin-left: 2%; border: 1px solid #FF8B8B ; border-radius: 20px; ">
                    <div style="text-align: center; margin-top: 5%;">送った人々の情報</div>
                    <div class="jh_product_chart" style="    display: flex; justify-content: center;">
                        <canvas id="jh_send_chart"></canvas>
                    </div>
                    <div class="jh_product_chart" style=" margin-bottom: 5%;   display: flex; justify-content: center;">
                        <canvas id="jh_attend_chart"></canvas>
                    </div>
                    <input id="AttendCount" type="hidden" value="${AttendCount.attend_count}">
                    <input id="NotAttendCount" type="hidden" value="${AttendCount.not_attend_count}">
                    </div>




                </div>



                <div   style="text-align: center ; display: flex; align-items: center; justify-content: space-around;">
                    <img class="jh_prev_btn"  src="/img/Prev.png">
                    <img  src="/img/Dots3.png">
                    <img  class="jh_next_btn" src="/img/Next.png" alt="">
                </div>


            </div>
        </div>




    </div>
</div>

</body>
</html>