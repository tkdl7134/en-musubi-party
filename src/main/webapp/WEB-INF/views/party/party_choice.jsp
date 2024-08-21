<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">    <title>Title</title>

    <title>En-Party Choice</title>
    <link rel="preconnect" href="https://fonts.googleapis.com"/>
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin/>
    <link
            href="https://fonts.googleapis.com/css2?family=Noto+Serif+JP:wght@200..900&display=swap"
            rel="stylesheet"
    />
    <link rel="stylesheet" href="/css/party/party_choice.css"/>
</head>
<body>

<header>
    <div class="je_menu-header">
        <div class="je_logo-icon"><img src="/static/img/en-musubi-logo.png" alt="" /></div>
        <div>縁結び</div>
        <div class="je_menu-icon"><img src="/static/img/menu-button.png" alt="" /></div>
    </div>

</header>

<div class="yr_party_choice_container">

    <div class="yr_title">縁パーティー</div>

    <div class="yr_party_wrapper">
        <div class="yr_choice">
            <c:if test="${not empty matchedCouples}">
                <c:forEach items="${matchedCouples}" var="couple">
                    <c:choose>
                        <c:when test="${couple.person1 == 'test1' || couple.person2 == 'test1'}">
                            <div class="yr_list_choice">
                                <div class="yr_list_name_choice">
                                        ${couple.person1}와 ${couple.person2}가 매칭되었습니다!

                                </div>
                                <button class="open-modal" data-couple="${couple.person1}"> 라인 id 교환</button>
                            </div>
                        </c:when>
                    </c:choose>
                </c:forEach>
            </c:if>

            <c:if test="${empty matchedCouples}">
                <div class="yr_choice_mention" style="color: #696969">
                    매칭된 인연이 없습니다. 😢
                </div>
            </c:if>

        </div>


        <!-- 모달 창 HTML -->
        <div id="lineIdModal" class="modal">
            <div class="modal-content">
                <span class="close">&times;</span>
                <h2>라인 ID 교환</h2>
                <form id="lineIdForm">

                    <label for="lineId">라인 ID : </label>
                    <input type="text" id="lineId" name="ep_lineID" required>
                    <button type="submit">제출</button>

                </form>
            </div>
        </div>
    </div>
</div>


<script>
    document.querySelectorAll('.open-modal').forEach(button => {
        button.addEventListener('click', function () {
            document.getElementById('lineIdModal').style.display = 'block';

        });
    });

    document.querySelector('.close').addEventListener('click', function () {
        document.getElementById('lineIdModal').style.display = 'none';
    });


    document.getElementById('lineIdForm').addEventListener('submit', function (event) {
        event.preventDefault();

        const lineId = document.getElementById('lineId').value;
        const formData = {
            ep_lineID: lineId
        };

        fetch('/party/main/choice', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(formData)
        })
            .then(response => response.json())
            .then(data => {
                console.log('Success:', data);
                location.href = '/party/main/choice/line';
            })
            .catch(error => {
                console.error('Error:', error);
            });
    });
</script>
</body>
</html>