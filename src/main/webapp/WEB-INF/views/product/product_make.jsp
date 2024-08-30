<%@ page contentType="text/html; charset=utf-8" %>
<%@ include file="../menubar.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <link rel="icon" type="image/png" href="/img/favicon.png">
    <title>✿ ~ 縁結び ~ ✿</title>
    <!-- Noto Serif Japanese 폰트 적용 -->
    <link rel="preconnect" href="https://fonts.googleapis.com"/>
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin/>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Serif+JP:wght@200..900&display=swap" rel="stylesheet"/>
    <!-- CSS -->
    <link rel="stylesheet" href="/css/product/product_make.css"/>
    <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css"/>
    <link rel="stylesheet" href="/css/product/picker.css"/>
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.13.3/themes/base/jquery-ui.css"/>
    <!-- JavaScript -->
    <script src="https://code.jquery.com/jquery-3.7.1.js"
            integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
    <script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.3/jquery-ui.min.js"></script>
    <script src="https://yubinbango.github.io/yubinbango/yubinbango.js" charset="UTF-8"></script>
    <script src="/js/product/slick-slide.js"></script>
    <script src="/js/product/datepicker.js" defer></script>
    <script src="/js/product/product_make.js" defer></script>
    <script src="/js/je_validChk/product_make_validChk.js" defer></script>
    <script src="/js/je_validChk/validChk.js" defer></script>
</head>
<body>

