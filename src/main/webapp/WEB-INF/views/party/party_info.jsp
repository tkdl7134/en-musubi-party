
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
            href="https://fonts.googleapis.com/css2?family=Noto+Serif+JP:wght@200..900&display=swap"
            rel="stylesheet"
    />
    <link rel="stylesheet" href="/resources/css/party/party_info.css" />
    <style>

        @keyframes man {
            from {
                height: 0%;
            }
            to {
                height: ${malePercentage}%;
            }
        }
        @keyframes woman {
            from {
                height: 0%;
            }
            to {
                height: ${femalePercentage}%;
            }
        }
    </style>
</head>
<body>
<div class="yr_party-info-container">
    <div class="yr_title"> 縁パーティー 参加者情報</div>
    <div class="yr_party-red-loof"><img src="footer.png" alt="" /></div>
    <div class="yr_go_to_chat_wrap">
        <button id="yr_go_to_chat" onclick="location.href='chat'">
            <img src="glass-shoes.png" alt="" />
            <span>
            縁パーティー<br />
            チャットに参加
          </span>
        </button>
    </div>
    <div class="yr_ratio">
        <span>男女の比率</span>
        <div class="yr_graph_wrap">
            <div class="yr_graph">
                <div id="yr_graph_bar1" class="yr_graph_bar man" style="height: ${malePercentage}%;"></div>
                <div id="yr_graph_bar2" class="yr_graph_bar woman" style="height: ${femalePercentage}%;"></div>
            </div>
            <div class="yr_graph_label_wrap">
                <span class="yr_graph_label">男性</span>
                <span class="yr_graph_label">女性</span>
            </div>
        </div>
    </div>
    <div class="yr_ratio age">
        <span>年齢の分布</span>
        <div class="yr_graph_donut">
            <canvas id="ageDonutChart"></canvas>
        </div>
    </div>
<%--    <button class="yr_apply_cancel">参加 キャンセル</button>--%>

</div>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels@2.0.0"></script>
<script src="/resources/js/party/party_info.js"></script>
<script>
    document.addEventListener("DOMContentLoaded", function() {
        const ageDistribution = {
            "20代初め": ${ageDistribution['20代初め']},
            "20代半ば": ${ageDistribution['20代半ば']},
            "20代後半": ${ageDistribution['20代後半']},
            "30代初め": ${ageDistribution['30代初め']},
            "30代半ば": ${ageDistribution['30代半ば']},
            "30代後半": ${ageDistribution['30代後半']}
        };

        const total = Object.values(ageDistribution).reduce((a, b) => a + b, 0);

        const ctx = document.getElementById("ageDonutChart").getContext("2d");
        const ageDonutChart = new Chart(ctx, {
            type: "doughnut",
            data: {
                labels: Object.keys(ageDistribution),
                datasets: [
                    {
                        label: "Age Distribution",
                        data: Object.values(ageDistribution),
                        backgroundColor: [
                            "#ef696e",
                            "#ff8b92",
                            "#ff5a5f",
                            "#ffc0c3",
                            "#f56c7a",
                            "#ffb0b4",
                        ],
                        hoverOffset: 4,
                    },
                ],
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                cutout: "60%",
                plugins: {
                    legend: {
                        display: true,
                        position: "bottom",
                    },
                    datalabels: {
                        display: true,
                        color: 'black',
                        formatter: function(value, context) {
                            if (value === 0) {
                                return ''; // 값이 0인 경우 빈 문자열을 반환하여 레이블을 표시하지 않음
                            }
                            const percentage = ((value / total) * 100).toFixed(1) + '%';
                            const label = context.chart.data.labels[context.dataIndex];
                            return label + `\n` + percentage;
                        },
                        font: {
                            weight: 'bold',
                            size: 23
                        },
                        anchor: 'end',
                        align: 'start'
                    }
                },
            },
            plugins: [ChartDataLabels]
        });
    });
</script>
</body>
</html>