<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="../menubar.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <link rel="icon" type="image/png" href="/img/favicon.png">

    <title>✿ ~ 縁結び ~ 縁パーティー ~ ✿</title>
    <link rel="preconnect" href="https://fonts.googleapis.com"/>
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin/>
    <link
            href="https://fonts.googleapis.com/css2?family=Noto+Serif+JP:wght@200..900&display=swap"
            rel="stylesheet"
    />
    <link rel="stylesheet" href="/css/party/party_info.css"/>
    <style>

        @keyframes yr_man {
            from {
                height: 0%;
            }
            to {
                height: ${malePercentage}%;
            }
        }

        @keyframes yr_woman {
            from {
                height: 0%;
            }
            to {
                height: ${femalePercentage}%;
            }
        }

        @keyframes yr_groom {
            from {
                height: 0%;
            }
            to {
                height: ${groomGuestPercentage}%;
            }
        }

        @keyframes yr_bride {
            from {
                height: 0%;
            }
            to {
                height: ${brideGuestPercentage}%;
            }
        }
    </style>


    <link rel="stylesheet" href="/css/menubar.css">
    <script src="/js/menubar.js" defer></script>
</head>
<body>



<div class="yr_party-info-container">

    <div class="yr_title">縁パーティー インフォ </div>

    <%--     채팅방으로 가는 버튼--%>
    <div class="yr_go_to_chat_wrap">
        <button id="yr_go_to_chat" onclick="location.href='/r'">
            <span>
            縁パーティー<br/>
            チャットに参加
          </span>
        </button>
        <img src="/img/chat.png">
    </div>

    <%--     신랑신부측 하객 비율 그래프--%>
    <div class="yr_ratio side">
        <p>新郎新婦のゲスト比率</p>
        <div class="yr_graph_wrap">
            <div class="yr_graph">
                <div id="yr_side_graph_bar1" class="yr_graph_bar1 yr_groom" style="height: ${groomGuestPercentage}%;"></div>
                <div id="yr_side_graph_bar2" class="yr_graph_bar2 yr_bride" style="height: ${brideGuestPercentage}%;"></div>
            </div>
            <div class="yr_graph_label_wrap1">
                <span class="yr_side_graph_label">新郎側<br/>ゲスト</span>
                <span class="yr_side_graph_label">新婦側<br/>ゲスト</span>
            </div>
            <div class="yr_graph_percent_wrap">
                <div class="circle1"></div>新郎側 &nbsp <fmt:formatNumber value="${groomGuestPercentage}" type="number" maxFractionDigits="1"/>% &nbsp &nbsp
                <div class="circle2"></div>新婦側 &nbsp  <fmt:formatNumber value="${brideGuestPercentage}" type="number" maxFractionDigits="1"/>%
            </div>

        </div>
    </div>

    <%--     남녀 분포도 그래프--%>
    <div class="yr_ratio type">
        <p>男女比率</p>
        <div class="yr_graph_wrap">
            <div class="yr_graph">
                <div id="yr_graph_bar1" class="yr_graph_bar1 yr_man" style="height: ${malePercentage}%;"></div>
                <div id="yr_graph_bar2" class="yr_graph_bar2 yr_woman" style="height: ${femalePercentage}%;"></div>
            </div>
            <div class="yr_graph_label_wrap2">
                <span class="yr_graph_label">男子</span>
                <span class="yr_graph_label">女子</span>
            </div>
            <div class="yr_graph_percent_wrap">
                <div class="circle1"></div>男子 &nbsp <fmt:formatNumber value="${malePercentage}" type="number" maxFractionDigits="1"/>% &nbsp &nbsp
                <div class="circle2"></div>女子 &nbsp <fmt:formatNumber value="${femalePercentage}" type="number" maxFractionDigits="1"/>%
            </div>
        </div>
    </div>

    <%--     연령분포 그래프--%>
    <div class="yr_ratio age">
        <p>年齢分布</p>
        <div class="yr_graph_donut">
            <canvas id="ageDonutChart"></canvas>
        </div>
    </div>
    <%--    <button class="yr_apply_cancel">参加 キャンセル</button>--%>

    <%--    마지막에도 채팅방으로 가는 버튼--%>
    <div class="yr_go_to_chat_wrap">
        <button id="yr_go_to_chat2" onclick="location.href='/r'">
            <span>
            縁パーティー<br/>
            チャットに参加
          </span>
        </button>
    </div>


    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels@2.0.0"></script>
    <script src="/js/party/party_info.js"></script>
    <script>
        document.addEventListener("DOMContentLoaded", function () {
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
                                "#FFC2C2",
                                "#FF5153",
                                "#FF6B52",
                                "#FFAD39",
                                "#FFD966",
                                "#FFAFA3",
                            ],
                            hoverOffset: 4,
                        },
                    ],
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false,
                    cutout: "50%",
                    plugins: {
                        legend: {
                            display: true,
                            position: "bottom",
                            labels: {
                                usePointStyle: true,
                                pointStyle: 'circle',
                                font: {
                                    size: 14,
                                    family: 'Noto Serif JP'
                                },
                                color: 'black',
                                padding: 18,
                            },
                        },
                        datalabels: {
                            display: true,
                            color: 'black',
                            formatter: function (value, context) {
                                if (value === 0) {
                                    return ''; // 값이 0인 경우 빈 문자열을 반환하여 레이블을 표시하지 않음
                                }
                                const percentage = ((value / total) * 100).toFixed(1) + '%';
                                const label = context.chart.data.labels[context.dataIndex];
                                return label + ` - ` + percentage;
                            },
                            font: {
                                weight: '400',
                                size: 14
                            },
                            anchor: 'center',
                            align: 'center'
                        }
                    },
                },
                plugins: [ChartDataLabels]
            });
        });
    </script>
</body>
</html>