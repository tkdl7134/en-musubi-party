
<%@ page contentType="text/html; charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="resources/css/test.css">
    <script src="resources/js/test.js"></script>
</head>
<body>
    <c:forEach var="t" items="${tests}">
        <div>${t} / ${t.no}</div>

    </c:forEach>


</body>
</html>