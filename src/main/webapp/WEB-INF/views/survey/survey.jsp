
<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/survey/survey.css">
    <script src="/resources/js/survey.js"></script>
</head>
<body>
<header>
    <div>ゲスト様入力項目</div>
    <div>までご返信お願いします</div>
    <div>
        <img src="/resources/img/head.png">
    </div>
</header>
    <div>
        <form action="createSurvey" method="post">
            <div class="tk-survey-guestType">
                <div>ゲスト様</div>
                <div>
                <input type="checkbox" name="g_guest_type">
                    <label>新郎ゲスト</label>
                    <label>新婦ゲスト</label>
                </div>
            </div>
            <div class="tk-division-line"></div>
            <div class="tk-survey-relationship">
                <div>ご関係</div>
                <div>
                    <select name="">
                        <option value="family">家族</option>
                        <option value="friend">親友</option>
                        <option value="Colleagues">職場同僚</option>
                        <option value="Others">その他</option>
                    </select>
                </div>
            </div>
            <div class="tk-division-line"></div>
            <div>
                <div>間柄</div>
                <div>
                    <select name="">
                        <option value="family">家族</option>
                        <option value="friend">親友</option>
                    </select>
                </div>
            </div>
            <div class="tk-division-line"></div>
            <div class="justName">
                <div>お名前</div>
                <input type="text" name="m_name_first">
                <input type="text" name="m_name_second">
            </div>
            <div class="tk-division-line"></div>
            <div class="kataName">
                <div>カタカナ</div>
                <input type="text" name="m_name_kana_first">
                <input type="text" name="m_name_kana_second">
            </div>
            <div class="tk-division-line"></div>
            <div class="engName">
                <div>ローマ字</div>
                <input type="text" name="m_name_rome_first">
                <input type="text" name="m_name_rome_second">
            </div>
            <div class="tk-division-line"></div>
            <div class="tk-survey-gender">
                <div>性別</div>
                <input type="checkbox" name="g_guest_type">
                <label>男性</label>
                <label>女性</label>
                <label>その他</label>
            </div>
            <div class="tk-division-line"></div>
            <div>
                <input type="text" />
                <button class="search-post-btn">検索</button>
                <input type="text" />
                <input type="text" />
            </div>
            <div class="tk-division-line"></div>
            <div class="tk-survey-email">
                <div>メールアドレス</div>
                <div>
                <input type="text" />
                </div>
            </div>
            <div class="tk-division-line"></div>
            <div class="tk-survey-phone">
                <div>電話番号</div>
                <div>
                    <input type="text" />
                </div>
            </div>
        </form>

    </div>
</body>
</html>