<!-- content -->
<form action="/product/invitation-preview" method="post" enctype="multipart/form-data" onsubmit="return emptyChk()">
    <input type="hidden" name="t_pk" value="${t_pk}">
    <input type="hidden" name="m_id" value="${authenticatedMember.m_id}">
    <div id="je_product-make-container">
    <div class="je_page-title">制作</div>
        <div id="je_product-make-slider">
            <!-- 신랑신부 및 일정 -->
            <div class="je_page-content">
                <div class="je_progress-img">
                    <div class="je_progress-line"></div>
                    <div class="je_progress-circles">
                        <div class="je_progress">
                            <div class="je_progress-txt">情報・日程</div>
                            <div class="je_progress-circle-pink"></div>
                        </div>
                        <div class="je_progress">
                            <div class="je_progress-txt">メッセージ</div>
                            <div class="je_progress-circle"></div>
                        </div>
                        <div class="je_progress">
                            <div class="je_progress-txt">写真 添付</div>
                            <div class="je_progress-circle"></div>
                        </div>
                    </div>
                </div>
                <!-- 신랑신부 정보 -->
                <div class="je_input-boxes">
                    <div class="je_box-title">情報</div>
                    <div class="je_box-content">
                        <div class="je_content-title">
                            <div class="je_title-txt">新郎 側</div>
                            <div class="je_title-line">
                                <img src="/img/input-box-content-line.png" alt=""/>
                            </div>
                        </div>
                        <div class="je_content-contents">
                            <div class="je_input-box">
                                <div class="je_input-box-title">漢字</div>
                                <div class="je_name-input">
                                    <input type="text" placeholder="姓" class="jp-input" name="w_fam_jp_groom" maxlength="10"/>
                                    <input type="text" placeholder="名" class="jp-input" name="w_name_jp_groom" maxlength="10"/>
                                </div>
                            </div>
                            <div class="je_input-box">
                                <div class="je_input-box-title">ローマ字</div>
                                <div class="je_name-input">
                                    <input type="text" placeholder="Last Name" class="eng-input" name="w_fam_eng_groom" maxlength="50"/>
                                    <input type="text" placeholder="First Name" class="eng-input" name="w_name_eng_groom" maxlength="50"/>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="je_box-content">
                        <div class="je_content-title">
                            <div class="je_title-txt">新婦 側</div>
                            <div class="je_title-line">
                                <img src="/img/input-box-content-line.png" alt=""/>
                            </div>
                        </div>
                        <div class="je_content-contents">
                            <div class="je_input-box">
                                <div class="je_input-box-title">漢字</div>
                                <div class="je_name-input">
                                    <input type="text" placeholder="姓" class="jp-input" name="w_fam_jp_bride" maxlength="10"/>
                                    <input type="text" placeholder="名" class="jp-input" name="w_name_jp_bride" maxlength="10"/>
                                </div>
                            </div>
                            <div class="je_input-box">
                                <div class="je_input-box-title">ローマ字</div>
                                <div class="je_name-input">
                                    <input type="text" placeholder="Last Name" class="eng-input" name="w_fam_eng_bride" maxlength="50"/>
                                    <input type="text" placeholder="First Name" class="eng-input" name="w_name_eng_bride" maxlength="50"/>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- 일정정보 -->
                    <div class="je_box-title">日程情報</div>
                    <div class="je_box-content">
                        <div class="je_content-title2">式の日程</div>
                        <div class="je_content-calendar">
                            <input id="specialDate" type="text" inputmode="none"
                                   placeholder="日付を選んでください" autocomplete="off" readonly
                                   name="w_date"/>
                        </div>
                    </div>
                    <div class="je_box-content">
                        <div class="je_content-title">
                            <div class="je_title-txt">挙式</div>
                            <div class="je_title-line">
                                <img src="/img/input-box-content-line.png" alt=""/>
                            </div>
                        </div>
                        <div class="je_content-contents">
                            <div class="je_input-box">
                                <div class="je_input-box-title">時間</div>
                                <div class="je_time-input">
                                    <input name="w_wedding_time" id="timepickerM" class="timepicker"
                                           type="text" placeholder="時間選択" readonly/>
                                </div>
                            </div>
                            <div class="je_input-box">
                                <div class="je_input-box-title">集合</div>
                                <div class="je_time-input">
                                    <input name="w_wedding_assemble" id="timepickerMa" class="timepicker"
                                           type="text" placeholder="時間選択" readonly/>
                                </div>
                            </div>
                            <div class="je_boundary"></div>
                            <div class="h-adr">
                                <span class="p-country-name" style="display: none">Japan</span>
                                <div>
                                    <div class="je_input-box" style="margin-top: 1rem">
                                        <div class="je_input-box-title">郵便番号</div>
                                        <div class="je_address-input">
                                            <input type="text" class="p-postal-code"
                                                   size="8" maxlength="8" placeholder="数字で入力してください。"
                                                   name="w_wedding_postcode"/>
                                        </div>
                                    </div>
                                    <div class="je_input-box">
                                        <div class="je_input-box-title">住所</div>
                                        <div class="je_address-input">
                                              <textarea class="p-region p-locality p-street-address p-extended-address"
                                                        name="w_wedding_address" maxlength="200"></textarea>
                                        </div>
                                    </div>
                                    <div class="je_input-box">
                                        <div class="je_input-box-title">建物名</div>
                                        <div class="je_address-input">
                                            <div>
                                                <input type="text" class="je_building-name" name="w_wedding_building" maxlength="50"/>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="je_box-content">
                        <div class="je_content-title">
                            <div class="je_title-txt">披露宴</div>
                            <div class="je_title-line">
                                <img src="/img/input-box-content-line.png" alt=""/>
                            </div>
                        </div>
                        <div class="je_content-contents">
                            <div class="je_input-box">
                                <div class="je_input-box-title">時間</div>
                                <div class="je_time-input">
                                    <input name="w_reception_time" id="timepicker-r" class="timepicker"
                                           type="text" placeholder="時間選択" autocomplete="off" readonly/>
                                </div>
                            </div>
                            <div class="je_input-box">
                                <div class="je_input-box-title">集合</div>
                                <div class="je_time-input">
                                    <input name="w_reception_assemble" id="timepicker-ra" class="timepicker"
                                           type="text" placeholder="時間選択" autocomplete="off" readonly/>
                                </div>
                            </div>
                            <div class="je_boundary"></div>
                            <div></div>
                            <div class="h-adr">
                                <span class="p-country-name" style="display: none">Japan</span>
                                <div>
                                    <div class="je_input-box" style="margin-top: 1rem">
                                        <div class="je_input-box-title">郵便番号</div>
                                        <div class="je_address-input">
                                            <input type="text" class="p-postal-code"
                                                   size="8" maxlength="8" placeholder="数字で入力してください。"
                                                   name="w_reception_postcode"/>
                                        </div>
                                    </div>
                                    <div class="je_input-box">
                                        <div class="je_input-box-title">住所</div>
                                        <div class="je_address-input">
                                            <textarea class="p-region p-locality p-street-address p-extended-address"
                                                      name="w_reception_address" maxlength="200"></textarea>
                                        </div>
                                    </div>
                                    <div class="je_input-box">
                                        <div class="je_input-box-title">建物名</div>
                                        <div class="je_address-input">
                                            <div><input type="text" class="je_building-name"
                                                        name="w_reception_building" maxlength="50"/></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- 첨부메세지 -->
            <div class="je_page-content">
                <div class="je_progress-img">
                    <div class="je_progress-line"></div>
                    <div class="je_progress-circles">
                        <div class="je_progress">
                            <div class="je_progress-txt">情報・日程</div>
                            <div class="je_progress-circle-pink"></div>
                        </div>
                        <div class="je_progress">
                            <div class="je_progress-txt">メッセージ</div>
                            <div class="je_progress-circle-pink"></div>
                        </div>
                        <div class="je_progress">
                            <div class="je_progress-txt">写真 添付</div>
                            <div class="je_progress-circle"></div>
                        </div>
                    </div>
                </div>
                <div class="je_input-boxes">
                    <div class="je_box-title">メッセージ 添付</div>
                    <div class="je_box-content">
                        <div class="je_content-title">
                            <div class="je_title-txt">招待文句</div>
                            <div class="je_title-line">
                                <img src="/img/input-box-content-line.png" alt=""/>
                            </div>
                        </div>
                        <div id="je_invitation-button" class="je_content-recommendation">
                            招待文句 SAMPLE
                        </div>
                        <div class="je_content-message">
                            <textarea name="w_message_invite" id="je_invitation-textarea" maxlength="300"></textarea>
                        </div>
                    </div>
                    <div class="je_box-content">
                        <div class="je_content-title">
                            <div class="je_title-txt">仕上げの文句</div>
                            <div class="je_title-line">
                                <img src="/img/input-box-content-line.png" alt=""/>
                            </div>
                        </div>
                        <div id="je_closing-button" class="je_content-recommendation">
                            仕上げの文句 SAMPLE
                        </div>
                        <div class="je_content-message">
                            <textarea name="w_message_bye" id="je_closing-textarea" maxlength="300"></textarea>
                        </div>
                    </div>
                </div>
            </div>
            <!-- 사진 -->
            <div class="je_page-content">
                <div class="je_progress-img">
                    <div class="je_progress-line"></div>
                    <div class="je_progress-circles">
                        <div class="je_progress">
                            <div class="je_progress-txt">情報・日程</div>
                            <div class="je_progress-circle-pink"></div>
                        </div>
                        <div class="je_progress">
                            <div class="je_progress-txt">メッセージ</div>
                            <div class="je_progress-circle-pink"></div>
                        </div>
                        <div class="je_progress">
                            <div class="je_progress-txt">写真 添付</div>
                            <div class="je_progress-circle-pink"></div>
                        </div>
                    </div>
                </div>
                <div class="je_input-boxes">
                    <div class="je_box-title">写真 添付</div>
                    <div class="je_box-content">
                        <div class="je_content-title">
                            <div class="je_title-txt">代表写真</div>
                            <div class="je_title-line">
                                <img src="/img/input-box-content-line.png" alt=""/>
                            </div>
                        </div>
                        <div class="je_content-photo">
                            <div class="je_photoBox-container">
                                <div class="je_photobox-icon">
                                    <img src="/img/couple-icon.png">
                                </div>
                                <div id="je_photobox1" class="je_photobox">
                                    <input
                                            type="file"
                                            name="w_img1_file"
                                            id="je_photoInput1"
                                            onchange="readURL(this);"
                                            oninput="return photoType1()"
                                    />
                                    <div id="je_photoOut1"></div>
                                    <span>写真１</span>
                                </div>
                            </div>
                            <div class="je_photoBox-container">
                                <div class="je_photobox-icon">
                                    <img src="/img/groom-icon.png" style="transform: scaleX(-1);">
                                </div>
                                <div id="je_photobox2" class="je_photobox">
                                    <input
                                            type="file"
                                            name="w_img2_file"
                                            id="je_photoInput2"
                                            onchange="readURL(this);"
                                            oninput="return photoType2()"
                                    />
                                    <div id="je_photoOut2"></div>
                                    <span>写真２</span>
                                </div>
                            </div>
                            <div class="je_photoBox-container">
                                <div class="je_photobox-icon">
                                    <img src="/img/bride-icon.png">
                                </div>
                                <div id="je_photobox3" class="je_photobox">
                                    <input
                                            type="file"
                                            name="w_img3_file"
                                            id="je_photoInput3"
                                            onchange="readURL(this);"
                                            oninput="return photoType3()"
                                    />
                                    <div id="je_photoOut3"></div>
                                    <span>写真３</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="je_box-content">
                        <div class="je_content-title">
                            <div class="je_title-txt">共有写真</div>
                            <div class="je_title-line">
                                <img src="/img/input-box-content-line.png" alt=""/>
                            </div>
                        </div>
                        <div class="je_content-photos">
                            <label for="je_photo-input">
                                <div class="je_photo-input-button">
                                    ファイル選択
                                    <span>(最大9枚まで)</span>
                                </div>
                            </label>
                            <input
                                    name="w_img_share_files"
                                    id="je_photo-input"
                                    type="file"
                                    onchange="addFile(this);"
                                    multiple
                            >
                            <div class="je_photo-listBox">
                                <div class="je_photo-listTitle">「写真リスト」</div>
                                <div class="je_photo-list"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="je_slider-buttons">
            <button id="je_prev-button" type="button">前へ</button>
            <button id="je_next-button" type="button">次へ</button>
            <button id="je_submit-button" type="submit">作成完了</button>
        </div>
    </div>
