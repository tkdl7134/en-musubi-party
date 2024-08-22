<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html style="zoom:100% !important;" lang="en">
<head>
    <meta charset="UTF-8">
    <title> ✿ ~ 縁結び ~ ✿ </title>
    <link rel="stylesheet" href="/resources/css/mypage/myInfo.css">
    <script src="/resources/js/mypage/myInfo.js"></script>
</head>
<body>
<div class="myInfo-container">

    <%-- My Info Header --%>
    <div class="myInfo-header">

        <div class="myInfo-header-logo">
            <img src="/resources/img/logo-img.png" alt="myInfo-header-logo">
        </div>

        <p class="myInfo-header-title"> 会員情報 </p>

    </div>

    <div class="myInfo-content">
        <div class="myInfo-blank">

            <%-- プロフィール --%>
            <div class="myInfo-profile">
                <img src="https://firebasestorage.googleapis.com/v0/b/enmusubi-8f0dc.appspot.com/o/upload%2F${member.m_img}?alt=media"
                     alt="myInfo-profile-img"/>
            </div>

            <%-- ID --%>
            <div class="myInfo-info-box">
                <div class="info-label">ID</div>
                <div class="info-value">${member.m_id}</div>
            </div>

            <%-- お名前 --%>
            <div class="myInfo-info-box">

                <%-- 漢字 --%>
                <div class="myInfo-info-box-name-kanji">
                    <div class="myInfo-info-box-name">
                        <div class="info-label">お名前</div>
                        <div class="info-label-small">漢字</div>
                        <div class="info-value-name-kanji">
                            <div class="info-value">${member.m_fam_kanji}</div>
                            <div class="info-value">${member.m_name_kanji}</div>
                        </div>
                    </div>
                </div>

                <%-- フリガナ --%>
                <div class="myInfo-info-box-name-hurigana">
                    <div class="myInfo-info-box-name">
                        <div class="info-label-small">フリガナ</div>
                        <div class="info-value-name-hurigana">
                            <div class="info-value">${member.m_fam_kana}</div>
                            <div class="info-value">${member.m_name_kana}</div>
                        </div>
                    </div>
                </div>

                <%-- ローマ字　--%>
                <div class="myInfo-info-box-name-eng">
                    <div class="myInfo-info-box-name">
                        <div class="info-label-small">ローマ字</div>
                        <div class="info-value-name-eng">
                            <div class="info-value">${member.m_fam_eng}</div>
                            <div class="info-value">${member.m_name_eng}</div>
                        </div>
                    </div>
                </div>

            </div>

            <%-- 性別 --%>
            <div class="myInfo-info-box">
                <div class="info-label">性別</div>
                <div class="info-value">${member.m_gender}</div>
            </div>

            <%-- 生年月日 --%>
            <div class="myInfo-info-box">
                <div class="info-label">生年月日</div>
                <div class="info-value">${member.m_birth}</div>
            </div>

            <%-- 電話番号 --%>
            <div class="myInfo-info-box">
                <div class="info-label">電話番号</div>
                <div class="info-value">${member.m_phone}</div>
            </div>

            <%-- メールアドレス --%>
            <div class="myInfo-info-box">
                <div class="info-label">メールアドレス</div>
                <div class="info-value">${member.m_email}</div>
            </div>

            <%-- ご住所 --%>
            <%-- 郵便番号 --%>
            <div class="myInfo-info-box">
                <div class="info-label">郵便番号</div>
                <div class="info-value">${member.m_zipcode}</div>
            </div>

            <%-- アドレス --%>
            <div class="myInfo-info-box">
                <div class="info-label">ご住所</div>
                <div class="info-value">${member.m_address}</div>
            </div>

        </div>
    </div>

    <%-- 情報修整 --%>
    <form action="/myInfo-update" method="get">
        <input type="hidden" name="m_id" value="${member.m_id}">
        <div class="myInfo-info-update">
            <button type="submit" id="myInfo-info-update">情報修整</button>
        </div>
    </form>

</div>
</body>
</html>
