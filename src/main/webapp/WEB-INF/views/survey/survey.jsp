<%@ page contentType="text/html; charset=utf-8" %>
<!DOCTYPE html>
<html style="zoom : 100% !important;" lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/product/product_preview.css"/>
    <link rel="stylesheet" href="/resources/css/survey/survey.css">
    <link rel="stylesheet" href="/resources/css/survey/surveyCheckbox.css">
    <link rel="stylesheet" href="/resources/css/survey/allergyModal.css" />
    <script
            src="https://code.jquery.com/jquery-3.7.1.js"
            integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
            crossorigin="anonymous"
    ></script>
    <script src="resources/js/survey/survey.js"></script>
</head>
<body>
<div class="tk_menu-bar">
    <div id="tk_logo">
        <img src="/resources/img/en-musubi-logo.png" alt="" />
    </div>
</div>

<div id="je_product-preview-container">
    <div class="je_page-content">
        <div class="je_preview-container">
            <div class="tk_iphone-container">
                <div class="tk_iphone">
                    <img src="/resources/img/iphone-box.png" alt="" />
                    <div class="tk_survey-container">
                        <div class="tk_page-content">
                            <div class="tk_form-container">
                                <div class="tk_survey-title">
                                    <div>ゲスト様入力項目</div>
                                    <div>までご返信お願いします</div>
                                    <div id="tk_survey-line">
                                        <img src="/resources/img/head.png" />
                                    </div>
                                </div>
                                <div class="survey-form">
                                    <form action="createSurvey" method="post">
                                        <div class="tk_survey-guestType">
                                            <div class="tk_survey-titleName">ゲスト様</div>
                                            <div>
                                                <input
                                                        type="checkbox"
                                                        id="groomGuest"
                                                        name="g_guest_type"
                                                        value="Groom"
                                                />
                                                <label class="cb1" for="groomGuest"></label>
                                                <label for="groomGuest">新郎ゲスト</label>
                                                <input
                                                        type="checkbox"
                                                        id="brideGuest"
                                                        name="g_guest_type"
                                                        value="Bride"
                                                />
                                                <label class="cb1" for="brideGuest"></label>
                                                <label for="brideGuest">新婦ゲスト</label>
                                            </div>
                                        </div>
                                        <div class="tk_division-line"></div>
                                        <div class="tk_survey-relationship">
                                            <div class="tk_survey-titleName">ご関係</div>
                                            <div>
                                                <select name="g_relation">
                                                    <option value="family">家族</option>
                                                    <option value="friend">親友</option>
                                                    <option value="Colleagues">職場同僚</option>
                                                    <option value="Others">その他</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="tk_division-line"></div>
                                        <div class="tk_survey-relationship-detail">
                                            <div class="tk_survey-titleName">間柄</div>
                                            <div>
                                                <select name="relationship">
                                                    <option value="family">家族</option>
                                                    <option value="friend">親友</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="tk_division-line"></div>
                                        <div class="tk_justName">
                                            <div class="tk_survey-titleName">お名前</div>
                                            <input type="text" name="m_name_first" />
                                            <input type="text" name="m_name_second" />
                                        </div>
                                        <div class="tk_division-line"></div>
                                        <div class="tk_kataName">
                                            <div class="tk_survey-titleName">カタカナ</div>
                                            <input type="text" name="m_name_kana_first" />
                                            <input type="text" name="m_name_kana_second" />
                                        </div>
                                        <div class="tk_division-line"></div>
                                        <div class="tk_romeName">
                                            <div class="tk_survey-titleName">ローマ字</div>
                                            <input type="text" name="m_name_rome_first" />
                                            <input type="text" name="m_name_rome_second" />
                                        </div>
                                        <div class="tk_division-line"></div>
                                        <div class="tk_survey-gender">
                                            <div class="tk_survey-titleName">性別</div>
                                            <div>
                                                <input
                                                        type="checkbox"
                                                        id="maleGender"
                                                        name="m_gender"
                                                        value="Male"
                                                />
                                                <label class="cb1" for="maleGender"></label>
                                                <label for="maleGender">男性</label>
                                                <input
                                                        type="checkbox"
                                                        id="femaleGender"
                                                        name="m_gender"
                                                        value="Female"
                                                />
                                                <label class="cb1" for="femaleGender"></label>
                                                <label for="femaleGender">女性</label>
                                                <input
                                                        type="checkbox"
                                                        id="othersGender"
                                                        name="m_gender"
                                                        value="Others"
                                                />
                                                <label class="cb1" for="othersGender"></label>
                                                <label for="othersGender">その他</label>
                                            </div>
                                        </div>
                                        <div class="tk_division-line"></div>
                                        <div class="tk_address">
                                            <div class="tk_survey-titleName">住所</div>
                                            <div class="tk_survey-postcode">
                                                郵便番号
                                                <input
                                                        class="search-postcode"
                                                        type="text"
                                                        name="a_postcode"
                                                />
                                                <button type="button" class="search-post-btn">
                                                    検索
                                                </button>
                                            </div>
                                            <div class="tk_survey-address">
                                                <input type="text" name="a_address" />
                                                <input type="text" name="other-address" />
                                            </div>
                                        </div>
                                        <div class="tk_division-line"></div>
                                        <div class="tk_survey-email">
                                            <div class="tk_survey-titleName">メールアドレス</div>
                                            <div>
                                                <input type="text" />
                                            </div>
                                        </div>
                                        <div class="tk_division-line"></div>
                                        <div class="tk_survey-phone">
                                            <div class="tk_survey-titleName">電話番号</div>
                                            <div>
                                                <input type="text" />
                                            </div>
                                        </div>
                                        <div class="tk_division-line"></div>
                                        <div class="tk_survey-allergy">
                                            <div class="tk_survey-titleName">アレルギー</div>
                                            <div class="tk_survey-allergy-checkbox">
                                                <input
                                                        type="checkbox"
                                                        id="allergyHave"
                                                        name="allergy_or"
                                                        value="Yes"
                                                />
                                                <label class="cb2" for="allergyHave"></label>
                                                <span>アレルギー情報を入力する</span>
                                            </div>
                                            <div
                                                    class="tk_survey-allergy-detail"
                                                    id="allergyDetailContainer"
                                            >
                                                <!-- 텍스트 입력 필드는 체크박스 체크했을 경우에만 나오도록 설정 -->
                                            </div>
                                        </div>
                                        <div class="tk_division-line"></div>
                                        <button type="submit">Submit</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div id="allergyModalContainer"></div>
    </div>
