<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>制作</title>
    <!-- Noto Serif Japanese 폰트 적용 -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Noto+Serif+JP:wght@200..900&display=swap" rel="stylesheet" />
    <!-- CSS -->
    <link rel="stylesheet" href="/resources/css/product/product_make.css" />
    <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css" />
    <link rel="stylesheet" href="/resources/css/product/picker.css" />
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.13.3/themes/base/jquery-ui.css"/>
    <!-- JavaScript -->
    <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
    <script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js" ></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.3/jquery-ui.min.js"></script>
    <script src="https://yubinbango.github.io/yubinbango/yubinbango.js" charset="UTF-8" ></script>
    <script src="/resources/js/product/product_make.js" defer></script>
    <script src="/resources/js/product/slick-slide.js"></script>
    <script src="/resources/js/product/datepicker.js" defer></script>
</head>

<body>
<!-- header -->
<div class="je_menu-bar">
    <div id="je_logo">
        <img src="/resources/img/en-musubi-logo.png" alt="" />
    </div>
</div>
<!-- content -->
<form>
    <div id="je_product-make-container">
        <div class="je_page-title">
            <div class="je_page-title-txt">制作</div>
        </div>
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
                                <img src="/resources/img/input-box-content-line.png" alt="" />
                            </div>
                        </div>
                        <div class="je_content-contents">
                            <div class="je_input-box">
                                <div class="je_input-box-title">漢字</div>
                                <div class="je_name-input">
                                    <input type="text" placeholder="姓" /><input type="text" placeholder="名"/>
                                </div>
                            </div>
                            <div class="je_input-box">
                                <div class="je_input-box-title">ローマ字</div>
                                <div class="je_name-input">
                                    <input type="text" placeholder="Last Name" /><input type="text" placeholder="First Name" />
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="je_box-content">
                        <div class="je_content-title">
                            <div class="je_title-txt">新婦 側</div>
                            <div class="je_title-line">
                                <img src="/resources/img/input-box-content-line.png" alt="" />
                            </div>
                        </div>
                        <div class="je_content-contents">
                            <div class="je_input-box">
                                <div class="je_input-box-title">漢字</div>
                                <div class="je_name-input">
                                    <input type="text" placeholder="姓" /><input type="text" placeholder="名" />
                                </div>
                            </div>
                            <div class="je_input-box">
                                <div class="je_input-box-title">ローマ字</div>
                                <div class="je_name-input">
                                    <input type="text" placeholder="Last Name" /><input type="text" placeholder="First Name" />
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
                                    placeholder="日付を選んでください" autocomplete="off" readonly />
                        </div>
                    </div>
                    <div class="je_box-content">
                        <div class="je_content-title">
                            <div class="je_title-txt">挙式</div>
                            <div class="je_title-line">
                                <img src="/resources/img/input-box-content-line.png" alt="" />
                            </div>
                        </div>
                        <div class="je_content-contents">
                            <div class="je_input-box">
                                <div class="je_input-box-title">時間</div>
                                <div class="je_time-input">
                                    <input name="marriageTime" id="timepickerM" class="timepicker"
                                            type="text" placeholder="時間選択" readonly />
                                </div>
                            </div>
                            <div class="je_input-box">
                                <div class="je_input-box-title">集合</div>
                                <div class="je_time-input">
                                    <input name="marriageTime_a" id="timepickerMa" class="timepicker"
                                            type="text" placeholder="時間選択" readonly />
                                </div>
                            </div>
                            <div
                                    style="
                        border: 0.5px solid red;
                        margin-top: 1rem;
                        margin-bottom: 0.5rem;
                      "
                            ></div>
                            <div></div>
                            <div class="h-adr">
                      <span class="p-country-name" style="display: none" >Japan</span >
                                <div>
                                    <div class="je_input-box" style="margin-top: 1rem">
                                        <div class="je_input-box-title">郵便番号</div>
                                        <div class="je_address-input">
                                            <input type="text" class="p-postal-code"
                                                    size="8" maxlength="8" placeholder="数字で入力してください。" />
                                        </div>
                                    </div>
                                    <div class="je_input-box">
                                        <div class="je_input-box-title">住所</div>
                                        <div class="je_address-input">
                                            <input type="text" class="p-region p-locality p-street-address p-extended-address"
                                                    size="50" style="height: 4rem" />
                                        </div>
                                    </div>
                                    <div class="je_input-box">
                                        <div class="je_input-box-title">番地</div>
                                        <div class="je_address-input">
                                            <div><input type="text" id="je_address-number1" /></div>
                                        </div>
                                    </div>
                                    <div class="je_input-box">
                                        <div class="je_input-box-title">建物名</div>
                                        <div class="je_address-input">
                                            <div><input type="text" id="je_building-name1" /></div>
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
                                <img src="resources/img/input-box-content-line.png" alt="" />
                            </div>
                        </div>
                        <div class="je_content-contents">
                            <div class="je_input-box">
                                <div class="je_input-box-title">時間</div>
                                <div class="je_time-input">
                                    <input name="receptionTime" id="timepicker-r" class="timepicker"
                                            type="text" placeholder="時間選択" autocomplete="off" readonly />
                                </div>
                            </div>
                            <div class="je_input-box">
                                <div class="je_input-box-title">集合</div>
                                <div class="je_time-input">
                                    <input name="receptionTime_a" id="timepicker-ra" class="timepicker"
                                            type="text" placeholder="時間選択" autocomplete="off" readonly />
                                </div>
                            </div>
                            <div
                                    style="
                        border: 0.5px solid red;
                        margin-top: 1rem;
                        margin-bottom: 0.5rem;
                        border-style: dotted;
                      "
                            ></div>
                            <div></div>
                            <div class="h-adr">
                      <span class="p-country-name" style="display: none" >Japan</span >
                                <div>
                                    <div class="je_input-box" style="margin-top: 1rem">
                                        <div class="je_input-box-title">郵便番号</div>
                                        <div class="je_address-input">
                                            <input type="text" class="p-postal-code"
                                                    size="8" maxlength="8" placeholder="数字で入力してください。" />
                                        </div>
                                    </div>
                                    <div class="je_input-box">
                                        <div class="je_input-box-title">住所</div>
                                        <div class="je_address-input">
                                            <input type="text" class="p-region p-locality p-street-address p-extended-address"
                                                    size="50" style="height: 4rem" />
                                        </div>
                                    </div>
                                    <div class="je_input-box">
                                        <div class="je_input-box-title">番地</div>
                                        <div class="je_address-input">
                                            <div><input type="text" id="je_address-number2" /></div>
                                        </div>
                                    </div>
                                    <div class="je_input-box">
                                        <div class="je_input-box-title">建物名</div>
                                        <div class="je_address-input">
                                            <div><input type="text" id="je_building-name2" /></div>
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
                                <img src="resources/img/input-box-content-line.png" alt="" />
                            </div>
                        </div>
                        <div id="je_invitation-button" class="je_content-recommendation">
                            招待文句 SAMPLE
                        </div>
                        <div class="je_content-message">
                            <textarea name="" id="je_invitation-textarea"></textarea>
                        </div>
                    </div>
                    <div class="je_box-content">
                        <div class="je_content-title">
                            <div class="je_title-txt">仕上げの文句</div>
                            <div class="je_title-line">
                                <img src="resources/img/input-box-content-line.png" alt="" />
                            </div>
                        </div>
                        <div id="je_closing-button" class="je_content-recommendation">
                            仕上げの文句 SAMPLE
                        </div>
                        <div class="je_content-message">
                            <textarea name="" id="je_closing-textarea"></textarea>
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
                                <img src="resources/img/input-box-content-line.png" alt="" />
                            </div>
                        </div>
                        <div class="je_content-photo">
                            <div id="je_photobox1" class="je_photobox">
                                <input
                                        type="file"
                                        name="photo1"
                                        id="je_photoInput1"
                                        onchange="readURL(this);"
                                        oninput="return photoType1()"
                                />
                                <div id="je_photoOut1"></div>
                                <span>写真１</span>
                            </div>
                            <div id="je_photobox2" class="je_photobox">
                                <input
                                        type="file"
                                        name="photo2"
                                        id="je_photoInput2"
                                        onchange="readURL(this);"
                                        oninput="return photoType2()"
                                />
                                <div id="je_photoOut2"></div>
                                <span>写真２</span>
                            </div>
                            <div id="je_photobox3" class="je_photobox">
                                <input
                                        type="file"
                                        name="photo3"
                                        id="je_photoInput3"
                                        onchange="readURL(this);"
                                        oninput="return photoType3()"
                                />
                                <div id="je_photoOut3"></div>
                                <span>写真３</span>
                            </div>
                            <div id="je_photobox4" class="je_photobox">
                                <input
                                        type="file"
                                        name="photo4"
                                        id="je_photoInput4"
                                        onchange="readURL(this);"
                                        oninput="return photoType4()"
                                />
                                <div id="je_photoOut4"></div>
                                <span>写真4</span>
                            </div>
                        </div>
                    </div>
                    <div class="je_box-content">
                        <div class="je_content-title">
                            <div class="je_title-txt">共有写真</div>
                            <div class="je_title-line">
                                <img src="resources/img/input-box-content-line.png" alt="" />
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
                                    id="je_photo-input"
                                    type="file"
                                    onchange="addFile(this);"
                                    multiple
                            />
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
            <button id="je_submit-button">作成完了</button>
        </div>
    </div>

    <!-- invitation message - 추천 -->
    <div id="je_invitation-modal" class="je_modal">
        <div class="modal-content">
            <span id="je_invitation-close" class="je_close-button">×</span>
            <div class="je_modal-title">招待文句 選択</div>
            <div class="je_modal-content">
                <div class="je_theme-buttons">
                    <div>ALL</div>
                    <!-- <button>BEST</button> -->
                    <div>季節</div>
                    <div>丁重な</div>
                    <div>ユーモラスな</div>
                </div>
                <div class="je_theme-message">
                    <!-- 계절별 -->
                    <div class="je_theme-message-box invitationM seasonsIM">
                        <div class="je_theme-message-detail">
                            <div class="je_message-num">春</div>
                            <div class="je_message-txt">
                                春風が心地よいこの季節、桜が咲き誇る中、皆様と共に私たちの結婚式を迎えられることを心より楽しみにしております。<br />
                                新たな門出を皆様に見守っていただきたく、ぜひご参列賜りますようお願い申し上げます。<br />
                                心から感謝の気持ちを込めて、ご案内申し上げます。
                            </div>
                        </div>
                        <div class="je_theme-message-button">
                            <div class="je_invitation-sendBtn">選択</div>
                        </div>
                    </div>
                    <div class="je_theme-message-box invitationM seasonsIM">
                        <div class="je_theme-message-detail">
                            <div class="je_message-num">夏</div>
                            <div class="je_message-txt">
                                夏の陽気に包まれたこの季節、蝉の声が響き渡る中、私たちの結婚式にご出席いただけることを心よりお待ちしております。<br />
                                暑さにも負けず、皆様と共に新たな人生のスタートを祝いたく存じます。<br />
                                ぜひご来臨賜りますようお願い申し上げます。
                            </div>
                        </div>
                        <div class="je_theme-message-button">
                            <div class="je_invitation-sendBtn" >選択</div>
                        </div>
                    </div>
                    <div class="je_theme-message-box invitationM seasonsIM">
                        <div class="je_theme-message-detail">
                            <div class="je_message-num">秋</div>
                            <div class="je_message-txt">
                                紅葉が美しく色づくこの季節、実り豊かな秋の風景に囲まれながら、私たちの結婚式を皆様と共に祝うことができることを楽しみにしております。<br />
                                新たな人生の門出を、皆様に見守っていただければ幸いです。<br />
                                ぜひご出席賜りますようお願い申し上げます。
                            </div>
                        </div>
                        <div class="je_theme-message-button">
                            <div class="je_invitation-sendBtn">選択</div>
                        </div>
                    </div>
                    <div class="je_theme-message-box invitationM seasonsIM">
                        <div class="je_theme-message-detail">
                            <div class="je_message-num">冬</div>
                            <div class="je_message-txt">
                                冬の澄んだ空気が心地よいこの季節、雪のように清らかな気持ちで、私たちの結婚式にご参加いただけることを心よりお待ちしております。<br />
                                寒さを忘れるほどの温かいひとときを、皆様と共に過ごしたく存じます。<br />
                                ぜひご参列賜りますようお願い申し上げます。
                            </div>
                        </div>
                        <div class="je_theme-message-button">
                            <div class="je_invitation-sendBtn">選択</div>
                        </div>
                    </div>
                    <!-- 정중한 -->
                    <div class="je_theme-message-box invitationM politeIM">
                        <div class="je_theme-message-detail">
                            <div class="je_message-num">丁重な1</div>
                            <div class="je_message-txt">
                                拝啓 皆様にはますますご清祥のこととお慶び申し上げます。<br />
                                さて、このたび私たちは結婚する運びとなりました。<br />
                                つきましては、日頃の感謝の意を込め、ささやかながら結婚式を執り行いたいと存じます。<br />
                                ご多忙中とは存じますが、何卒ご臨席賜りますようお願い申し上げます。敬具
                            </div>
                        </div>
                        <div class="je_theme-message-button">
                            <div class="je_invitation-sendBtn">選択</div>
                        </div>
                    </div>
                    <div class="je_theme-message-box invitationM politeIM">
                        <div class="je_theme-message-detail">
                            <div class="je_message-num">丁重な2</div>
                            <div class="je_message-txt">
                                拝啓 時下ますますご清祥のこととお喜び申し上げます。<br />
                                このたび、私たちは結婚の運びとなりました。<br />
                                つきましては、皆様に日頃のご愛顧を賜り、誠に感謝の気持ちを込めて、ささやかながら結婚式を挙げたいと存じます。<br />
                                ご多忙中とは存じますが、ぜひご臨席を賜りますようお願い申し上げます。敬具
                            </div>
                        </div>
                        <div class="je_theme-message-button">
                            <div class="je_invitation-sendBtn">選択</div>
                        </div>
                    </div>
                    <div class="je_theme-message-box invitationM politeIM">
                        <div class="je_theme-message-detail">
                            <div class="je_message-num">丁重な3</div>
                            <div class="je_message-txt">
                                謹啓 皆様には益々ご清栄のこととお慶び申し上げます。<br />
                                さて、このたび私たちは結婚する運びとなり、ささやかながら結婚式を執り行いたいと存じます。<br />
                                日頃の感謝の気持ちを込め、皆様にご参列いただければ幸いです。
                                <br />
                                ご多忙とは存じますが、何卒ご臨席賜りますようお願い申し上げます。謹白
                            </div>
                        </div>
                        <div class="je_theme-message-button">
                            <div class="je_invitation-sendBtn">選択</div>
                        </div>
                    </div>
                    <div class="je_theme-message-box invitationM politeIM">
                        <div class="je_theme-message-detail">
                            <div class="je_message-num">丁重な4</div>
                            <div class="je_message-txt">
                                謹啓 時下ますますご清祥のこととお喜び申し上げます。<br />
                                このたび、私たちは結婚することとなりました。<br />
                                つきましては、日頃の感謝の気持ちを込め、ささやかながら結婚式を挙げたく存じます。<br />
                                ご多忙中とは存じますが、何卒ご臨席賜りますようお願い申し上げます。謹白
                            </div>
                        </div>
                        <div class="je_theme-message-button">
                            <div class="je_invitation-sendBtn">選択</div>
                        </div>
                    </div>
                    <!-- ユーモラスな -->
                    <div class="je_theme-message-box invitationM humorIM">
                        <div class="je_theme-message-detail">
                            <div class="je_message-num">ユーモラスな1</div>
                            <div class="je_message-txt">
                                このたび、ついに私たちは結婚することとなりました。<br />
                                長い道のりでしたが、ようやくゴールインです！<br />
                                ぜひ、その瞬間を皆様と共に祝いたく、結婚式にご出席いただければと思います。<br />
                                楽しいひとときを一緒に過ごしましょう！
                            </div>
                        </div>
                        <div class="je_theme-message-button">
                            <div class="je_invitation-sendBtn">選択</div>
                        </div>
                    </div>
                    <div class="je_theme-message-box invitationM humorIM">
                        <div class="je_theme-message-detail">
                            <div class="je_message-num">ユーモラスな2</div>
                            <div class="je_message-txt">
                                「遂に結婚します！お互いによく頑張りました。<br />
                                そんな私たちの晴れの日を、<br />
                                ぜひ皆様に見届けていただきたく、結婚式にご出席いただければと思います。<br />
                                楽しいイベントも用意していますので、お楽しみに！
                            </div>
                        </div>
                        <div class="je_theme-message-button">
                            <div class="je_invitation-sendBtn">選択</div>
                        </div>
                    </div>
                    <div class="je_theme-message-box invitationM humorIM">
                        <div class="je_theme-message-detail">
                            <div class="je_message-num">ユーモラスな3</div>
                            <div class="je_message-txt">
                                なんと、私たち結婚します！<br />
                                人生の新たなステージに進むため、皆様のご協力を得て、盛大にお祝いしたいと思います。<br />
                                結婚式には、笑いあり涙ありの楽しい時間をお約束します。<br />
                                ぜひご参加ください！
                            </div>
                        </div>
                        <div class="je_theme-message-button">
                            <div class="je_invitation-sendBtn">選択</div>
                        </div>
                    </div>
                    <div class="je_theme-message-box invitationM humorIM">
                        <div class="je_theme-message-detail">
                            <div class="je_message-num">ユーモラスな4</div>
                            <div class="je_message-txt">
                                ついにこの日がやってきました！結婚します！<br />
                                いつもお世話になっている皆様に感謝の気持ちを込めて、結婚式にご招待いたします。<br />
                                楽しいひとときを一緒に過ごしましょう！<br />
                                お待ちしております。
                            </div>
                        </div>
                        <div class="je_theme-message-button">
                            <div class="je_invitation-sendBtn">選択</div>
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
                    <!-- 계절별 -->
                    <div class="je_theme-message-box closingM seasonsCM">
                        <div class="je_theme-message-detail">
                            <div class="je_message-num">春</div>
                            <div class="je_message-txt">
                                桜の花が満開になるこの美しい季節に、私たちは新たな門出を迎えます。<br />
                                皆様の温かいご支援により、この特別な日がさらに素晴らしいものとなることを願っております。<br />
                                お忙しい中とは存じますが、ぜひご家族お揃いでご臨席賜りたく、心よりお願い申し上げます。<br />
                                皆様と共にこの喜びのひとときを共有できることを楽しみにしております。
                            </div>
                        </div>
                        <div class="je_theme-message-button">
                            <div class="je_closing-sendBtn">選択</div>
                        </div>
                    </div>
                    <div class="je_theme-message-box closingM seasonsCM">
                        <div class="je_theme-message-detail">
                            <div class="je_message-num">夏</div>
                            <div class="je_message-txt">
                                夏の青空の下、私たちの新しい生活がスタートします。<br />
                                暑い季節ではございますが、皆様と共にこの特別な一日を祝うことができれば幸いです。<br />
                                ご多用のところ恐縮ではございますが、どうぞご家族お揃いでお越しいただきたく、心よりお願い申し上げます。<br />
                                皆様のご臨席を心待ちにしております。
                            </div>
                        </div>
                        <div class="je_theme-message-button">
                            <div class="je_closing-sendBtn">選択</div>
                        </div>
                    </div>
                    <div class="je_theme-message-box closingM seasonsCM">
                        <div class="je_theme-message-detail">
                            <div class="je_message-num">秋</div>
                            <div class="je_message-txt">
                                紅葉が美しく彩るこの季節に、私たちは結婚式を挙げる運びとなりました。<br />
                                実り豊かな秋にふさわしい、心温まるひとときを皆様と共に過ごしたく存じます。<br />
                                ご多忙中とは存じますが、ぜひご臨席賜りますようお願い申し上げます。<br />
                                皆様と共に過ごすこの特別な一日を楽しみにしております。
                            </div>
                        </div>
                        <div class="je_theme-message-button">
                            <div class="je_closing-sendBtn">選択</div>
                        </div>
                    </div>
                    <div class="je_theme-message-box closingM seasonsCM">
                        <div class="je_theme-message-detail">
                            <div class="je_message-num">冬</div>
                            <div class="je_message-txt">
                                冬の澄んだ空気に包まれたこの季節に、私たちは新たな人生のスタートを切ります。<br />
                                寒さ厳しい折ではございますが、皆様の温かいご支援により、この特別な日が一層輝くことを願っております。<br />
                                お忙しい中恐縮ではございますが、ぜひご家族お揃いでご臨席賜りますようお願い申し上げます。<br />
                                皆様と共にこの喜びのひとときを共有できることを心より楽しみにしております。
                            </div>
                        </div>
                        <div class="je_theme-message-button">
                            <div class="je_closing-sendBtn">選択</div>
                        </div>
                    </div>
                    <!-- 정중한 -->
                    <div class="je_theme-message-box closingM politeCM">
                        <div class="je_theme-message-detail">
                            <div class="je_message-num">丁重な1</div>
                            <div class="je_message-txt">
                                拝啓 皆様にはますますご清祥のこととお慶び申し上げます。<br />
                                このたび、私たちは結婚する運びとなりました。<br />
                                これもひとえに、皆様の日頃のご支援とご愛顧の賜物と心より感謝申し上げます。<br />
                                つきましては、ささやかながら結婚式を執り行いたく存じます。<br />
                                ご多忙中とは存じますが、何卒ご臨席賜りますようお願い申し上げます。<br />
                                皆様と共にこの喜びを分かち合えることを心待ちにしております。敬具
                            </div>
                        </div>
                        <div class="je_theme-message-button">
                            <div class="je_closing-sendBtn">選択</div>
                        </div>
                    </div>
                    <div class="je_theme-message-box closingM politeCM">
                        <div class="je_theme-message-detail">
                            <div class="je_message-num">丁重な2</div>
                            <div class="je_message-txt">
                                謹啓 時下ますますご清祥のこととお喜び申し上げます。<br />
                                このたび、私たちは結婚の運びとなりました。<br />
                                これもひとえに、皆様のご厚情のおかげと心より感謝申し上げます。<br />
                                つきましては、ささやかながら結婚式を挙げたく存じます。<br />
                                ご多用中とは存じますが、何卒ご臨席賜りますようお願い申し上げます。<br />
                                皆様と共に新たな門出を祝えることを楽しみにしております。謹白
                            </div>
                        </div>
                        <div class="je_theme-message-button">
                            <div class="je_closing-sendBtn">選択</div>
                        </div>
                    </div>
                    <div class="je_theme-message-box closingM politeCM">
                        <div class="je_theme-message-detail">
                            <div class="je_message-num">丁重な3</div>
                            <div class="je_message-txt">
                                謹啓 皆様には益々ご清栄のこととお慶び申し上げます。<br />
                                このたび、私たちは結婚することとなりました。 <br />
                                これも皆様の日頃のご支援のおかげと深く感謝しております。<br />
                                つきましては、ささやかながら結婚式を執り行いたいと存じます。ご多忙のところ誠に恐縮ではございますが、何卒ご臨席賜りますようお願い申し上げます。<br />
                                皆様と共にこの喜びを分かち合えることを心待ちにしております。謹白
                            </div>
                        </div>
                        <div class="je_theme-message-button">
                            <div class="je_closing-sendBtn">選択</div>
                        </div>
                    </div>
                    <div class="je_theme-message-box closingM politeCM">
                        <div class="je_theme-message-detail">
                            <div class="je_message-num">丁重な4</div>
                            <div class="je_message-txt">
                                拝啓 時下ますますご清祥のこととお慶び申し上げます。<br />
                                このたび、私たちは結婚する運びとなり、ささやかながら結婚式を挙げさせていただくこととなりました。<br />
                                これもひとえに、皆様のご厚情のおかげと深く感謝しております。<br />
                                ご多忙中とは存じますが、ぜひご家族お揃いでご臨席賜りますようお願い申し上げます。<br />
                                皆様と共に新たな門出を祝えることを楽しみにしております。敬具
                            </div>
                        </div>
                        <div class="je_theme-message-button">
                            <div class="je_closing-sendBtn">選択</div>
                        </div>
                    </div>
                    <!-- ユーモラスな -->
                    <div class="je_theme-message-box closingM humorCM">
                        <div class="je_theme-message-detail">
                            <div class="je_message-num">ユーモラスな1</div>
                            <div class="je_message-txt">
                                ついにこの日がやってきました！私たち、結婚します！<br />
                                長い道のりでしたが、ようやくゴールインです。<br />
                                この特別な日を、皆様と共に盛大にお祝いしたいと思います。<br />
                                ご多忙のところ恐縮ですが、ぜひご家族お揃いでご参加ください。楽しいひとときを一緒に過ごしましょう！<br />
                                皆様のご臨席を心よりお待ちしております。
                            </div>
                        </div>
                        <div class="je_theme-message-button">
                            <div class="je_closing-sendBtn">選択</div>
                        </div>
                    </div>
                    <div class="je_theme-message-box closingM humorCM">
                        <div class="je_theme-message-detail">
                            <div class="je_message-num">ユーモラスな2</div>
                            <div class="je_message-txt">
                                なんと、私たち結婚します！お互いによく頑張りました。<br />
                                そんな私たちの晴れの日を、ぜひ皆様に見届けていただきたく結婚式にご招待いたします。<br />
                                ご多忙中とは存じますが、笑いあり涙ありの楽しい時間をお約束しますので、ぜひご参加ください。<br />
                                お待ちしております！
                            </div>
                        </div>
                        <div class="je_theme-message-button">
                            <div class="je_closing-sendBtn">選択</div>
                        </div>
                    </div>
                    <div class="je_theme-message-box closingM humorCM">
                        <div class="je_theme-message-detail">
                            <div class="je_message-num">ユーモラスな3</div>
                            <div class="je_message-txt">
                                遂に結婚します！<br />
                                この特別な日を皆様と共に過ごし、笑顔と感動で満たされた一日にしたいと思います。<br />
                                ご多用のところ恐縮ですが、ぜひご家族お揃いでご臨席賜りますようお願い申し上げます。<br />
                                楽しいイベントも用意しておりますので、お楽しみに！<br />
                                皆様のご臨席を心よりお待ちしております
                            </div>
                        </div>
                        <div class="je_theme-message-button">
                            <div class="je_closing-sendBtn">選択</div>
                        </div>
                    </div>
                    <div class="je_theme-message-box closingM humorCM">
                        <div class="je_theme-message-detail">
                            <div class="je_message-num">ユーモラスな4</div>
                            <div class="je_message-txt">
                                お待たせしました！私たち、結婚します！<br />
                                この素晴らしい日を皆様と共に祝いたく、結婚式にご招待いたします。<br />
                                ご多忙中恐縮ですが、笑いと感動に満ちた時間を一緒に過ごしましょう。<br />
                                ぜひご家族お揃いでお越しください。<br />
                                皆様のご臨席を楽しみにしております。
                            </div>
                        </div>
                        <div class="je_theme-message-button">
                            <div class="je_closing-sendBtn">選択</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</form>
</body>
</html>
