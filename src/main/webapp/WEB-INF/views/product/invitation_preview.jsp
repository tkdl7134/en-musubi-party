<%@ page contentType="text/html; charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <link rel="stylesheet" href="/resources/css/product/invitation_preview.css" />
    <link rel="stylesheet" href="/resources/css/product/invitation.css" />
    <!-- JavaScript -->
    <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
    <script async defer src="https://maps.googleapis.com/maps/api/js?key=${googleMapApiKey}&callback=initMap"></script>
    <script src="/resources/js/product/invitation.js" defer></script>
</head>
<body>
<!-- header -->
<div class="je_menu-bar">
    <div id="je_logo">
        <img src="/resources/img/en-musubi-logo.png" alt="" />
    </div>
</div>
<!-- content -->
<div id="je_invitation-preview-container">
    <div class="je_page-title">
        <div class="je_page-title-txt">プレビュー</div>
        <div class="je_page-title-line">
            <img src="/resources/img/page-title-line.png" alt="" />
        </div>
    </div>
    <div class="je_page-content">

        <div class="je_invitation-container">
            <div class="je_invitation-main">
                <span class="je_main-title">ご招待状</span>
                <div class="je_main-info">${weddingInfo.w_name_jp_groom} AND ${weddingInfo.w_name_jp_bride}</div>
                <div class="je_main-info">${weddingInfo.w_date}</div>
                <div class="je_main-info">AT ${weddingInfo.w_wedding_building}</div>
            </div>
            <div class="je_invitation-message">
                <div class="je_couple-img">
                    <img src="https://firebasestorage.googleapis.com/v0/b/enmusubi-8f0dc.appspot.com/o/upload%2F${weddingInfo.w_img1}?alt=media" alt="" />
                </div>
                <div class="je_message-txt">
                    ${weddingInfo.w_message_invite}
                </div>
            </div>
            <div class="je_invitation-couple-info">
                <div>
                    <div class="je_groom">
                        <div class="je_groom-photo-box">
                            <div class="je_photo-box">
                                <img src="https://firebasestorage.googleapis.com/v0/b/enmusubi-8f0dc.appspot.com/o/upload%2F${weddingInfo.w_img2}?alt=media" alt="" /></div>
                            <div class="je_photo-box-inner"></div>
                        </div>
                        <div class="je_groom-name">
                            <div class="je_name-jp">${weddingInfo.w_fam_jp_groom} ${weddingInfo.w_name_jp_groom}</div>
                            <div class="je_name-eng">
                                <p>${weddingInfo.w_fam_eng_groom}</p>
                                <p>${weddingInfo.w_name_eng_groom}</p>
                            </div>
                        </div>
                    </div>
                    <div class="je_bride">
                        <div class="je_bride-photo-box">
                            <div class="je_photo-box">
                                <img src="https://firebasestorage.googleapis.com/v0/b/enmusubi-8f0dc.appspot.com/o/upload%2F${weddingInfo.w_img3}?alt=media" alt="" /></div>
                            <div class="je_photo-box-inner"></div>
                        </div>
                        <div class="je_bride-name">
                            <div class="je_name-jp">${weddingInfo.w_fam_jp_bride} ${weddingInfo.w_name_jp_bride}</div>
                            <div class="je_name-eng">
                                <p>${weddingInfo.w_fam_eng_bride}</p>
                                <p>${weddingInfo.w_name_eng_bride}</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="je_share-photos">
                    <div class="je_share-photos-title">「ギャラリー」</div>
                    <div>
                        <img id="je_view-photo" src="https://firebasestorage.googleapis.com/v0/b/enmusubi-8f0dc.appspot.com/o/upload%2F${viewImg}?alt=media" alt="" />
                    </div>
                    <ul id="je_share-photos-list">
                    <c:forEach var="s" items="${ShareImg}">
                        <li><img src="https://firebasestorage.googleapis.com/v0/b/enmusubi-8f0dc.appspot.com/o/upload%2F${s}?alt=media" alt="" /></li>
                    </c:forEach>
                    </ul>
                </div>
            </div>
            <div class="je_invitation-information">
                <div class="je_information-title">ご案内</div>
                <div class="je_information-box">
                    <div class="je_information-wedding">拳式</div>
                    <div class="je_wedding-datetime">
                        <p>${weddingInfo.w_date}</p>
                        <p>${weddingInfo.w_wedding_time}</p>
                        <p>集合　${weddingInfo.w_wedding_assemble}</p>
                    </div>
                    <div class="je_wedding-place">
                        <p>${weddingInfo.w_wedding_building}</p>
                        <p>${weddingInfo.w_wedding_address}</p>
                    </div>
                    <div
                            id="je_wedding-map"
                            data-postcode="${weddingInfo.w_wedding_postcode}"
                            data-address="${weddingInfo.w_wedding_address}"
                    ></div>
                </div>
                <div class="je_information-box">
                    <div class="je_information-reception">披露宴</div>
                    <div class="je_reception-datetime">
                        <p>${weddingInfo.w_date}</p>
                        <p>${weddingInfo.w_reception_time}</p>
                        <p>集合　${weddingInfo.w_reception_assemble}</p>
                    </div>
                    <div class="je_reception-place">
                        <p>${weddingInfo.w_reception_building}</p>
                        <p>${weddingInfo.w_reception_address}</p>
                    </div>
                    <div
                            id="je_reception-map"
                            data-postcode="${weddingInfo.w_reception_postcode}"
                            data-address="${weddingInfo.w_reception_address}"
                    ></div>
                </div>
            </div>
            <div class="je_message-txt">
                ${weddingInfo.w_message_bye}
            </div>
        </div>

        <div class="je_buttons">
            <button onclick="">修整</button>
            <button onclick="location.href='/${weddingInfo.e_no}/wishlist-setting'">ウィッシュ設定</button>

        </div>
</body>
</html>