</div>

<!-- modal -->

<div id="allergyModal" class="modal">
    <button class="modal-close" id="modalCloseButton">&times;</button>
    <div class="modal_body">
        <header>
            <div>アレルギー情報設定</div>
        </header>
        <div class="tk_division-line-modal"></div>
        <div class="tk_allergy-mains">
            <div class="tk_allergy-title">
                <div>アレルギー情報の選択</div>
                <div>該当するアレルギーを選択してvsください</div>
            </div>
            <div class="tk_allergy-meat">
                <div class="tk_allergy-type-first">肉</div>
                <div class="tk_allergy-contents">
                    <label class="cb3">
                        <input type="checkbox" class="allergyOption" value="牛肉" />
                        <span class="cb3-label">牛肉</span>
                    </label>
                    <label class="cb3">
                        <input type="checkbox" class="allergyOption" value="豚肉" />
                        <span class="cb3-label">豚肉</span>
                    </label>
                    <label class="cb3">
                        <input type="checkbox" class="allergyOption" value="鶏肉" />
                        <span class="cb3-label">鶏肉</span>
                    </label>
                </div>
            </div>

            <div class="tk_allergy-dairyProducts">
                <div class="tk_allergy-type">乳製品</div>
                <div class="tk_allergy-contents">
                    <label class="cb3">
                        <input type="checkbox" class="allergyOption" value="卵" />卵
                    </label>
                    <label class="cb3">
                        <input type="checkbox" class="allergyOption" value="乳" />乳
                    </label>
                </div>
            </div>
            <div class="tk_allergy-type">穀物</div>
            <div class="tk_allergy-contents">
                <label class="cb3">
                    <input type="checkbox" class="allergyOption" value="小麦" />小麦
                </label>
                <label class="cb3">
                    <input type="checkbox" class="allergyOption" value="そば" />そば
                </label>
                <label class="cb3">
                    <input
                            type="checkbox"
                            class="allergyOption"
                            value="大豆"
                    />大豆
                </label>
                <label class="cb3">
                    <input
                            type="checkbox"
                            class="allergyOption"
                            value="落花生(ピーナッツ)"
                    />落花生(ピーナッツ)
                </label>
            </div>
            <div class="tk_allergy-contents">
                <label class="cb3">
                    <input
                            type="checkbox"
                            class="allergyOption"
                            value="カシューナッツ"
                    />カシューナッツ
                </label>
                <label class="cb3">
                    <input
                            type="checkbox"
                            class="allergyOption"
                            value="くるみ"
                    />くるみ
                </label>
                <label class="cb3">
                    <input
                            type="checkbox"
                            class="allergyOption"
                            value="ごま"
                    />ごま
                </label>
                <label class="cb3">
                    <input
                            type="checkbox"
                            class="allergyOption"
                            value="アーモンド"
                    />アーモンド
                </label>
            </div>
            <div class="tk_allergy-type">果物</div>
            <div class="tk_allergy-contents">
                <label class="cb3">
                    <input type="checkbox" class="allergyOption" value="桃" />桃
                </label>
                <label class="cb3">
                    <input type="checkbox" class="allergyOption" value="バナナ" />バナナ
                </label>
                <label class="cb3">
                    <input
                            type="checkbox"
                            class="allergyOption"
                            value="オレンジ"
                    />オレンジ
                </label>
                <label class="cb3">
                    <input
                            type="checkbox"
                            class="allergyOption"
                            value="キウイフルーツ"
                    />キウイフルーツ
                </label>
            </div>
            <div class="tk_allergy-type">魚介類</div>
            <div class="tk_allergy-contents">
                <label class="cb3">
                    <input type="checkbox" class="allergyOption" value="えび" />えび
                </label>
                <label class="cb3">
                    <input type="checkbox" class="allergyOption" value="かに" />かに
                </label>
                <label class="cb3">
                    <input
                            type="checkbox"
                            class="allergyOption"
                            value="あわび"
                    />あわび
                </label>
                <label class="cb3">
                    <input
                            type="checkbox"
                            class="allergyOption"
                            value="いか"
                    />いか
                </label>
                <label class="cb3">
                    <input type="checkbox" class="allergyOption" value="鮭" />鮭
                </label>
                <label class="cb3">
                    <input
                            type="checkbox"
                            class="allergyOption"
                            value="Chicken"
                    />いくら
                </label>
            </div>
            <div class="tk_allergy-type">その他</div>
            <div class="tk_allergy-contents">
                <label class="cb3">
                    <input
                            type="checkbox"
                            class="allergyOption"
                            value="まつたけ"
                    />まつたけ
                </label>
                <label class="cb3">
                    <input
                            type="checkbox"
                            class="allergyOption"
                            value="やまいも"
                    />やまいも
                </label>
                <label class="cb3">
                    <input
                            type="checkbox"
                            class="allergyOption"
                            value="ゼラチン"
                    />ゼラチン
                </label>
            </div>

            <div class="tk_others-allergy">
                <div class="tk_insert-others">
                    該当するアレルギー情報が無い場合は、下記入力欄にアレルギー情報をご入力ください
                </div>
                <div class="allergySearch">
                    <div id="etc-allergy"></div>
                    <input
                            type="text"
                            id="otherAllergy"
                            placeholder="その他のアレルギー入力"
                            autocomplete="off"
                    />
                    <button id="etc-btn">追加</button>
                </div>
            </div>
            <div class="tk_allergy-search-btn">
                <button class="tk_modal-button" id="addAllergies">追加する</button>
                <button class="tk_modal-button2" id="closeModal">閉じる</button>
            </div>

        </div>
    </div>
</div>
</body>
</html>
