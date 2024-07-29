
<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html lang="en">
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Document</title>
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+JP:wght@200..900&display=swap"
        rel="stylesheet"
/>
<link rel="stylesheet" href="/resources/css/party/party_chat.css" />
</head>
<body>
<div class="chat_wrapper">
    <div class="display_container">
        <ul class="chat_list">
            <li class="sent">
            <span class="profile">
              <div>
                <img class="image" src="heart-shape(2).png" alt="" />
              </div>
              <span class="user">田中</span>
            </span>
                <span class="message">こんばんは</span>
                <span class="time">午後 ８:10</span>
            </li>
            <li class="received">
            <span class="profile">
              <div>
                <img class="image" src="heart-shape.png" alt="" />
              </div>
              <span class="user">田中</span>
            </span>
                <span class="message">こんばんは</span>
                <span class="time">午後 ８:10</span>
            </li>
        </ul>
    </div>
    <div class="input_container">
        <span>
          <input type="text" class="chat_input" />
          <button class="send_button">送る</button>
        </span>
    </div>
</div>
<script src="/socket.io/socket.io.js"></script>
<script src="resources/js/party/party_chat.js"></script>

</body>
</html>