</form>
<!-- invitation message - 추천 -->
<div id="je_invitation-modal" class="je_modal">
    <div class="modal-content">
        <span id="je_invitation-close" class="je_close-button">×</span>
        <div class="je_modal-title">招待文句 選択</div>
        <div class="je_modal-content">
            <div class="je_theme-buttons">
                <div>ALL</div>
                <div>季節</div>
                <div>丁重な</div>
                <div>ユーモラスな</div>
            </div>
            <div class="je_theme-message">
                <!-- 계절별 -->
                <div class="je_theme-message-box invitationM">
                    <div class="je_theme-message-detail">
                        <div class="je_message-num">BEST</div>
                        <div class="je_message-txt">
                            皆様にはご清祥のこととお慶び申し上げます<br/>
                            佐藤家の新しい第一歩にお励ましないただきたく<br/>
                            ぜひご出席くださいますようご案内申し上げます<br/>
                        </div>
                    </div>
                    <div class="je_theme-message-button">
                        <button class="je_invitation-sendBtn">選択</button>
                    </div>
                </div>
                <!-- 계절별 -->
                <div class="je_theme-message-box invitationM seasonsIM">
                    <div class="je_theme-message-detail">
                        <div class="je_message-num">春</div>
                        <div class="je_message-txt">
                            皆様には桜花爛漫の候、ご清祥のこととお慶び申し上げます。<br/>
                            桜舞う中、私どもの新しい門出を迎えるにあたり、<br/>
                            ぜひご出席くださいますようご案内申し上げます。<br/>
                        </div>
                    </div>
                    <div class="je_theme-message-button">
                        <button class="je_invitation-sendBtn">選択</button>
                    </div>
                </div>
                <div class="je_theme-message-box invitationM seasonsIM">
                    <div class="je_theme-message-detail">
                        <div class="je_message-num">夏</div>
                        <div class="je_message-txt">
                            皆様には蝉の声響く夏、ご健勝のこととお喜び申し上げます。<br/>
                            私どもの結婚式に、夏の日差しのような温かいご支援を賜りたく、<br/>
                            ぜひご出席くださいますようご案内申し上げます。<br/>
                        </div>
                    </div>
                    <div class="je_theme-message-button">
                        <button class="je_invitation-sendBtn">選択</button>
                    </div>
                </div>
                <div class="je_theme-message-box invitationM seasonsIM">
                    <div class="je_theme-message-detail">
                        <div class="je_message-num">秋</div>
                        <div class="je_message-txt">
                            皆様には紅葉が色づく季節、ご清祥のこととお慶び申し上げます。<br/>
                            澄んだ秋空のもと、私たちの結婚式にお越しいただければ幸いです。<br/>
                            ぜひご出席くださいますようご案内申し上げます。<br/>
                        </div>
                    </div>
                    <div class="je_theme-message-button">
                        <button class="je_invitation-sendBtn">選択</button>
                    </div>
                </div>
                <div class="je_theme-message-box invitationM seasonsIM">
                    <div class="je_theme-message-detail">
                        <div class="je_message-num">冬</div>
                        <div class="je_message-txt">
                            皆様には雪景色が美しい季節、ご健勝のこととお喜び申し上げます。<br/>
                            白い雪に包まれた中、私どもの新たな門出を温かく見守っていただきたく、<br/>
                            ぜひご出席くださいますようご案内申し上げます。<br/>
                        </div>
                    </div>
                    <div class="je_theme-message-button">
                        <button class="je_invitation-sendBtn">選択</button>
                    </div>
                </div>
                <!-- 정중한 -->
                <div class="je_theme-message-box invitationM politeIM">
                    <div class="je_theme-message-detail">
                        <div class="je_message-num">丁重な1</div>
                        <div class="je_message-txt">
                            皆様にはご清祥のこととお慶び申し上げます。<br/>
                            私どもの結婚式に際し、ご多忙中誠に恐縮ではございますが、<br/>
                            何卒ご臨席賜りますようお願い申し上げます。<br/>
                        </div>
                    </div>
                    <div class="je_theme-message-button">
                        <button class="je_invitation-sendBtn">選択</button>
                    </div>
                </div>
                <div class="je_theme-message-box invitationM politeIM">
                    <div class="je_theme-message-detail">
                        <div class="je_message-num">丁重な2</div>
                        <div class="je_message-txt">
                            皆様にはご健勝のこととお喜び申し上げます。<br/>
                            このたび私どもの門出に際し、ご厚情を賜りたく、<br/>
                            何卒ご列席くださいますようお願い申し上げます。<br/>
                        </div>
                    </div>
                    <div class="je_theme-message-button">
                        <button class="je_invitation-sendBtn">選択</button>
                    </div>
                </div>
                <div class="je_theme-message-box invitationM politeIM">
                    <div class="je_theme-message-detail">
                        <div class="je_message-num">丁重な3</div>
                        <div class="je_message-txt">
                            皆様にはご清祥のこととお慶び申し上げます。<br/>
                            私どもの佳き日に、ご多用のところ恐縮ではございますが、<br/>
                            ぜひご光臨を賜りますようお願い申し上げます。<br/>
                        </div>
                    </div>
                    <div class="je_theme-message-button">
                        <button class="je_invitation-sendBtn">選択</button>
                    </div>
                </div>
                <div class="je_theme-message-box invitationM politeIM">
                    <div class="je_theme-message-detail">
                        <div class="je_message-num">丁重な4</div>
                        <div class="je_message-txt">
                            皆様にはご健勝のこととお喜び申し上げます。<br/>
                            このたび私どもの結婚式に、ご臨席を賜りたく、<br/>
                            何卒よろしくお願い申し上げます。<br/>
                        </div>
                    </div>
                    <div class="je_theme-message-button">
                        <button class="je_invitation-sendBtn">選択</button>
                    </div>
                </div>
                <!-- ユーモラスな -->
                <div class="je_theme-message-box invitationM humorIM">
                    <div class="je_theme-message-detail">
                        <div class="je_message-num">ユーモラスな1</div>
                        <div class="je_message-txt">
                            皆様には日々のストレスが溶けるような幸せな時間をお過ごしのことと存じます。<br/>
                            このたび私たちが結婚する運命を選びました！<br/>
                            「最後のチャンスを逃さないように」と、ぜひご参加ください！<br/>
                        </div>
                    </div>
                    <div class="je_theme-message-button">
                        <button class="je_invitation-sendBtn">選択</button>
                    </div>
                </div>
                <div class="je_theme-message-box invitationM humorIM">
                    <div class="je_theme-message-detail">
                        <div class="je_message-num">ユーモラスな2</div>
                        <div class="je_message-txt">
                            皆様にはいつも笑顔満開でお過ごしのことと存じます。<br/>
                            私たちが「一生の愛」を証明するため、いよいよ結婚することになりました！<br/>
                            笑いの絶えない一日を一緒に楽しみましょう！<br/>
                        </div>
                    </div>
                    <div class="je_theme-message-button">
                        <button class="je_invitation-sendBtn">選択</button>
                    </div>
                </div>
                <div class="je_theme-message-box invitationM humorIM">
                    <div class="je_theme-message-detail">
                        <div class="je_message-num">ユーモラスな3</div>
                        <div class="je_message-txt">
                            皆様には毎日素晴らしい出来事があることを願っております。<br/>
                            このたび私たちが「婚姻届」という重大なミッションを達成するため、<br/>
                            ぜひその瞬間を見守ってください！失敗するかも…ですが（笑）<br/>
                        </div>
                    </div>
                    <div class="je_theme-message-button">
                        <button class="je_invitation-sendBtn">選択</button>
                    </div>
                </div>
                <div class="je_theme-message-box invitationM humorIM">
                    <div class="je_theme-message-detail">
                        <div class="je_message-num">ユーモラスな4</div>
                        <div class="je_message-txt">
                            皆様には楽しい日々をお過ごしのことと存じます。<br/>
                            私たちの結婚式は、婚活成功記念パーティーです！<br/>
                            ぜひ「これが最後のチャンス」と思ってご参加ください（笑）<br/>
                        </div>
                    </div>
                    <div class="je_theme-message-button">
                        <button class="je_invitation-sendBtn">選択</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- closing message - 추천 -->
