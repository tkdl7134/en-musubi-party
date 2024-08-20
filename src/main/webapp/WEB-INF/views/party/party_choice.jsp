
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <style>
        .modal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgb(0,0,0);
            background-color: rgba(0,0,0,0.4);
        }
        .modal-content {
            background-color: #fefefe;
            margin: 15% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 50%;
        }
        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }
        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }
    </style>
</head>
<body>

<div class="yr_choice">

<%--    <c:if test="${not empty matchedCouples}">--%>
<%--        <c:forEach items="${matchedCouples}" var="couple">--%>
<%--            <div class="yr_list_choice">--%>
<%--                <div class="yr_list_name_choice">--%>
<%--                        ${couple.person1}와 ${couple.person2}가 매칭되었습니다!--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </c:forEach>--%>
<%--    </c:if>--%>

    <c:if test="${not empty matchedCouples}">
        <c:forEach items="${matchedCouples}" var="couple">
            <c:choose>
                <c:when test="${couple.person1 == 'test1' || couple.person2 == 'test1'}">
                    <div class="yr_list_choice">
                        <div class="yr_list_name_choice">
                                ${couple.person1}와 ${couple.person2}가 매칭되었습니다!
                            <button class="open-modal" data-couple="${couple.person1}" > 라인 id 교환 </button>
                        </div>
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
            <div>
                <label for="lineId">라인 ID : </label>
                <input type="text" id="lineId" name="ep_lineID" required>

            </div>
            <button type="submit">제출</button>
        </form>
    </div>
</div>

<script>
    document.querySelectorAll('.open-modal').forEach(button => {
        button.addEventListener('click', function() {
            document.getElementById('lineIdModal').style.display = 'block';

        });
    });

    document.querySelector('.close').addEventListener('click', function() {
        document.getElementById('lineIdModal').style.display = 'none';
    });


    document.getElementById('lineIdForm').addEventListener('submit', function(event) {
        event.preventDefault();

        const lineId =document.getElementById('lineId').value;
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
                    location.href='/party/main/choice/line';
            })
            .catch(error => {
                console.error('Error:', error);
            });
    });
</script>
</body>
</html>