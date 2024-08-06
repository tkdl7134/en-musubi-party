
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
    <link rel="stylesheet" href="resources/static/css/party/party_main.css" />
    
</head>
<body>
<div class="yr_party_main_container">
    <div class="yr_title">縁パーティー</div>
    <div class="yr_party-red-loof"><img src="footer.png" alt="" /></div>
    <div class="yr_party_wrapper">
        <div class="yr_party_welcome">
            <p>
                ようこそ <br />
                縁パーティーへ
            </p>
        </div>
        <div class="yr_party_list_container">
            <!-- list -->
            <div class="yr_party_list all">
                <p>list</p>
                <div class="yr_list_all">
                    <div class="yr_list">
                        <div class="yr_list_number">1</div>
                        <div class="yr_list_name">河・ユリ</div>
                    </div>
                    <div class="yr_list">
                        <div class="yr_list_number">2</div>
                        <div class="yr_list_name">キム・ユジョン</div>
                    </div>
                    <div class="yr_list">
                        <div class="yr_list_number">3</div>
                        <div class="yr_list_name">パク・ジョンウン</div>
                    </div>
                    <div class="yr_list">
                        <div class="yr_list_number">4</div>
                        <div class="yr_list_name">イ·テゴン</div>
                    </div>
                    <div class="yr_list">
                        <div class="yr_list_number">5</div>
                        <div class="yr_list_name">ジョン・ジェフン</div>
                    </div>
                    <div class="yr_list">
                        <div class="yr_list_number">6</div>
                        <div class="yr_list_name">ナム・ヒョンウ</div>
                    </div>
                </div>
            </div>

            <!-- random -->
            <div class="yr_party_list random">
                <p>random</p>
                <div class="yr_random">
                    <div class="yr_random_button">start</div>
                    <div class="yr_random_loading">
                        <div class="lds-heart"><div></div></div>
                    </div>
                    <div class="yr_random_group">
                        <p></p>
                        グループに移動してください
                    </div>
                </div>
            </div>

            <!-- type -->
            <div class="yr_party_list type">
                <p>type</p>
                <div class="yr_type">
                    <div class="yr_type_mention">自分のタイプを選んでください</div>
                    <div class="yr_type_group">
                        <div class="yr_type_group1">
                            <div class="yr_type_item">アウトドア</div>
                            <div class="yr_type_item">インドア</div>
                            <div class="yr_type_item">宗教あり</div>
                            <div class="yr_type_item">宗教なし</div>
                            <div class="yr_type_item">スモーカ</div>
                            <div class="yr_type_item">ノンスモーカ</div>
                        </div>
                        <div class="yr_type_group2">
                            <div class="yr_type_item">コーヒー</div>
                            <div class="yr_type_item">お茶</div>
                            <div class="yr_type_item">ビール</div>
                            <div class="yr_type_item">サケ</div>
                            <div class="yr_type_item">美食</div>
                        </div>
                        <div class="yr_type_group3">
                            <div class="yr_type_item">美術館</div>
                            <div class="yr_type_item">映画</div>
                            <div class="yr_type_item">ドライブ</div>
                            <div class="yr_type_item">ペット</div>
                            <div class="yr_type_item">旅行</div>
                            <div class="yr_type_item">写真</div>
                            <div class="yr_type_item">音楽</div>
                            <div class="yr_type_item">ファッション</div>
                            <div class="yr_type_item">ゲーム</div>
                            <div class="yr_type_item">アニメ</div>
                        </div>
                    </div>
                    <button id="yr_type_button">提出</button>
                    <div class="yr_type_group_select">
                        <p>A</p>
                        グループに移動してください
                    </div>
                </div>
            </div>

            <!-- choice -->
            <div class="yr_party_list choice">
                <p>最終選択</p>
                <div class="yr_choice">
                    <div class="yr_choice_mention">
                        最も気に入った方を <br />
                        3名選んでください。 <br />
                        お互いに気持ちが通じ合った方々には、<br />
                        LINE IDを送って<br />縁を結ぶ機会が与えられます。
                    </div>
                    <div class="yr_list_choice">
                        <div class="yr_list_number_choice">1</div>
                        <div class="yr_list_name_choice">河・ユリ</div>
                    </div>
                    <div class="yr_list_choice">
                        <div class="yr_list_number_choice">2</div>
                        <div class="yr_list_name_choice">キム・ユジョン</div>
                    </div>
                    <div class="yr_list_choice">
                        <div class="yr_list_number_choice">3</div>
                        <div class="yr_list_name_choice">パク・ジョンウン</div>
                    </div>
                    <div class="yr_list_choice">
                        <div class="yr_list_number_choice">4</div>
                        <div class="yr_list_name_choice">イ·テゴン</div>
                    </div>
                    <div class="yr_list_choice">
                        <div class="yr_list_number_choice">5</div>
                        <div class="yr_list_name_choice">ジョン・ジェフン</div>
                    </div>
                    <div class="yr_list_choice">
                        <div class="yr_list_number_choice">6</div>
                        <div class="yr_list_name_choice">ナム・ヒョンウ</div>
                    </div>
                    <button id="yr_choice_button">提出</button>
                </div>
            </div>
        </div>
    </div>
    <div class="yr_selected_choices"></div>
</div>
<script src="resources/static/js/party/party_main.js"></script>

</body>
</html>