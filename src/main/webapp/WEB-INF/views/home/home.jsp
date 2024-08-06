<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Home</title>
</head>
<body>
    <h1> Welcome to 縁結び </h1>
<c:if test="${not empty welcomeMessage}">
    <p>${welcomeMessage}</p>
</c:if>
</body>
</html>
