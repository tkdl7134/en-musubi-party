<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>PW 찾기</title>
</head>
<body>
<h1>PW 찾기</h1>
<form action="/member/findPW" method="post">
    <div>
        <label for="m_id">ID</label>
        <input type="text" id="m_id" name="m_id" required>
    </div>
    <div>
        <label for="m_email">이메일</label>
        <input type="email" id="m_email" name="m_email" required>
    </div>
    <button type="submit">찾기</button>
</form>
<c:if test="${not empty message}">
    <p>${message}</p>
</c:if>
<c:if test="${not empty error}">
    <p>${error}</p>
</c:if>
</body>
</html>
