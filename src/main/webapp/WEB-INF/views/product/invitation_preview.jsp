<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>招待状プレビュー2</title>
    <!-- Noto Serif Japanese 폰트 적용 -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Noto+Serif+JP:wght@200..900&display=swap"/>
    <!-- CSS -->
    <link rel="stylesheet" href="resources/product/invitation-preview.css" />
    <link rel="stylesheet" href="resources/product/invitation.css" />
    <!-- JavaScript -->
    <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
    <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBr_INGyCid919lfqYa4VrQ-yYqeLeKX8c&callback=initMap"></script>
    <script src="resources/product/invitation.js" defer></script>
</head>
<body>
<!-- header -->
<div class="je_menu-bar">
    <div id="je_logo">
        <img src="resources/img/en-musubi-logo.png" alt="" />
    </div>
</div>
<!-- content -->
<div id="je_invitation-preview-container">
    <div class="je_page-title">
        <div class="je_page-title-txt">プレビュー</div>
        <div class="je_page-title-line">
            <img src="resources/img/page-title-line.png" alt="" />
        </div>
    </div>
    <div class="je_page-content">
        <div class="je_invitation-container">
            <div class="je_invitation-main">
                <span class="je_main-title">ご招待状</span>
                <div class="je_main-info">신랑이름 AND 신부이름</div>
                <div class="je_main-info">날짜</div>
                <div class="je_main-info">AT 빌딩명</div>
            </div>
            <div class="je_invitation-message">
                <div class="je_couple-img">
                    <img src="resources/img/couple-example.jpg" alt="" />
                </div>
                <div class="je_message-txt">
                    春風が心地よいこの季節、<br />
                    桜が咲き誇る中、<br />
                    皆様と共に私たちの結婚式を迎えられることを<br />
                    心より楽しみにしております。<br />
                    新たな門出を皆様に見守っていただきたく、<br />
                    ぜひご参列賜りますようお願い申し上げます。
                </div>
            </div>
            <div class="je_invitation-couple-info">
                <div>
                    <div class="je_groom">
                        <div class="je_groom-photo-box">
                            <div class="je_photo-box"></div>
                            <div class="je_photo-box-inner"></div>
                        </div>
                        <div class="je_groom-name">
                            <div class="je_name-jp">佐藤 亮</div>
                            <div class="je_name-eng">
                                <p>satou</p>
                                <p>ryo</p>
                            </div>
                        </div>
                    </div>
                    <div class="je_bride">
                        <div class="je_bride-photo-box">
                            <div class="je_photo-box"></div>
                            <div class="je_photo-box-inner"></div>
                        </div>
                        <div class="je_bride-name">
                            <div class="je_name-jp">佐藤 光荊</div>
                            <div class="je_name-eng">
                                <p>satou</p>
                                <p>hikari</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="je_share-photos">
                    <div class="je_share-photos-title">「ギャラリー」</div>
                    <div>
                        <img id="je_view-photo" src="resources/img/couple-example.jpg" alt="" />
                    </div>
                    <ul id="je_share-photos-list">
                        <li><img src="resources/img/couple-example.jpg" alt="" /></li>
                        <li><img src="resources/img/couple-example2.jpg" alt="" /></li>
                        <li><img src="resources/img/couple-example.jpg" alt="" /></li>
                        <li><img src="resources/img/couple-example2.jpg" alt="" /></li>
                        <li><img src="resources/img/couple-example.jpg" alt="" /></li>
                        <li><img src="resources/img/couple-example2.jpg" alt="" /></li>
                        <li><img src="resources/img/couple-example.jpg" alt="" /></li>
                        <li><img src="resources/img/couple-example2.jpg" alt="" /></li>
                        <li><img src="resources/img/couple-example.jpg" alt="" /></li>
                    </ul>
                </div>
            </div>
            <div class="je_invitation-information">
                <div class="je_information-title">ご案内</div>
                <div class="je_information-box">
                    <div class="je_information-wedding">拳式</div>
                    <div class="je_wedding-datetime">
                        <p>2024.09.07 土</p>
                        <p>13:20</p>
                        <p>集合　12:50</p>
                    </div>
                    <div class="je_wedding-place">
                        <p>明治神宮</p>
                        <p>東京都渋谷区代々木神園町1-1</p>
                    </div>
                    <div
                            id="je_wedding-map"
                            data-postcode="1518557"
                            data-address="東京都渋谷区代々木神園町1-1明治神宮"
                    ></div>
                </div>
                <div class="je_information-box">
                    <div class="je_information-reception">披露宴</div>
                    <div class="je_reception-datetime">
                        <p>2024.09.07 土</p>
                        <p>15:30</p>
                        <p>集合　15:00</p>
                    </div>
                    <div class="je_reception-place">
                        <p>明治記念館</p>
                        <p>東京都渋谷区代々木神園町1-1</p>
                    </div>
                    <div
                            id="je_reception-map"
                            data-postcode="151-8557"
                            data-address="東京都渋谷区代々木神園町1-1明治記念館"
                    ></div>
                </div>
            </div>
            <div class="je_message-txt">
                春風が心地よいこの季節、<br />
                桜が咲き誇る中、<br />
                皆様と共に私たちの結婚式を迎えられることを<br />
                心より楽しみにしております。<br />
                新たな門出を皆様に見守っていただきたく、<br />
                ぜひご参列賜りますようお願い申し上げます。
            </div>
        </div>
        <div class="je_buttons">
            <button>修整</button>
            <button>ウィッシュ設定</button>
        </div>
</body>
</html>
