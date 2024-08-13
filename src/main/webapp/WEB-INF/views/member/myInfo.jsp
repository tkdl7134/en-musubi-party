<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>회원 정보 확인 및 수정</title>
    <link rel="stylesheet" href="/resources/css/register/register.css">
    <!-- 기타 필요한 CSS 파일 추가 -->
</head>
<body>
<div class="register">
    <h2>회원 정보 확인 및 수정</h2>
    <form action="/myInfo/update" method="post">
        <!-- 한자 성 -->
        <div class="input-group">
            <label for="m_fam_kanji">한자 성:</label>
            <input type="text" id="m_fam_kanji" name="m_fam_kanji" value="${member.m_fam_kanji}" required>
        </div>

        <!-- 한자 이름 -->
        <div class="input-group">
            <label for="m_name_kanji">한자 이름:</label>
            <input type="text" id="m_name_kanji" name="m_name_kanji" value="${member.m_name_kanji}" required>
        </div>

        <!-- 카나 성 -->
        <div class="input-group">
            <label for="m_fam_kana">카나 성:</label>
            <input type="text" id="m_fam_kana" name="m_fam_kana" value="${member.m_fam_kana}" required>
        </div>

        <!-- 카나 이름 -->
        <div class="input-group">
            <label for="m_name_kana">카나 이름:</label>
            <input type="text" id="m_name_kana" name="m_name_kana" value="${member.m_name_kana}" required>
        </div>

        <!-- 영어 성 -->
        <div class="input-group">
            <label for="m_fam_eng">영어 성:</label>
            <input type="text" id="m_fam_eng" name="m_fam_eng" value="${member.m_fam_eng}" required>
        </div>

        <!-- 영어 이름 -->
        <div class="input-group">
            <label for="m_name_eng">영어 이름:</label>
            <input type="text" id="m_name_eng" name="m_name_eng" value="${member.m_name_eng}" required>
        </div>

        <!-- 생년월일 -->
        <div class="input-group">
            <label for="m_birth">생년월일:</label>
            <input type="text" id="m_birth" name="m_birth" value="${member.m_birth}" required>
        </div>

        <!-- 성별 -->
        <div class="input-group">
            <label for="m_gender">성별:</label>
            <input type="text" id="m_gender" name="m_gender" value="${member.m_gender}" required>
        </div>

        <!-- 이메일 -->
        <div class="input-group">
            <label for="m_email">이메일:</label>
            <input type="email" id="m_email" name="m_email" value="${member.m_email}" required>
        </div>

        <!-- 전화번호 -->
        <div class="input-group">
            <label for="m_phone">전화번호:</label>
            <input type="tel" id="m_phone" name="m_phone" value="${member.m_phone}" required>
        </div>

        <!-- 주소 -->
        <div class="input-group">
            <label for="m_address">주소:</label>
            <input type="text" id="m_address" name="m_address" value="${member.m_address}" required>
        </div>

        <!-- 우편번호 -->
        <div class="input-group">
            <label for="m_zipcode">우편번호:</label>
            <input type="text" id="m_zipcode" name="m_zipcode" value="${member.m_zipcode}" required>
        </div>

        <!-- 정보 수정 버튼 -->
        <div class="input-group">
            <button type="submit">정보 수정</button>
        </div>
    </form>
</div>
</body>
</html>