<div id="je_closing-modal" class="je_modal">
    <div class="modal-content">
        <span id="je_closing-close" class="je_close-button">×</span>
        <div class="je_modal-title">仕上げの文句 選択</div>
        <div class="je_modal-content">
            <div class="je_theme2-buttons">
                <div>ALL</div>
                <!-- <button>BEST</button> -->
                <div>季節</div>
                <div>丁重な</div>
                <div>ユーモラスな</div>
            </div>
            <div class="je_theme-message">
                <!-- BEST -->
                <div class="je_theme-message-box closingM">
                    <div class="je_theme-message-detail">
                        <div class="je_message-num">BEST</div>
                        <div class="je_message-txt">
                            皆様の祝福に包まれて<br/>
                            挙式の日を迎えられることに<br/>
                            心から感謝いたします<br/>
                            いたらぬところが多いふたりですが<br/>
                            今後とも変わらずお付き合いくださいますよう<br/>
                            よろしくお願いいたします<br/>
                        </div>
                    </div>
                    <div class="je_theme-message-button">
                        <button class="je_closing-sendBtn">選択</button>
                    </div>
                </div>
                <!-- 계절별 -->
                <div class="je_theme-message-box closingM seasonsCM">
                    <div class="je_theme-message-detail">
                        <div class="je_message-num">春</div>
                        <div class="je_message-txt">
                            皆様の温かいご祝福に包まれて、<br/>
                            桜の花が咲き誇る春の日に挙式を迎えられることに、<br/>
                            心より感謝申し上げます。<br/>
                            まだまだ未熟な二人ですが、<br/>
                            今後とも変わらぬご指導とご支援を賜りますよう、<br/>
                            よろしくお願い申し上げます。<br/>
                        </div>
                    </div>
                    <div class="je_theme-message-button">
                        <button class="je_closing-sendBtn">選択</button>
                    </div>
                </div>
                <div class="je_theme-message-box closingM seasonsCM">
                    <div class="je_theme-message-detail">
                        <div class="je_message-num">夏</div>
                        <div class="je_message-txt">
                            皆様のご厚情に包まれて、<br/>
                            青空と輝く太陽の下、夏の日に挙式を迎えられることに、<br/>
                            心より感謝申し上げます。<br/>
                            未熟な二人ですが、<br/>
                            これからも変わらぬご支援と温かいご指導を賜りますよう、<br/>
                            よろしくお願い申し上げます。<br/>
                        </div>
                    </div>
                    <div class="je_theme-message-button">
                        <button class="je_closing-sendBtn">選択</button>
                    </div>
                </div>
                <div class="je_theme-message-box closingM seasonsCM">
                    <div class="je_theme-message-detail">
                        <div class="je_message-num">秋</div>
                        <div class="je_message-txt">
                            皆様の温かなご祝福に包まれて、<br/>
                            紅葉が美しく色づく秋の日に挙式を迎えられることに、<br/>
                            心より感謝申し上げます。<br/>
                            至らぬ点が多い私たちですが、<br/>
                            今後とも変わらぬご支援とご指導を賜りますよう、<br/>
                            よろしくお願い申し上げます。<br/>
                        </div>
                    </div>
                    <div class="je_theme-message-button">
                        <button class="je_closing-sendBtn">選択</button>
                    </div>
                </div>
                <div class="je_theme-message-box closingM seasonsCM">
                    <div class="je_theme-message-detail">
                        <div class="je_message-num">冬</div>
                        <div class="je_message-txt">
                            皆様のご厚情に包まれて、<br/>
                            雪の舞う静かな冬の日に挙式を迎えられることに、<br/>
                            心より感謝申し上げます。<br/>
                            至らぬ点が多い私たちですが、<br/>
                            これからも変わらぬご支援と温かいご指導を賜りますよう、<br/>
                            よろしくお願い申し上げます。<br/>
                        </div>
                    </div>
                    <div class="je_theme-message-button">
                        <button class="je_closing-sendBtn">選択</button>
                    </div>
                </div>
                <!-- 정중한 -->
                <div class="je_theme-message-box closingM politeCM">
                    <div class="je_theme-message-detail">
                        <div class="je_message-num">丁重な1</div>
                        <div class="je_message-txt">
                            皆様の温かいご祝福に包まれて<br/>
                            挙式の日を迎えることができること、<br/>
                            心より感謝申し上げます。<br/>
                            至らぬ点も多い私たちですが、<br/>
                            今後とも変わらぬご指導とご支援を賜りますよう、<br/>
                            何卒よろしくお願い申し上げます。<br/>
                        </div>
                    </div>
                    <div class="je_theme-message-button">
                        <button class="je_closing-sendBtn">選択</button>
                    </div>
                </div>
                <div class="je_theme-message-box closingM politeCM">
                    <div class="je_theme-message-detail">
                        <div class="je_message-num">丁重な2</div>
                        <div class="je_message-txt">
                            皆様のご厚情に包まれて<br/>
                            挙式の日を迎えられることに、<br/>
                            心より感謝申し上げます。<br/>
                            未熟な二人ですが、<br/>
                            今後とも変わらずお付き合いくださいますよう、<br/>
                            どうぞよろしくお願い申し上げます。<br/>
                        </div>
                    </div>
                    <div class="je_theme-message-button">
                        <button class="je_closing-sendBtn">選択</button>
                    </div>
                </div>
                <div class="je_theme-message-box closingM politeCM">
                    <div class="je_theme-message-detail">
                        <div class="je_message-num">丁重な3</div>
                        <div class="je_message-txt">
                            皆様の温かな祝福に囲まれて<br/>
                            挙式の日を迎えられることを、<br/>
                            心より感謝申し上げます。<br/>
                            至らぬ点が多い私たちですが、<br/>
                            今後とも変わらぬご支援を賜りますよう、<br/>
                            どうぞよろしくお願い申し上げます。<br/>
                        </div>
                    </div>
                    <div class="je_theme-message-button">
                        <button class="je_closing-sendBtn">選択</button>
                    </div>
                </div>
                <div class="je_theme-message-box closingM politeCM">
                    <div class="je_theme-message-detail">
                        <div class="je_message-num">丁重な4</div>
                        <div class="je_message-txt">
                            皆様のご厚意に包まれ、<br/>
                            挙式の日を迎えられることに、<br/>
                            心より感謝申し上げます。<br/>
                            未熟な二人ですが、<br/>
                            今後とも変わらぬご指導とお付き合いを、<br/>
                            何卒よろしくお願い申し上げます。<br/>
                        </div>
                    </div>
                    <div class="je_theme-message-button">
                        <button class="je_closing-sendBtn">選択</button>
                    </div>
                </div>
                <!-- ユーモラスな -->
                <div class="je_theme-message-box closingM humorCM">
                    <div class="je_theme-message-detail">
                        <div class="je_message-num">ユーモラスな1</div>
                        <div class="je_message-txt">
                            皆様のおかげで、<br/>
                            挙式の日が無事に迎えられることに、<br/>
                            心より感謝申し上げます。<br/>
                            まだまだ手探りな二人ですが、<br/>
                            「これからが本当の冒険だ！」と<br/>
                            思っていますので、笑って応援してくださいね！<br/>
                        </div>
                    </div>
                    <div class="je_theme-message-button">
                        <button class="je_closing-sendBtn">選択</button>
                    </div>
                </div>
                <div class="je_theme-message-box closingM humorCM">
                    <div class="je_theme-message-detail">
                        <div class="je_message-num">ユーモラスな2</div>
                        <div class="je_message-txt">
                            皆様のおかげで、<br/>
                            挙式の日を迎えられる幸運に、<br/>
                            心から感謝申し上げます。<br/>
                            二人とも「この先どうなるの？」と<br/>
                            ドキドキしていますが、<br/>
                            引き続きハラハラしながら見守ってください！<br/>
                        </div>
                    </div>
                    <div class="je_theme-message-button">
                        <button class="je_closing-sendBtn">選択</button>
                    </div>
                </div>
                <div class="je_theme-message-box closingM humorCM">
                    <div class="je_theme-message-detail">
                        <div class="je_message-num">ユーモラスな3</div>
                        <div class="je_message-txt">
                            皆様の温かい祝福で、<br/>
                            挙式の日が無事にやってきました！<br/>
                            私たちは「これからが試練だ！」と<br/>
                            心の中で叫んでいますが、<br/>
                            どうぞ温かい目で見守ってくださいね！<br/>
                        </div>
                    </div>
                    <div class="je_theme-message-button">
                        <button class="je_closing-sendBtn">選択</button>
                    </div>
                </div>
                <div class="je_theme-message-box closingM humorCM">
                    <div class="je_theme-message-detail">
                        <div class="je_message-num">ユーモラスな4</div>
                        <div class="je_message-txt">
                            皆様のおかげで、<br/>
                            挙式の日を迎えられることができ、<br/>
                            心より感謝申し上げます。<br/>
                            「これからの生活、どうなるんだろう？」と<br/>
                            毎日ドキドキしていますが、<br/>
                            笑いながら応援していただけると幸いです！<br/>
                        </div>
                    </div>
                    <div class="je_theme-message-button">
                        <button class="je_closing-sendBtn">選択</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%--alert--%>
<div id="emptyWarning-msg">
    未入力のフィールドがあります。<br />
    入力してください。
</div>

<div id="typeWarning-msg">
    添付するファイルは
    <p>gif・jpg・png・jpeg</p>
    形式にしてください。
</div>

<div id="jpWarning-msg">
    このフィールドには<br>
    <p>漢字、ひらがな、カタカナ</p>
    入力してください。
</div>

<div id="engWarning-msg">
    <p>英字のみ</p>入力してください。
</div>

<div id="filesWarning-msg">
    ファイル名は<span>50文字</span>まで、<br>
    ファイルサイズは<span>最大10MB</span>まで対応しています。
</div>

<div id="filesCntWarning-msg">
    共有写真は <br>
    <span>最大9枚まで</span> 添付できます。
</div>


</body>
</html>
