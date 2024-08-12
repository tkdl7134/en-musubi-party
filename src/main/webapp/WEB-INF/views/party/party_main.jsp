
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
    <link rel="stylesheet" href="/resources/css/party/party_main.css" />

</head>
<body>
<div class="yr_party_main_container">
    <div class="yr_title">縁パーティー</div>
<%--    <div class="yr_party-red-loof"><img src="footer.png" alt="" /></div>--%>
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
                    <c:forEach items="${partyMembers}" var="p" varStatus="status">
                        <div class="yr_list">
                            <div class="yr_list_number">${status.count}</div>
                            <div class="yr_list_name">${p.m_fam_kanji} ${p.m_name_kanji}</div>
                        </div>
                    </c:forEach>
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
                            <input class="yr_type_item" id="outdoor" value="アウトドア" type="button">
                            <input class="yr_type_item" id="indoor" value="インドア" type="button">
                            <input class="yr_type_item" id="religion_yes" value="宗教あり" type="button">
                            <input class="yr_type_item" id="religion_no" value="宗教なし" type="button">
<%--                            <input class="yr_type_item" id="smoker" value="スモーカ" type="button">--%>
<%--                            <input class="yr_type_item" id="non-smoker" value="ノンスモーカ" type="button">--%>
                        </div>
                        <div class="yr_type_group2">
                            <input class="yr_type_item" id="coffee" value="コーヒー" type="button">
                            <input class="yr_type_item" id="tea" value="お茶" type="button">
                            <input class="yr_type_item" id="beer" value="ビール" type="button">
                            <input class="yr_type_item" id="sake" value="サケ" type="button">
                            <input class="yr_type_item" id="gourmet" value="美食" type="button">
                        </div>
                        <div class="yr_type_group3">
                            <input class="yr_type_item" id="museum" value="美術館" type="button">
                            <input class="yr_type_item" id="movie" value="映画" type="button">
                            <input class="yr_type_item" id="drive" value="ドライブ" type="button">
                            <input class="yr_type_item" id="pet" value="ペット" type="button">
                            <input class="yr_type_item" id="travel" value="旅行" type="button">
                            <input class="yr_type_item" id="photo" value="写真" type="button">
                            <input class="yr_type_item" id="music" value="音楽" type="button">
                            <input class="yr_type_item" id="fashion" value="ファッション" type="button">
                            <input class="yr_type_item" id="game" value="ゲーム" type="button">
                            <input class="yr_type_item" id="anime" value="アニメ" type="button">
                        </div>
                    </div>
                    <button id="yr_type_button" type="submit">提出</button>
                    <div class="yr_type_group_select">
                        <p></p>
                        グループに移動してください
                    </div>
                </div>
            </div>

            <!-- final choice -->
            <div class="yr_party_list choice">
                <p>最終選択</p>
                <div class="yr_choice">
                    <div class="yr_choice_mention">
                        最も気に入った方を <br />
                        3名選んでください。 <br />
                        お互いに気持ちが通じ合った方々には、<br />
                        LINE IDを送って<br />縁を結ぶ機会が与えられます。
                    </div>
<%--                    <form action="/party/main" method="post">--%>
<%--                        <input type="hidden" name="_method" value="put">--%>
                    <c:forEach items="${partyMembers}" var="p" varStatus="status">
                        <div class="yr_list_choice">
                            <input type="hidden" value="${p.m_fam_kanji} ${p.m_name_kanji}">
                            <div class="yr_list_number_choice">${status.count}</div>
                            <div class="yr_list_name_choice">${p.m_fam_kanji} ${p.m_name_kanji}</div>
                        </div>
                    </c:forEach>

                    <button type="submit" id="yr_choice_button">提出</button>
<%--                    </form>--%>
                </div>
            </div>
        </div>
    </div>
    <div class="yr_selected_choices"></div>
</div>
<script src="/resources/js/party/party_main.js"></script>

</body>
</html>