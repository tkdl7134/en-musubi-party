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
    const eno = 1; /*여기 나중에 바뀌어야함, session이던 뭐던가로 eno 가져오기*/

        for (let i = 6; i > -1; i--) {
            const date = new Date(today);
            date.setDate(today.getDate() - i);
            dates.push(formatDate(date));
        }

        function getWishlistData() {
            location.href = '/statistics/getWishlistData'

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
                labels: ['WishlistA', 'WishlistB', 'WishlistC'],
                datasets: [{
                    label: '繋がった想い',
                    data: [300, 50, 100],
                    backgroundColor: ['rgb(255, 99, 132)', 'rgb(54, 162, 235)', 'rgb(255, 205, 86)'],
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
                data: [65000, 59000, 80000, 81000, 56000, 55000, 40000],
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
                data: [300, 150],
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
            <select style="width: 20%; padding: 4%;
    transform: translateX(73vw); text-align: center;">
                <option>A</option>
                <option>B</option>
                <option>C</option>
                <option>D</option>

            </select>
        </label>
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