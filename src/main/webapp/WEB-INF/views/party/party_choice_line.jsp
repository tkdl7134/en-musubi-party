<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <title>Title</title>
    <style>
        * {
            font-family: "Noto Serif JP", serif;
            font-optical-sizing: auto;
            font-style: normal;
            margin: 0;
            padding: 0;
        }

        body {
            background-image: url("/img/Paper_BG.png");
            overflow-y: auto;
        }

        /* 메뉴 - 헤더 */
        .je_menu-header {
            width: 100%;
            height: 3.125rem;
            background-color: #ffffff;
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 7.5rem;
            font-size: 20px;
            font-weight: 600;
            color: #2e2e2e;
        }

        .je_logo-icon,
        .je_menu-icon {
            width: 1.8rem;

            img {
                width: 100%;
            }
        }

        .yr_party_choice_container {
            display: flex;
            flex-direction: column;
            width: 100vw;
        }
        .yr_title {
            font-size: 14px;
            font-weight: 900;
            height: 2.5rem;
            width: 100%;
            background-color: #FFDBDB;
            color: #FF494C;
            text-align: center;
            align-content: center;
        }
    </style>
</head>
<body>
<header>
    <div class="je_menu-header">
        <div class="je_logo-icon"><img src="/img/en-musubi-logo.png" alt=""/></div>
        <div>縁結び</div>
        <div class="je_menu-icon"><img src="/img/menu-button.png" alt=""/></div>
    </div>

</header>

<div class="yr_party_choice_container">

    <div class="yr_title">✿ ~ 縁結び ~ 縁パーティー ~ ✿</div>

    <c:forEach items="${partnerLineId}" var="line">
        <div> ${line.ep_lineID}</div>
    </c:forEach>
</div>
</body>
</html>