<%@ page contentType="text/html; charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<link rel="stylesheet" href="/css/wishlist/result.css"/>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com/" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+JP:wght@200..900&display=swap" rel="stylesheet">
<div class="kh-f-res-container">
    <%--	<div class="kh-f-res-img-box">--%>
    <%--		<img alt="noImg" src="/img/Resultmsg.png">--%>
    <%--	</div>--%>

    <div class="main-logo-img" onclick="location.href='/main'">
        <img src="/img/logo-img.png" alt="main-logo-img">
    </div>

    <div class="kh-f-res-btn-box">
        <div class="tk_invitation">
            <div class="left-panel">
                <img src="/img/sakura.png">
            </div>
            <div class="tk_invitation-title">
                <span style="color: #EC0000">✿</span>
                <span style="font-weight: bold">縁</br>結</br>び</span>
                <span style="color: #EC0000">✿</span>
            </div>
            <div class="tk_result-outline">
                <div class="tk_result-box">
                    <div class="tk_result-character-circle-line">
                        <img src="/img/EnMusubi-character3.png">
                    </div>
                    <div class="tk_result-text">
                        <div>お手数ではございますが</br>
                            ご出欠情報の登録していただき</br>
                            <span style="color: #EC0000">✿</span>
                            誠にありがとうございます
                            <span style="color: #EC0000">✿</span></br></br>
                            そのうち皆様にお会いできることを</br>
                            楽しみにしております！
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <c:if test="${loginType=='line' }">
            <div>
                <button class="kh-f-btn" onclick="location.href='MemberRegC'">縁結び会員登録</button>
            </div>
        </c:if>
<%--        <div class="kh-f-tex">--%>
<%--            <a href="/">メインに戻る</a>--%>
<%--        </div>--%>
    </div>
        <div class="home-btn" onclick="location.href='/main'">
            <div><img src="/img/home.png" alt=""/></div>
            <div>ホーム</div>
        </div>
</div>
</html>
