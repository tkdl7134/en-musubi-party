<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>ID 검색</title>
</head>
<body>
<h1>ID 검색</h1>
<form action="/member/findID" method="post">
    <div>
        <label for="m_fam_eng">영문 성</label>
        <input type="text" id="m_fam_eng" name="m_fam_eng" required>
    </div>
    <div>
        <label for="m_email">이메일</label>
        <input type="email" id="m_email" name="m_email" required>
    </div>
    <button type="submit">찾기</button>
</form>
<c:if test="${not empty memberID}">
    <p>찾은 ID: ${memberID}</p>
</c:if>
<c:if test="${not empty error}">
    <p>${error}</p>
</c:if>
</body>
</html>
