<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">    <title>Title</title>

    <title>En-Party Main</title>
    <link rel="preconnect" href="https://fonts.googleapis.com"/>
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin/>
    <link
            href="https://fonts.googleapis.com/css2?family=Noto+Serif+JP:wght@200..900&display=swap"
            rel="stylesheet"
    />
    <link rel="stylesheet" href="/css/party/party_main.css"/>

</head>
<body>

<header>
    <div class="je_menu-header">
        <div class="je_logo-icon"><img src="/img/en-musubi-logo.png" alt="" /></div>
        <div>縁結び</div>
        <div class="je_menu-icon"><img src="/img/menu-button.png" alt="" /></div>
    </div>

</header>

<div class="yr_party_main_container">

    <div class="yr_title">縁パーティー</div>

    <div class="yr_party_wrapper">
        <div class="yr_party_welcome">
            <p>
                以下のステップに従って、順番に進めてください
            </p>
        </div>

            <!-- list -->
            <div class="yr_party_list all">
                <div class="yr_list_title"><span>✿</span> Step 1 <span>✿</span></div>
                <div class="yr_list_title2">パーティー参加者リストを確認してください</div>
                <div class="yr_list_all">
                    <c:forEach items="${partyMembers}" var="p" varStatus="status">
                        <div class="yr_list">
                            <div class="yr_list_left">
                                <c:choose>
                                    <c:when test="${p.g_guest_type == '新郎ゲスト'}">
                                        <img src="/img/groom.png">
                                    </c:when>
                                    <c:otherwise>
                                        <img src="/img/bride.png">
                                    </c:otherwise>
                                </c:choose>
                            </div>

                            <div class="yr_list_name" id="yr_list_name">${p.m_fam_kanji} &nbsp; ${p.m_name_kanji}</div>
                            <div class="yr_list_right">
                                <c:choose>
                                    <c:when test="${p.m_gender == '男'}">
                                        <img src="/img/blue_heart.png">
                                    </c:when>
                                    <c:otherwise>
                                        <img src="/img/pink_heart.png">
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>

            <!-- random -->
            <div class="yr_party_list random">
                <div class="yr_list_title"><span>✿</span> Step 2 <span>✿</span></div>
                <div class="yr_list_title2">最初のラウンドでランダムに割り当てます</div>
                <div class="yr_random">
<%--                    <div class="lds-heart">--%>
<%--                        <div></div>--%>
<%--                    </div>--%>
                    <div class="yr_random_button">start</div>
                    <div class="yr_random_loading">
                        <div class="lds-heart">
                            <div></div>
                        </div>
                    </div>
                    <div class="yr_random_group">
                        <p></p>
                        グループに移動してください
                    </div>
                </div>
            </div>

            <!-- type -->
            <div class="yr_party_list type">
                <div class="yr_list_title"><span>✿</span> Step 3 <span>✿</span></div>
                <div class="yr_list_title2">自分のタイプを選択してください</div>
                <div class="yr_type">
                    <div class="yr_type_group">
                        <div class="yr_type_group1">
                            <div class="yr_type_mention">最大で2つまで選択できます</div>
                            <input class="yr_type_item" id="outdoor" value="アウトドア" type="button">
                            <input class="yr_type_item" id="indoor" value="インドア" type="button">
                            <input class="yr_type_item" id="religion_yes" value="宗教あり" type="button">
                            <input class="yr_type_item" id="religion_no" value="宗教なし" type="button">
                            <%--                            <input class="yr_type_item" id="smoker" value="スモーカ" type="button">--%>
                            <%--                            <input class="yr_type_item" id="non-smoker" value="ノンスモーカ" type="button">--%>
                        </div>
                        <div class="yr_type_group2">
                            <div class="yr_type_mention">最大で2つまで選択できます</div>
                            <input class="yr_type_item" id="coffee" value="コーヒー" type="button">
                            <input class="yr_type_item" id="tea" value="お茶" type="button">
                            <input class="yr_type_item" id="beer" value="ビール" type="button">
                            <input class="yr_type_item" id="sake" value="サケ" type="button">
                        </div>
                        <div class="yr_type_group3">
                            <div class="yr_type_mention">最大で３つまで選択できます</div>
                            <input class="yr_type_item" id="movie" value="映画" type="button">
                            <input class="yr_type_item" id="museum" value="美術" type="button">
                            <%--                            <input class="yr_type_item" id="photo" value="写真" type="button">--%>
                            <input class="yr_type_item" id="music" value="音楽" type="button">
                            <%--                            <input class="yr_type_item" id="fashion" value="ファッション" type="button">--%>
                            <input class="yr_type_item" id="drive" value="ドライブ" type="button">
                            <input class="yr_type_item" id="pet" value="ペット" type="button">
                            <input class="yr_type_item" id="travel" value="旅行" type="button">
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
                <div class="yr_list_title"><span>✿</span> Step 4 <span>✿</span></div>
                <div class="yr_list_title2">最終選択の時間です</div>

                <div class="yr_choice">
                    <div class="yr_choice_mention" style="color: #696969">
                        最も気に入った方を3名お選びください<br/> <br/>
                        お互いに気持ちが通じ合った方々には、<br/>  連絡先が送られ、</div>

                    <div class="yr_choice_mention" style="color: #474747"> <span>✿</span> 縁がつながる機会が提供されます <span>✿</span></div>
                    <c:forEach items="${partyMembers}" var="p">
                        <div class="yr_list_choice">
                            <input value="${p.m_id}" type="hidden">
                            <div class="yr_list_left">
                                <c:choose>
                                    <c:when test="${p.g_guest_type == '新郎ゲスト'}">
                                        <img src="/img/groom.png">
                                    </c:when>
                                    <c:otherwise>
                                        <img src="/img/bride.png">
                                    </c:otherwise>
                                </c:choose>
                            </div>
                            <div class="yr_list_name_choice">${p.m_fam_kanji} &nbsp; ${p.m_name_kanji}</div>
                            <div class="yr_list_right">
                                <c:choose>
                                <c:when test="${p.m_gender == '男'}">
                                    <img src="/img/blue_heart.png">
                                </c:when>
                                <c:otherwise>
                                    <img src="/img/pink_heart.png">
                                </c:otherwise>
                            </c:choose>
                            </div>
                        </div>
                    </c:forEach>

                    <button type="submit" id="yr_choice_button">提出</button>

                </div>


            </div>
        <img class="yr_bottom_img" src="/img/Bird.png">
    </div>


    <c:forEach items="${partyMyInfo}" var="my">
        <input id="yr_my_name" value="${my.m_fam_kanji}  ${my.m_name_kanji}" type="hidden">
        <input id="yr_my_id" value="${my.m_id}" type="hidden">
    </c:forEach>
    <input id="userId" name="userId" value="test1" type="hidden">


</div>


<script src="/js/party/party_main.js"></script>

</body>
</html>