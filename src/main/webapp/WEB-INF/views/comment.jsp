<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/comment.css">
</head>
<body>
<div class="yr_comment_container">
    <div class="yr_comment_title"><span>GUEST BOOK</span><br><span>ゲストブック</span></div>
    <c:forEach items="${comment}" var="c">
        <div class="yr_comment_item" data-id="${c.c_no}">
            <input class="event_no" name="e_no" value="${c.e_no}" type="hidden">
            <input type="hidden" name="_method" value="delete">
            <div class="comment_top">
                <div class="comment_writer"> ${c.c_writer}</div>
                <div class="yr_comment_delete">
                    <button type="button" class="delete-btn" data-id="${c.c_no}">X</button>
                </div>
            </div>
            <div class="comment_date"><fmt:formatDate value="${c.c_date}" pattern="yyyy-MM-dd"/></div>
            <div class="comment_content">${c.c_content}</div>
            <div class="comment_writer_type">${c.c_type}</div>
        </div>
    </c:forEach>

    <div class="yr_modal">
        <div class="yr_comment_modal" id="openModalBtn">作成する</div>
    </div>

    <div id="myModal" class="modal">
        <div class="modal-content">
            <span class="close">&times;</span>
            <form action="event-comment" method="post">
                <div class="yr_comment_insert_wrapper">
                    <div class="yr_comment_insert">
                        <div class="yr_comment_insert_writer"><input name="c_writer" placeholder="作成者"></div>
                        <div class="yr_comment_insert_content"><input name="c_content" placeholder="内容"></div>
                        <div class="yr_comment_insert_type">
                            <label>
                                <input name="c_type" type="radio" value="新郎側">新郎側
                            </label>
                            <label>
                                <input name="c_type" type="radio" value="新婦側">新婦側
                            </label>
                        </div>
                    </div>
                    <div class="yr_comment_insert_button">
                        <button id="yr_comment_button" type="submit">登録</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<script src="/resources/js/comment.js"></script>
</body>
</html>