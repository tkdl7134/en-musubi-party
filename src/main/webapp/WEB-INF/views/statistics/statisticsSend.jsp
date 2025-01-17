<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html; charset=utf-8" %>
<!DOCTYPE html>
<html style="zoom : 100% !important;" lang="en">
<link rel="stylesheet" href="/resources/css/statistics/statistics.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+JP:wght@200..900&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<script src="/resources/js/statistics/statistics.js" defer></script>
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
        $('.slick').slick({
            dots: false,
            infinite: false,
            speed: 500,
            slidesToShow: 1,
            slidesToScroll: 1,
            adaptiveHeight: true,

            prevArrow : $(".jh_prev_btn"),
            nextArrow : $(".jh_next_btn"),


        });


        const ctx = document.getElementById('myChart').getContext('2d');
        const config = document.getElementById('week-data-chart').getContext('2d');
        const config2 = document.getElementById('jh_product_chart').getContext('2d');
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
            array3.push(wishlist.value/10000);
        })
        console.log(array3);


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
                    backgroundColor: ['rgb(255, 0, 0)', 'rgb(255, 165, 0)', 'rgb(255, 255, 0)', 'rgb(0, 255, 0)', 'rgb(0, 0, 255)', 'rgb(75, 0, 130)', 'rgb(238, 130, 238)'],
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
                            callback: function(value, index, values) {
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
                    'rgb(255, 255, 255)'
                ],
                hoverOffset: 4
            }]
        };
        new Chart(config2, {
            type: 'doughnut',
            data: data2,
        });


    });
