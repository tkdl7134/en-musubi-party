<%@ page contentType="text/html; charset=utf-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/product/product_preview.css"/>
    <link rel="stylesheet" href="/resources/css/survey/survey.css">
    <script src="/resources/js/survey.js"></script>
</head>
<body>
<div class="tk_menu-bar">
    <div id="tk_logo">
        <img src="/resources/img/en-musubi-logo.png" alt=""/>
    </div>
</div>

<div id="je_product-preview-container">
    <div class="je_page-title">
        <div class="je_page-title-txt"></div>
        <div class="je_page-title-line">
            <img src="/resources/img/pagプレビューe-title-line.png" alt=""/>
        </div>
    </div>
    <div class="je_page-content">
        <div class="je_preview-container">
            <div class="je_preview">
                <div class="je_preview-phone">
                    <img src="/resources/img/iphone-box.png" alt=""/>
                        <div class="tk_survey-container">
                            <div class="tk_page-content">
                                <div class="tk_iphone-container">
                                    <div class="tk_survey-title">
                                        <div>ゲスト様入力項目</div>
                                        <div>までご返信お願いします</div>
                                        <div id="tk_survey-line">
                                            <img src="/resources/img/head.png">
                                        </div>
                                    </div>
                                    <div class="survey-form" style="    display: flex;
    justify-content: center;">
                                        <form action="createSurvey" method="post">
                                            <div class="tk_survey-guestType">
                                                <div>ゲスト様</div>
                                                <div>
                                                    <input type="checkbox" name="g_guest_type">
                                                    <label>新郎ゲスト</label>
                                                    <label>新婦ゲスト</label>
                                                </div>
                                            </div>
                                            <div class="tk_survey-body">
                                            </div>

                                            <div class="tk_division-line"></div>
                                            <div class="tk_survey-relationship">
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
                                            <div class="tk_division-line"></div>
                                            <div class="tk_survey-relationship-detail">
                                                <div>間柄</div>
                                                <div>
                                                    <select name="">
                                                        <option value="family">家族</option>
                                                        <option value="friend">親友</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="tk_division-line"></div>
                                            <div class="tk_justName">
                                                <div>お名前</div>
                                                <input type="text" name="m_name_first">
                                                <input type="text" name="m_name_second">
                                            </div>
                                            <div class="tk_division-line"></div>
                                            <div class="tk_kataName">
                                                <div>カタカナ</div>
                                                <input type="text" name="m_name_kana_first">
                                                <input type="text" name="m_name_kana_second">
                                            </div>
                                            <div class="tk_division-line"></div>
                                            <div>ローマ字</div>
                                            <div>
                                                <input type="text" name="m_name_rome_first">
                                                <input type="text" name="m_name_rome_second">
                                            </div>
                                            <div class="tk_division-line"></div>
                                            <div class="tk_survey-gender">
                                                <div>性別</div>
                                                <input type="checkbox" name="g_guest_type">
                                                <label>男性</label>
                                                <label>女性</label>
                                                <label>その他</label>
                                            </div>
                                            <div class="tk_division-line"></div>
                                            <div>
                                                <input type="text"/>
                                                <button class="search-post-btn">検索</button>
                                                <input type="text"/>
                                                <input type="text"/>
                                            </div>
                                            <div class="tk_division-line"></div>
                                            <div class="tk_survey-email">
                                                <div>メールアドレス</div>
                                                <div>
                                                    <input type="text"/>
                                                </div>
                                            </div>
                                            <div class="tk_division-line"></div>
                                            <div class="tk_survey-phone">
                                                <div>電話番号</div>
                                                <div>
                                                    <input type="text"/>
                                                </div>
                                            </div>
                                        </form>
                                    </div>

                                </div>
                            </div>
                        </div>
                </div>
            </div>
        </div>
        <div class="je_product-make-button">制作</div>
    </div>
</div>
<hr>
<hr>
<hr>
test


</body>
</html>