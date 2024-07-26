
<%@ page contentType="text/html; charset=utf-8"%>
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
</head>
<body>
<div class="yr_party-info-container">
    <div class="yr_title">縁パーティー</div>
    <div class="yr_party-red-loof"><img src="footer.png" alt="" /></div>
    <div class="yr_go_to_chat_wrap">
        <button id="yr_go_to_chat">
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
                <div id="yr_graph_bar1" class="yr_graph_bar man"></div>
                <div id="yr_graph_bar2" class="yr_graph_bar woman"></div>
            </div>
            <div class="yr_graph_label_wrap">
                <span class="yr_graph_label">男性</span>
                <span class="yr_graph_label">女性111</span>
            </div>
        </div>
    </div>
    <div class="yr_ratio age">
        <span>年齢の分布</span>
        <div class="yr_graph_donut">
            <canvas id="ageDonutChart"></canvas>
        </div>
    </div>
    <button class="yr_apply_cancel">参加 キャンセル</button>
</div>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="/resources/js/party/party_info.js"></script>
</body>
</html>