</script>
<head>
    <meta charset="UTF-8">
    <title>Title</title>
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

        <div class="slick">
            <div class="jh_slider">
                <div class="jh_pageNavigation" style="">
                    <div class="jh_pageNavigationA" onclick="goToFundPage()">
                        <div class="jh_pageNavigationB"  >ファンディング</div>
                        <div class="jh_pageNavigationB" >の現状</div>
                    </div>
                    <div class="jh_pageNavigationA" onclick="goToSendPage()">
                        <div class="jh_pageNavigationB" style="color: red">ご祝儀</div>
                        <div class="jh_pageNavigationB" style="color: red">の現状</div>
                    </div>
                </div>
                <div class="jh_title" style="  ">
                    <div class="jh_titleName" style="  ">通計ページ</div>
                </div>
                <div><img style="width : 100%;" src="/resources/img/111.png" alt=""></div>


                <div class="jh_message">大切な因縁から繋がった心の証</div>
                <div style="display: flex;
    justify-content: center;"><img style="width: 90%" src="/resources/img/lineShort.png" alt=""></div>
                <div class="jh_funding_message">✿ファンディングの現状✿</div>
                <div class="jh_wishlist_message">ウィッシュリストの情報</div>

                <div>
                    <c:forEach items="${wishlists}" var="w">
                        <input class="jh_wishlist_price" type="hidden" value="${w.wl_price}">
                    </c:forEach>
                    <c:forEach items="${dates}" var="d">
                        <input class="jh_pay_date" type="hidden" value="${d.total_price}">
                    </c:forEach>

                </div>


                <div style="display: flex; justify-content: center">
                    <canvas style="width: 100vw ; height: 50vh; " id="myChart"></canvas>
                </div>
                <div style="background-color: white; margin-top: 5rem; border: 1px solid black; border-radius: 30px" class="jh_week_data">
                    <div class="jh_week_data_message">一週間集まった想い</div>
                    <div style="display: flex; justify-content: center;">
                        <canvas style="" id="week-data-chart"></canvas>
                    </div>

                </div>
                <div style="text-align: center"><button style="margin-top : 10%; " class="jh_next_btn">次に</button></div>


            </div>


            <div class="jh_slider">
                <div class="jh_title" style="  ">
                    <div class="jh_titleName" style="  ">通計ページ</div>
                </div>
                <div><img style="width :100%;" src="/resources/img/222.png" alt=""></div>
                <div style="background-color: #FFDBDB; margin-top: 5vh; " class="jh_allList_container">
                    <div>
                        <div style="display: flex; justify-content: flex-end;">
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
    margin-left: 1.5%; background-color: white; border : 1px solid black; margin-top: 2vh; border-radius: 20px; ">
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
    margin-left: 1.5%; background-color: white; border : 1px solid black; margin-top: 2vh; border-radius: 20px; ">
                                <div style="display: flex; justify-content: space-around;">


                                    <div style="  font-size: 24px;text-align: center">${l.m_fam_kanji}${l.m_name_kanji}</div>
                                    <div style="  font-size: 24px;text-align: center">${l.p_price}円</div>
                                </div>
                                <div style="display: flex; justify-content: space-around;margin-top: 2.5rem">
                                    <div style="  font-size: 24px;text-align: center">${l.wl_product}</div>
                                    <div style="  font-size: 24px;text-align: center"><fmt:formatDate value="${l.p_date}" pattern="yyyy-MM-dd"></fmt:formatDate></div>
                                </div>


                            </div>
                        </c:forEach>
                    </div>
                </div>
                <div style="display: flex; justify-content: space-around">
                    <div style="text-align: center"><button class="jh_prev_btn">先に</button></div>
                    <div style="text-align: center"><button class="jh_next_btn">次に</button></div>
                </div>
            </div>
            <div class="jh_slider">
                <div class="jh_title" style="  ">
                    <div class="jh_titleName" style="  ">通計ページ</div>
                </div>
                <div><img style="width: 100%;" src="/resources/img/333.png" alt=""></div>
                <div class="jh_product_detail_container">

                    <button id="jh_select_tag" style="width: 33%; padding: 5%; transform: translateX(60vw); text-align: center;">Select Product</button>

                    <!-- 모달 구조 -->
                    <div id="jh_modal" class="jh_modal" style="display: none;">
                        <div class="jh_modal_content" style="padding: 20px; text-align: center;">
                            <span id="jh_close_btn" class="jh_closeBtn" style="float: right; cursor: pointer;">&times;</span>
                            <h2>Select a Product</h2>
                            <ul id="jh_wishlist_items" style="list-style-type: none; padding: 0;">
                                <c:forEach items="${wishlists}" var="w">
                                    <li style="margin: 10px 0;">
                                        <button class="jh_wishlists" name="${w.wl_price}" value="${w.wl_no}" data-eno = "${w.e_no}" data-value="${w.wl_no}" data-price="${w.wl_price}">${w.wl_product}</button>
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
                    <div class="jh_product_image"><img style="margin-top : 1rem;width: 100%"
                                                       src="/resources/img/ソファー.png" alt=""></div>
                    <div class="jh_product_chart">
                        <canvas id="jh_product_chart"></canvas>
                    </div>


                </div>

                <div style="display: flex;flex-direction: column;justify-content: center; margin-top: 5vh;  border :1px solid black ; border-radius: 20px ; background-color: pink"
                     class="jh_other_infos">
                    <div style="margin-top: 2vh;" id="jh_detailHead" class="jh_funding_detail">全体的な情報</div>
                    <div style="margin-top: 5vh;" id="jh_numberOfPeople" class="jh_funding_detail">繋がれた因縁 : ${NumberOfPeople}名</div>
                    <div id="jh_popularDate" class="jh_funding_detail">一番数多くの因縁が訪れた日 : ${PopularDate}</div>
                    <div id="jh_highestPrice" class="jh_funding_detail">最も大きい思い :　${highestPrice}円</div>
                    <div id="jh_rankingOfWishlist" class="jh_funding_detail">一番人気のプレゼント : ${PopularWishlist}</div>

                </div>

                <div><button  style="margin-left: 27%" class="jh_prev_btn">先に</button></div>


            </div>
        </div>
    </div>
</div>

</body>
</html>