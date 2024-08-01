<%@ page contentType="text/html; charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/template/guest.css">
    <script src="/resources/js/template/guest.js"></script>
</head>
<body>
<form>
    <header class="hw_header">
        <a class="hw_logo" href=""><img src="/resources/img/logo.png" alt=""></a>
        <div class="hw_maker">縁結び</div>
        <a class="hw_mypage" href=""></a>
    </header>
    <div>
        <div class="hw_title"> - guest -</div>
        <div class="hw_titleline"><img src="/resources/img/title.png" alt=""></div>
    </div>
    <div class="hw_content">
        <div class="hw_tab_header">
            <h3 class="hw_tab_title">出席の方</h3>
            <ul class="tab_bnt">
                <li class="hw_tab__item active"><a href="#tabYes">名前順</a></li>
                <li class="hw_tab__item"><a href="#tabYesMale">新郎側</a></li>
                <li class="hw_tab__item"><a href="#tabYesFemale">新婦側</a></li>
            </ul>
        </div>
        <!-- 탭 내용 영역 -->
        <div class="hw_tab_content-wrapper">
            <div id="tabYes" class="hw_tab_content active">
                <div class="styled-table-wrapper">
                    <div class="hw_invitation_title">
                        <span class="hw_invitation_small">名前</span>
                        <span class="hw_invitation_small">ゲスト</span>
                        <span class="hw_invitation_middie">電話番号</span>
                        <span class="hw_invitation_big">メール</span>
                    </div>
                    <%--                <c:forEach var="invitation" items="${invitationsYes}">--%>
                    <%--                    <div class="hw_invitation_content">--%>
                    <%--                        <span class="hw_invitation_small">${invitation.m_name}</span>--%>
                    <%--                        <span class="hw_invitation_small">${invitation.g_guest_type}</span>--%>
                    <%--                        <span class="hw_invitation_middie">${invitation.formattedPhone}</span>--%>
                    <%--                        <span class="hw_invitation_big">${invitation.m_email}</span>--%>
                    <%--                    </div>--%>
                    <%--                </c:forEach>--%>
                </div>
            </div>
            <div id="tabYesMale" class="hw_tab_content">
                <div class="styled-table-wrapper">
                    <div class="hw_invitation_title">
                        <span class="hw_invitation_small">名前</span>
                        <span class="hw_invitation_small">ゲスト</span>
                        <span class="hw_invitation_middie">電話番号</span>
                        <span class="hw_invitation_big">メール</span>
                    </div>
                    <%--                <c:forEach var="invitation" items="${invitationsYesMale}">--%>
                    <%--                    <div class="hw_invitation_content">--%>
                    <%--                        <span class="hw_invitation_small">${invitation.m_name}</span>--%>
                    <%--                        <span class="hw_invitation_small">${invitation.g_guest_type}</span>--%>
                    <%--                        <span class="hw_invitation_middie">${invitation.formattedPhone}</span>--%>
                    <%--                        <span class="hw_invitation_big">${invitation.m_email}</span>--%>
                    <%--                    </div>--%>
                    <%--                </c:forEach>--%>
                </div>
            </div>
            <div id="tabYesFemale" class="hw_tab_content">
                <div class="styled-table-wrapper">
                    <div class="hw_invitation_title">
                        <span class="hw_invitation_small">名前</span>
                        <span class="hw_invitation_small">ゲスト</span>
                        <span class="hw_invitation_middie">電話番号</span>
                        <span class="hw_invitation_big">メール</span>
                    </div>
                    <%--                <c:forEach var="invitation" items="${invitationsYesFemale}">--%>
                    <%--                    <div class="hw_invitation_content">--%>
                    <%--                        <span class="hw_invitation_small">${invitation.m_name}</span>--%>
                    <%--                        <span class="hw_invitation_small">${invitation.g_guest_type}</span>--%>
                    <%--                        <span class="hw_invitation_middie">${invitation.formattedPhone}</span>--%>
                    <%--                        <span class="hw_invitation_big">${invitation.m_email}</span>--%>
                    <%--                    </div>--%>
                    <%--                </c:forEach>--%>
                </div>
            </div>
        </div>
    </div>
    <!-- 출석 특기사항 영역 -->
    <div class="hw_content_detail">
        <div class="hw_tab_header">
            <h3 class="hw_tab_title">出席の方特記事項</h3>
            <button type="button" class="hw_more_button">クリック</button>
        </div>
        <!-- 특기사항 내용 영역 -->
        <div class="hw_detail_wrapper" style="display: none;">
            <div class="styled-table-wrapper">
                <div class="hw_invitation_title">
                    <span class="hw_invitation_small">名前</span>
                    <span class="hw_invitation_middie">同伴人数</span>
                    <span class="hw_invitation_big">アレルギー ・ 要請事項</span>
                </div>
                <%--            <c:forEach var="invitation" items="${invitationsYes}" varStatus="status">--%>

                <%--                <div class="hw_invitation_content">--%>
                <%--                    <span class="hw_invitation_small">${invitation.m_name}</span>--%>
                <%--                    <span class="hw_invitation_middie">大人: ${invitation.p_adult} 子供: ${invitation.p_child} 幼児: ${invitation.p_baby}</span>--%>
                <%--                    <span class="hw_invitation_big"> <c:choose>--%>
                <%--                        <c:when test="${not empty invitation.allergy}">--%>
                <%--                            ${invitation.allergy}・${invitation.g_message}--%>
                <%--                        </c:when>--%>
                <%--                        <c:otherwise>--%>
                <%--                            ${invitation.g_message}--%>
                <%--                        </c:otherwise>--%>
                <%--                    </c:choose>--%>
                <%--									</span>--%>
                <%--                </div>--%>


                <%--            </c:forEach>--%>
            </div>
        </div>
    </div>
    <!-- 결석 탭 영역 -->
    <div class="hw_content_absent">
        <div class="hw_tab_header">
            <h3 class="hw_tab_title">欠席の方</h3>
            <ul class="tab_bnt">
                <li class="hw_tab__item active"><a href="#tabNo">名前順</a></li>
                <li class="hw_tab__item"><a href="#tabNoMale">新郎側</a></li>
                <li class="hw_tab__item"><a href="#tabNoFemale">新婦側</a></li>
            </ul>
        </div>
        <!-- 탭 내용 영역 -->
        <div class="hw_tab_content-wrapper">
            <div id="tabNo" class="hw_tab_content active">
                <div class="styled-table-wrapper">
                    <div class="hw_invitation_title">
                        <span class="hw_invitation_small">名前</span>
                        <span class="hw_invitation_small">ゲスト</span>
                        <span class="hw_invitation_middie">電話番号</span>
                        <span class="hw_invitation_big">メール</span>
                    </div>
                    <%--                <c:forEach var="invitation" items="${invitationsNo}">--%>
                    <%--                    <div class="hw_invitation_content">--%>
                    <%--                        <span class="hw_invitation_small">${invitation.m_name}</span>--%>
                    <%--                        <span class="hw_invitation_small">${invitation.g_guest_type}</span>--%>
                    <%--                        <span class="hw_invitation_middie">${invitation.formattedPhone}</span>--%>
                    <%--                        <span class="hw_invitation_big">${invitation.m_email}</span>--%>
                    <%--                    </div>--%>
                    <%--                </c:forEach>--%>
                </div>
            </div>
            <div id="tabNoMale" class="hw_tab_content">
                <div class="styled-table-wrapper">
                    <div class="hw_invitation_title">
                        <span class="hw_invitation_small">名前</span>
                        <span class="hw_invitation_small">ゲスト</span>
                        <span class="hw_invitation_middie">電話番号</span>
                        <span class="hw_invitation_big">メール</span>
                    </div>
                    <%--                <c:forEach var="invitation" items="${invitationsNoMale}">--%>
                    <%--                    <div class="hw_invitation_content">--%>
                    <%--                        <span class="hw_invitation_small">${invitation.m_name}</span>--%>
                    <%--                        <span class="hw_invitation_small">${invitation.g_guest_type}</span>--%>
                    <%--                        <span class="hw_invitation_middie">${invitation.formattedPhone}</span>--%>
                    <%--                        <span class="hw_invitation_big">${invitation.m_email}</span>--%>
                    <%--                    </div>--%>
                    <%--                </c:forEach>--%>
                </div>
            </div>
            <div class="hw_down_img">
                <div id="tabNoFemale" class="hw_tab_content">
                    <div class="styled-table-wrapper">
                        <div class="hw_invitation_title">
                            <span class="hw_invitation_small">名前</span>
                            <span class="hw_invitation_small">ゲスト</span>
                            <span class="hw_invitation_middie">電話番号</span>
                            <span class="hw_invitation_big">メール</span>
                        </div>
                        <%--                    <c:forEach var="invitation" items="${invitationsNoFemale}">--%>
                        <%--                        <div class="hw_invitation_content">--%>
                        <%--                            <span class="hw_invitation_small">${invitation.m_name}</span>--%>
                        <%--                            <span class="hw_invitation_small">${invitation.g_guest_type}</span>--%>
                        <%--                            <span class="hw_invitation_middie">${invitation.formattedPhone}</span>--%>
                        <%--                            <span class="hw_invitation_big">${invitation.m_email}</span>--%>
                        <%--                        </div>--%>
                        <%--                    </c:forEach>--%>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <a href="#page_top">
        <div class="top_button">
            <img src="invitationPage/imgFolder/top_button.png">
        </div>
    </a>
    </main>
    </div>
</form>
</div>
</body>
</html>