<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html style="zoom:100% !important;" lang="en">
<head>
    <meta charset="UTF-8">
    <title> ✿ ~ 縁結び ~ ✿ </title>
    <link rel="stylesheet" href="/resources/css/mypage/myInfoUpdate.css">
    <script defer src="/resources/js/mypage/myInfoUpdate.js"></script>
</head>
<body>
<div class="myInfoUpdate-container">

    <%-- My Info Update Header --%>
    <div class="myInfoUpdate-header">
        <div class="myInfoUpdate-header-logo">
            <img src="/resources/img/logo-img.png" alt="myInfoUpdate-header-logo">
        </div>
        <p class="myInfoUpdate-header-title">会員情報</p>
    </div>

    <%-- My Info Update Form --%>
    <div class="myInfoUpdate-content">


        <form action="/myInfo-update" method="post" enctype="multipart/form-data">
            <div class="myInfoUpdate-cover">

                <%-- プロフィール --%>
<%--                <div class="myInfoUpdate-profile">--%>
<%--                    <img src="https://firebasestorage.googleapis.com/v0/b/enmusubi-8f0dc.appspot.com/o/upload%2F${member.m_img}?alt=media"--%>
<%--                         alt="myInfoUpdate-profile-img"/>--%>
<%--                    <input type="hidden" id="m_img" name="oldProfile" value="${member.m_img}">--%>
<%--                    <input type="file" id="newProfile" name="newProfile">--%>
<%--                </div>--%>

                    <div class="myInfoUpdate-profile-container" id="myInfoUpdate-profile-container">
                        <input
                                type="file"
                                name="newProfile"
                                id="newProfile"
                                onchange="readURL(this);"
                                oninput="return photoType1()"
                        />
                        <input type="hidden" id="oldProfile" name="oldProfile" value="${member.m_img}">
                        <div id="myInfoUpdate-profile">
                            <img src="https://firebasestorage.googleapis.com/v0/b/enmusubi-8f0dc.appspot.com/o/upload%2F${member.m_img}?alt=media"
                                 alt="myInfoUpdate-profile-img"/>
                        </div>
                    </div>





                <%-- ID --%>
                <div class="myInfo-info-box">
                    <div class="info-label">ID</div>
                    <div class="info-value-read">${member.m_id}</div>
                    <input type="hidden" name="m_id" value="${member.m_id}">
                </div>

                <%-- PW (Hidden) --%>
                <input type="hidden" id="m_pw" name="m_pw" value="${member.m_pw}">

                <%-- お名前 (Name in various forms) --%>
                <div class="myInfoUpdate-info-box">
                    <%-- 漢字 --%>
                    <div class="myInfoUpdate-info-box-name-kanji">
                        <label for="m_fam_kanji" class="info-label-small">お名前 (漢字)</label>
                        <div class="info-value-name-kanji">
                            <input type="text" id="m_fam_kanji" name="m_fam_kanji" class="info-value"
                                   value="${member.m_fam_kanji}" required>
                            <input type="text" id="m_name_kanji" name="m_name_kanji" class="info-value"
                                   value="${member.m_name_kanji}" required>
                        </div>
                    </div>
                    <%-- フリガナ --%>
                    <div class="myInfoUpdate-info-box-name-hurigana">
                        <label for="m_fam_kana" class="info-label-small">フリガナ</label>
                        <div class="info-value-name-hurigana">
                            <input type="text" id="m_fam_kana" name="m_fam_kana" class="info-value"
                                   value="${member.m_fam_kana}" required>
                            <input type="text" id="m_name_kana" name="m_name_kana" class="info-value"
                                   value="${member.m_name_kana}" required>
                        </div>
                    </div>
                    <%-- ローマ字 --%>
                    <div class="myInfoUpdate-info-box-name-eng">
                        <label for="m_fam_eng" class="info-label-small">ローマ字</label>
                        <div class="info-value-name-eng">
                            <input type="text" id="m_fam_eng" name="m_fam_eng" class="info-value"
                                   value="${member.m_fam_eng}" required>
                            <input type="text" id="m_name_eng" name="m_name_eng" class="info-value"
                                   value="${member.m_name_eng}" required>
                        </div>
                    </div>
                </div>

                <%-- 性別 --%>
                <div class="myInfo-info-box">
                    <div class="info-label">性別</div>
                    <div class="info-value-read">${member.m_gender}</div>
                </div>

                <%-- 生年月日 --%>
                <div class="myInfo-info-box">
                    <div class="info-label">生年月日</div>
                    <div class="info-value-read">${member.m_birth}</div>
                </div>

                <%-- 電話番号 (Phone Number) --%>
                <div class="myInfoUpdate-info-box">
                    <label for="m_phone" class="info-label">電話番号</label>
                    <input type="tel" id="m_phone" name="m_phone" class="info-value" value="${member.m_phone}" required>
                </div>

                <%-- メールアドレス --%>
                <div class="myInfo-info-box">
                    <div class="info-label">メールアドレス</div>
                    <div class="info-value-read">${member.m_email}</div>
                </div>

                <%-- 郵便番号 (Zipcode) --%>
                <div class="myInfoUpdate-info-box">
                    <label for="m_zipcode" class="info-label">郵便番号</label>
                    <input type="text" id="m_zipcode" name="m_zipcode" class="info-value" value="${member.m_zipcode}"
                           required>
                </div>

                <%-- ご住所 (Address) --%>
                <div class="myInfoUpdate-info-box">
                    <label for="m_address" class="info-label">ご住所</label>
                    <input type="text" id="m_address" name="m_address" class="info-value" value="${member.m_address}"
                           required>
                </div>


                <%-- 情報修整ボタン (Submit Button) --%>
                <div class="myInfoUpdate-info-update">
                    <button type="submit" id="myInfoUpdate-info-update">情報修整</button>
                </div>

                <%-- アカウント削除ボタン (Delete Account Button) --%>
                <div class="myInfoUpdate-info-update">
                    <div class="myInfoUpdate-info-delete">삭제원하시는 분은 여기로</div>
                    <div class="myInfoUpdate-info-delete-button">
                        <button onclick="deleteCheck('${member.m_id}')">削除</button>
                    </div>
                </div>
            </div>
        </form>

    </div>

</div>
</body>
</html>