<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Noto+Serif+JP:wght@200..900&display=swap"
            rel="stylesheet"
    />
    <link rel="stylesheet" href="resources/css/party/party-type.css">
    <script src="resources/js/party/party.js"></script>
</head>
<body>
<div class="yr_party-container">
    <div class="yr_title">縁パーティー</div>
    <div class="yr_party-red-loof"><img src="footer.png" alt="" /></div>
    <div class="yr_content">
        縁パーティーでは、<br />
        カップルマッチングプログラムが <br />
        予定されています。<br />
        プログラムに参加しなくても <br />
        パーティーを楽しめます。<br />
        参加して愛の縁を探したい方は <br />
        　💗を押してください。
    </div>
    <div class="yr_btn_wrapper">
        <div class="yr_btn_left">
            <p>
                愛の縁を <br />
                探したい
            </p>
            <button id="btn_heart" onclick="location.href='party/done'"><img src="icon-heart.png" alt="" /></button>
        </div>

        <div class="yr_btn_right">
            <p>
                パーティーだけ<br />
                参加したい
            </p>
            <button id="btn_star" onclick="location.href='party/done'"><img src="star.png" alt="" /></button>
        </div>
    </div>
</div>
</body>
</html>