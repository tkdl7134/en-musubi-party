<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html; charset=utf-8" %>
<!DOCTYPE html>
<html style="zoom : 100% !important;" lang="en">
<link rel="stylesheet" href="/resources/css/statistics/statistics.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+JP:wght@200..900&display=swap" rel="stylesheet">
<script src="/resources/js/statistics/statistics.js" defer></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
    document.addEventListener('DOMContentLoaded', function () {
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
        let WishlistPrice = document.getElementById('jh_price_test').getAttribute('name');
        console.log(PaidPriceData)
        console.log(WishlistPrice)





    const eno = 5; /*여기 나중에 바뀌어야함, session이던 뭐던가로 eno 가져오기*/
    let array = []
  let wishlists = document.querySelectorAll('option.jh_wishlists');
 wishlists.forEach(function (wishlist) {
  array.push(wishlist.innerText);
 })
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
  array3.push(wishlist.value);
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
            type: 'pie',
            data: {
                labels: array,
                datasets: [{
                    label: '繋がった想い',
                    data: array2,
                    backgroundColor: ['rgb(255, 0, 0)', 'rgb(255, 165, 0)', 'rgb(255, 255, 0)' , 'rgb(0, 255, 0)' , 'rgb(0, 0, 255)' , 'rgb(75, 0, 130)' , 'rgb(238, 130, 238)' ],
                    hoverOffset: 4
                }]
            },options: {

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
                        beginAtZero: true
                    }
                }
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
        new Chart (config2 ,{
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
        <div class="jh_navigation" style="">
            <div>縁結び</div>
            <div><img src="" alt="aa"></div>
        </div>
        <div class="jh_title" style="  ">
            <div class="jh_titleName" style="  ">通計ページ</div>
            <div><img style="width: 100%; margin-top: 2rem" src="/resources/img/footer.png" alt=""></div>
        </div>
        <div class="jh_pageNavigation" style="">
            <div class="jh_pageNavigationA">
                <div class="jh_pageNavigationB" style="color: red">ファンディング</div>
                <div class="jh_pageNavigationB" style="color: red">の現状</div>
            </div>
            <div class="jh_pageNavigationA" onclick="goToSendPage()">
                <div class="jh_pageNavigationB">ご祝儀</div>
                <div class="jh_pageNavigationB">の現状</div>
            </div>
        </div>
        <div id="jh_top_button"><img onclick="goToTop()" style="width: 10vh; height: 10vh; position: fixed;
    right: 1rem; z-index: 100;
    bottom: 1rem;" src="/resources/img/top_button.png" alt=""></div>
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
        <div style="margin-top: 5rem;" class="jh_week_data">
            <div class="jh_week_data_message">一週間集まった想い</div>
            <div style="display: flex; justify-content: center;">
                <canvas style="" id="week-data-chart"></canvas>
            </div>
        </div>

        <div class="jh_product_detail_container">
        <div style="margin-top: 3rem;" class="jh_product_label">
       <label>
           <select id="jh_select_tag" onchange=""  style="width: 33%; padding: 5% ;
    transform: translateX(60vw); text-align: center;">
               <c:forEach items="${wishlists}" var="w">
               <option id="jh_price_test" name="${w.wl_price}" value="${w.wl_no}" class="jh_wishlists">${w.wl_product}</option>
            </c:forEach>

            </select>
        </label>
            <input id="jh_price_input" type="hidden" value="${payPrice}">
   </div>
           <div class="jh_product_image"><img style="margin-top : 1rem;width: 100%" src="/resources/img/ソファー.png" alt=""></div>
        <div  class="jh_product_chart">
        <canvas id="jh_product_chart"></canvas>
        </div>

            
        </div>

<div style="display: flex;flex-direction: column;justify-content: center; margin-top: 5vh;  border :1px solid black ; border-radius: 20px ; background-color: pink" class="jh_other_infos">
    <div style="margin-top: 2vh;" class="jh_funding_detail">特別な想い出</div>
    <div style="margin-top: 5vh;" class="jh_funding_detail">繋がれた因縁 : @@名</div>
    <div class="jh_funding_detail">一番数多くの因縁が訪れた日 : @@월 @@일</div>
    <div class="jh_funding_detail">集まった想い :　@@円 </div>
    <div class="jh_funding_detail">私に一番渡したいプレゼント : ㅁ</div>

</div>

        <div style="background-color: #FFDBDB; margin-top: 5vh; " class="jh_allList_container">
            <div>
                <div style="display: flex; justify-content: flex-end;">
                 <div class="jh_arrange_button">   <button class="jh_arrange_button_button" type="submit">名前順</button></div>
                    <div class="jh_arrange_button">  <button class="jh_arrange_button_button"  type="submit">金額順</button></div>
                    <div class="jh_arrange_button">   <button class="jh_arrange_button_button"  type="submit">日付順</button></div>
                </div>
            </div>
    <div style="display: flex;background-color: white; border : 1px solid black; margin-top: 2vh; border-radius: 20px; ">
        <div class="jh_detail_head">恩人</div>
        <div class="jh_detail_head">金額</div>
        <div class="jh_detail_head">日付</div>
    </div>




    </div>
</div>
</div>

</body>
</html>