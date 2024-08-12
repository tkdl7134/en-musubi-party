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
                                    <form action="survey/create" method="post" enctype="multipart/form-data">
                                        <input type="hidden" name="m_id" value="${2222}">
                                        <input type="hidden" name="e_no" value="${3333}">
                                        <input type="hidden" name="p_pk" value="${4444}">
                                        <div class="tk_survey-guestType">
                                            <div class="tk_survey-titleName">ゲスト様</div>
                                            <div>
                                                <input
                                                        type="checkbox"
                                                        id="groomGuest"
                                                        name="g_guest_type"
                                                        value="新郎ゲスト"
                                                />
                                                <label class="cb1" for="groomGuest"></label>
                                                <label for="groomGuest">新郎ゲスト</label>
                                                <input
                                                        type="checkbox"
                                                        id="brideGuest"
                                                        name="g_guest_type"
                                                        value="新婦ゲスト"
                                                />
                                                <label class="cb1" for="brideGuest"></label>
                                                <label for="brideGuest">新婦ゲスト</label>
                                            </div>
                                        </div>
                                        <div class="tk_division-line"></div>
                                        <div class="tk_survey-relationship">
                                            <div class="tk_survey-titleName">ご関係</div>
                                            <div>
                                                <select name="g_relation_detail">
                                                    <option value="家族">家族</option>
                                                    <option value="親友">親友</option>
                                                    <option value="職場同僚">職場同僚</option>
                                                    <option value="その他">その他</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="tk_division-line"></div>
                                        <div class="tk_survey-relationship-detail">
                                            <div class="tk_survey-titleName">間柄</div>
                                            <div>
                                                <select name="g_relationship">
                                                    <option value="family">家族</option>
                                                    <option value="friend">親友</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="tk_division-line"></div>
                                        <div class="tk_justName">
                                            <div class="tk_survey-titleName">お名前</div>
                                            <input type="text" name="m_fam_kanji" />
                                            <input type="text" name="m_name_kanji" />
                                        </div>
                                        <div class="tk_division-line"></div>
                                        <div class="tk_kataName">
                                            <div class="tk_survey-titleName">カタカナ</div>
                                            <input type="text" name="m_fam_kana" />
                                            <input type="text" name="m_name_kana" />
                                        </div>
                                        <div class="tk_division-line"></div>
                                        <div class="tk_romeName">
                                            <div class="tk_survey-titleName">ローマ字</div>
                                            <input type="text" name="m_fam_eng" />
                                            <input type="text" name="m_name_eng" />
                                        </div>
                                        <div class="tk_division-line"></div>
                                        <div class="tk_survey-gender">
                                            <div class="tk_survey-titleName">性別</div>
                                            <div>
                                                <input
                                                        type="checkbox"
                                                        id="maleGender"
                                                        name="m_gender"
                                                        value="男性"
                                                />
                                                <label class="cb1" for="maleGender"></label>
                                                <label for="maleGender">男性</label>
                                                <input
                                                        type="checkbox"
                                                        id="femaleGender"
                                                        name="m_gender"
                                                        value="女性"
                                                />
                                                <label class="cb1" for="femaleGender"></label>
                                                <label for="femaleGender">女性</label>
                                                <input
                                                        type="checkbox"
                                                        id="othersGender"
                                                        name="m_gender"
                                                        value="その他"
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
                                                        name="m_zipcode"
                                                />
                                                <button type="button" class="search-post-btn">
                                                    検索
                                                </button>
                                            </div>
                                            <div class="tk_survey-address">
                                                <input type="text" name="m_address" />
                                                <input type="text" name="m_other_address" />
                                            </div>
                                        </div>
                                        <div class="tk_division-line"></div>
                                        <div class="tk_survey-email">
                                            <div class="tk_survey-titleName">メールアドレス</div>
                                            <div>
                                                <input type="text" name="m_email" />
                                            </div>
                                        </div>
                                        <div class="tk_division-line"></div>
                                        <div class="tk_survey-phone">
                                            <div class="tk_survey-titleName">電話番号</div>
                                            <div>
                                                <input type="text" name="m_phone" />
                                            </div>
                                        </div>
                                        <div class="tk_division-line"></div>
                                        <div class="tk_survey-allergy">
                                            <div class="tk_survey-titleName">アレルギー</div>
                                            <div class="tk_survey-allergy-checkbox">
                                                <input
                                                        type="checkbox"
                                                        id="allergyHave"
                                                        name="g_allergy_or"
                                                        value="Yes"
                                                        class="allergyHave"
                                                        data-conid="allergyDetailContainer"
                                                        data-type="guest"
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
                                        <div class="tk_survey-party">
                                            <div class="tk_survey-titleName">お連れ様</div>
                                            <div class="tk_survey-party-checkbox">
                                                <input type="checkbox" id="addPartyMember" name="" />
                                                <label class="cb2" for="addPartyMember"></label>
                                                <span>お連れ様を追加する</span>
                                            </div>
                                            <div id="partyContainer"></div>
                                            <button type="button" id="addPartyButton" style="display: none;">追加する</button>
                                        </div>

                                        <div class="tk_survey-message">
                                            <div class="tk_survey-messageImg">
                                                <div class="tk_messageImg" id="messageImg">

                                                </div>

                                                <div class="tk_imgButton-container">
                                                    <div>
                                                        <button id="defaultImgButton" type="button">イメージ選択</button>
                                                    </div>
                                                    <div>
                                                        <button id="imgUploadButton" type="button">写真アップロード</button>
                                                        <input type="file" name="me_img2" id="imgInput" style="display: none;" accept="image/*">
                                                    </div>
                                                    <div>
                                                        <button id="imgDeleteButton" type="button">写真削除</button>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="tk_survey-messageText">
                                                <textarea></textarea>
                                            </div>
                                        </div>
                                        <div class="tk_division-line"></div>
                                        <div class="tk_survey-entry-container">
                                            <div class="tk_survey-entryTitle">
                                                <div>挙式・披露宴</div>
                                                <div class="tk_survey-line2">
                                                    <img src="/resources/img/head.png" />
                                                </div>
                                            </div>
                                            <div class="survey-selection" id="wedding-selection">
                                                <div class="survey-selection-option" data-value="ご出席">
                                                    <img src="/resources/img/select-Img.png" class="hidden" alt="ご出席">
                                                    ご出席
                                                </div>
                                                <div class="survey-selection-option" data-value="ご欠席">
                                                    <img src="/resources/img/select-Img.png" class="hidden" alt="ご欠席">
                                                    ご欠席
                                                </div>
                                                <div class="survey-selection-option" data-value="保留">
                                                    <img src="/resources/img/select-Img.png" class="hidden" alt="保留">
                                                    保留
                                                </div>
                                            </div>
                                        </div>
                                        <input type="hidden" name="g_attend_wedding" id="g_attend_wedding">
                                        <div class="tk_division-line"></div>
                                        <div class="tk_survey-entry-container">
                                            <div class="tk_survey-entryTitle">
                                                <div>アフターパーティー</div>
                                                <div class="tk_survey-line2">
                                                    <img src="/resources/img/head.png" />
                                                </div>
                                            </div>
                                            <div class="survey-selection" id="afterparty-selection">
                                                <div class="survey-selection-option" data-value="ご出席">
                                                    <img src="/resources/img/select-Img.png" class="hidden" alt="ご出席">
                                                    ご出席
                                                </div>
                                                <div class="survey-selection-option" data-value="ご欠席">
                                                    <img src="/resources/img/select-Img.png" class="hidden" alt="ご欠席">
                                                    ご欠席
                                                </div>
                                                <div class="survey-selection-option" data-value="保留">
                                                    <img src="/resources/img/select-Img.png" class="hidden" alt="保留">
                                                    保留
                                                </div>
                                            </div>
                                            <input type="hidden" name="g_attend_afterparty" id="g_attend_afterparty">
                                        </div>

                                        <div class="tk_division-line"></div>

                                        <div class="survey-last-submit-container">
                                            <div>
                                                <button class="survey-submit-button" type="submit">送信</button>
                                            </div>
                                            <div class="survey-last-img">
                                                <img src="/resources/img/enmusubi-logo.png" alt="" >
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
                <div>該当するアレルギーを選択してください</div>
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
                <div class="tk_modal-reset-button">
                    <button class="tk_modal-button3" id="reset">RESET</button>
                </div>
            </div>
            <div class="tk_allergy-search-btn">
                <button class="tk_modal-button" id="addAllergies">追加する</button>
                <button class="tk_modal-button2" id="closeModal">閉じる</button>
            </div>

        </div>
    </div>
</div>

<%--디폴트 이미지업로드 모달--%>
<dialog id="defaultImgModal">
    <button class="close-button" id="closeImgModalButton">&times;</button>
    <div class="ImgModalTitle">画像一覧</div>
    <div class="ImgModalList">サンプル画像</div>
    <ul class="sample-imgList">
        <li class="sample-imgList-item">
            <img src="/resources/img/celebratePic1.png" alt="">
        </li>
        <li class="sample-imgList-item">
            <img src="/resources/img/celebratePic2.png" alt="">
        </li>
        <li class="sample-imgList-item">
            <img src="/resources/img/celebratePic3.png" alt="">
        </li>
        <li class="sample-imgList-item">
            <img src="/resources/img/celebratePic4.png" alt="">
        </li>
        <li class="sample-imgList-item">
            <img src="/resources/img/celebratePic5.png" alt="">
        </li>
    </ul>
    <div class="ImgModalCelebrate">ご希望のイメージを選んでお二人をお祝いします！</div>
    <div class="confirmImgButton-container">
        <button id="confirmImgButton">選択</button>
    </div>
</dialog>

</body>
</html>
