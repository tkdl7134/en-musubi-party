<%@ page contentType="text/html; charset=utf-8" %>
<%@ include file="../menubar.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html style="zoom : 100% !important;" lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <title> ✿ ~ 縁結び ~ ✿ </title>
    <link rel="stylesheet" href="/resources/css/template/allguest.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="/resources/js/template/allguest.js"></script>
</head>
<body>
<form>

    <div class="je_page-title">アンケート</div>
    <div class="hw_container">

        <!-- 필터 입력 필드 -->
        <input type="text" id="filter-input" placeholder="Search">

        <!-- 가로 스크롤 컨테이너 -->
        <div class="hw_scroll-container">
            <!-- 출席 섹션 -->
            <div class="hw_section" id="attend_section">
                <div class="hw_content_title">
                    <button type="button" class="nav-button prev-page" style="visibility:hidden;">
                        <img src="/resources/img/Next.png" style="visibility:hidden;">
                    </button>
                    <div class="hw_content_mini_title">出席</div>
                    <button type="button" class="nav-button next-page">
                        <img src="/resources/img/Next.png">
                    </button>
                </div>
                <div class="hw_content">
                    <ul class="hw_list hw_sub-tabs">
                        <li class="hw_tab-button active" data-tab="attend_all">全体</li>
                        <li class="hw_tab-button" data-tab="attend_groom">新郎</li>
                        <li class="hw_tab-button" data-tab="attend_bride">新婦</li>
                    </ul>

                    <div class="hw_tab-content active" id="attend_all">
                        <c:forEach items="${guestDetailVOList}" var="a">
                            <c:if test="${a.g_attend_wedding == 'ご出席'}">
                                <div class="hw_tab-item" data-type="${a.g_guest_type}">
                                    <div class="guest-info">
                                        <span class="guest-name">名前 : ${a.m_fam_kanji} ${a.m_name_kanji}</span>
                                        <button type="button" class="toggle-details">見る</button>
                                    </div>
                                    <div class="guest-details" style="display: none;">
                                        <span>招待者 : ${a.g_guest_type}</span>
                                        <span>関係 : ${a.g_relation} </span>
                                        <span>番号 : ${a.m_phone}</span>
                                        <span>イーメール : ${a.m_email}</span>
                                    </div>
                                </div>
                            </c:if>
                        </c:forEach>
                    </div>

                    <div class="hw_tab-content" id="attend_groom">
                        <c:forEach items="${guestDetailVOList}" var="a">
                            <c:if test="${a.g_attend_wedding == 'ご出席' && a.g_guest_type == '新郎ゲスト'}">
                                <div class="hw_tab-item" data-type="${a.g_guest_type}">
                                    <div class="guest-info">
                                        <span class="guest-name">名前 : ${a.m_fam_kanji} ${a.m_name_kanji}</span>
                                        <button type="button" class="toggle-details">見る</button>
                                    </div>
                                    <div class="guest-details" style="display: none;">
                                        <span>関係 : ${a.g_relation} </span>
                                        <span>番号 : ${a.m_phone}</span>
                                        <span>イーメール : ${a.m_email}</span>
                                    </div>
                                </div>
                            </c:if>
                        </c:forEach>
                    </div>

                    <div class="hw_tab-content" id="attend_bride">
                        <c:forEach items="${guestDetailVOList}" var="a">
                            <c:if test="${a.g_attend_wedding == 'ご出席' && a.g_guest_type == '新婦ゲスト'}">
                                <div class="hw_tab-item" data-type="${a.g_guest_type}">
                                    <div class="guest-info">
                                        <span class="guest-name">名前 : ${a.m_fam_kanji} ${a.m_name_kanji}</span>
                                        <button type="button" class="toggle-details">見る</button>
                                    </div>
                                    <div class="guest-details" style="display: none;">
                                        <span>関係 : ${a.g_relation} </span>
                                        <span>番号 : ${a.m_phone}</span>
                                        <span>イーメール : ${a.m_email}</span>
                                    </div>
                                </div>
                            </c:if>
                        </c:forEach>
                    </div>
                </div>
            </div>

            <!-- 情報 섹션 -->
            <div class="hw_section" id="info_section">
                <div class="hw_content_title">
                    <button type="button" class="nav-button prev-page">
                        <img src="/resources/img/Next.png" style="transform: rotate(180deg);">
                    </button>
                    <div class="hw_content_mini_title">情報</div>
                    <button type="button" class="nav-button next-page">
                        <img src="/resources/img/Next.png">
                    </button>
                </div>
                <div class="hw_content">
                    <ul class="hw_list hw_sub-tabs">
                        <li class="hw_tab-button active" data-tab="info_all">全体</li>
                        <li class="hw_tab-button" data-tab="info_groom">新郎</li>
                        <li class="hw_tab-button" data-tab="info_bride">新婦</li>
                    </ul>

                    <div class="hw_tab-content active" id="info_all">
                        <c:forEach items="${guestDetailVOList}" var="a">
                            <c:if test="${a.g_attend_wedding == 'ご出席' && a.g_allergy_or == 'Yes'}">
                                <div class="hw_tab-item" data-type="${a.g_guest_type}">
                                    <div class="guest-info">
                                        <span class="guest-name">名前 : ${a.m_fam_kanji} ${a.m_name_kanji}</span>
                                        <button type="button" class="toggle-details">見る</button>
                                    </div>
                                    <div class="guest-details" style="display: none;">
                                        <span>招待者 : ${a.g_guest_type}</span>
                                        <span>동반자 : ${a.p_accompany_num} ${a.p_accompany_type} </span>
                                        <span>알레르기 : ${a.allergy}</span>
                                    </div>
                                </div>
                            </c:if>
                        </c:forEach>
                    </div>

                    <div class="hw_tab-content" id="info_groom">
                        <c:forEach items="${guestDetailVOList}" var="a">
                            <c:if test="${a.g_attend_wedding == 'ご出席' && a.g_guest_type == '新郎ゲスト' && a.g_allergy_or == 'Yes'}">
                                <div class="hw_tab-item" data-type="${a.g_guest_type}">
                                    <div class="guest-info">
                                        <span class="guest-name">名前 : ${a.m_fam_kanji} ${a.m_name_kanji}</span>
                                        <button type="button" class="toggle-details">見る</button>
                                    </div>
                                    <div class="guest-details" style="display: none;">
                                        <span>동반자 : ${a.p_accompany_num} ${a.p_accompany_type} </span>
                                        <span>알레르기 : ${a.allergy}</span>
                                    </div>
                                </div>
                            </c:if>
                        </c:forEach>
                    </div>

                    <div class="hw_tab-content" id="info_bride">
                        <c:forEach items="${guestDetailVOList}" var="a">
                            <c:if test="${a.g_attend_wedding == 'ご出席' && a.g_guest_type == '新婦ゲスト' && a.g_allergy_or == 'Yes'}">
                                <div class="hw_tab-item" data-type="${a.g_guest_type}">
                                    <div class="guest-info">
                                        <span class="guest-name">名前 : ${a.m_fam_kanji} ${a.m_name_kanji}</span>
                                        <button type="button" class="toggle-details">見る</button>
                                    </div>
                                    <div class="guest-details" style="display: none;">
                                        <span>동반자 : ${a.p_accompany_num} ${a.p_accompany_type} </span>
                                        <span>알레르기 : ${a.allergy}</span>
                                    </div>
                                </div>
                            </c:if>
                        </c:forEach>
                    </div>
                </div>
            </div>

            <!-- 欠席 섹션 -->
            <div class="hw_section" id="absent_section">
                <div class="hw_content_title">
                    <button type="button" class="nav-button prev-page">
                        <img src="/resources/img/Next.png" style="transform: rotate(180deg);">
                    </button>
                    <div class="hw_content_mini_title">欠席</div>
                    <button type="button" class="nav-button next-page" style="visibility:hidden;">
                        <img src="/resources/img/Next.png" style="visibility:hidden;">
                    </button>
                </div>
                <div class="hw_content">
                    <ul class="hw_list hw_sub-tabs">
                        <li class="hw_tab-button active" data-tab="absent_all">全体</li>
                        <li class="hw_tab-button" data-tab="absent_groom">新郎</li>
                        <li class="hw_tab-button" data-tab="absent_bride">新婦</li>
                    </ul>

                    <div class="hw_tab-content active" id="absent_all">
                        <c:forEach items="${guestDetailVOList}" var="a">
                            <c:if test="${a.g_attend_wedding == 'ご欠席'}">
                                <div class="hw_tab-item" data-type="${a.g_guest_type}">
                                    <div class="guest-info">
                                        <span class="guest-name">名前 : ${a.m_fam_kanji} ${a.m_name_kanji}</span>
                                        <button type="button" class="toggle-details">見る</button>
                                    </div>
                                    <div class="guest-details" style="display: none;">
                                        <span>招待者 : ${a.g_guest_type}</span>
                                        <span>関係 : ${a.g_relation} </span>
                                        <span>番号 : ${a.m_phone}</span>
                                        <span>イーメール : ${a.m_email}</span>
                                    </div>
                                </div>
                            </c:if>
                        </c:forEach>
                    </div>

                    <div class="hw_tab-content" id="absent_groom">
                        <c:forEach items="${guestDetailVOList}" var="a">
                            <c:if test="${a.g_attend_wedding == 'ご欠席' && a.g_guest_type == '新郎ゲスト'}">
                                <div class="hw_tab-item" data-type="${a.g_guest_type}">
                                    <div class="guest-info">
                                        <span class="guest-name">名前 : ${a.m_fam_kanji} ${a.m_name_kanji}</span>
                                        <button type="button" class="toggle-details">見る</button>
                                    </div>
                                    <div class="guest-details" style="display: none;">
                                        <span>関係 : ${a.g_relation} </span>
                                        <span>番号 : ${a.m_phone}</span>
                                        <span>イーメール : ${a.m_email}</span>
                                    </div>
                                </div>
                            </c:if>
                        </c:forEach>
                    </div>

                    <div class="hw_tab-content" id="absent_bride">
                        <c:forEach items="${guestDetailVOList}" var="a">
                            <c:if test="${a.g_attend_wedding == 'ご欠席' && a.g_guest_type == '新婦ゲスト'}">
                                <div class="hw_tab-item" data-type="${a.g_guest_type}">
                                    <div class="guest-info">
                                        <span class="guest-name">名前 : ${a.m_fam_kanji} ${a.m_name_kanji}</span>
                                        <button type="button" class="toggle-details">見る</button>
                                    </div>
                                    <div class="guest-details" style="display: none;">
                                        <span>関係 : ${a.g_relation} </span>
                                        <span>番号 : ${a.m_phone}</span>
                                        <span>イーメール : ${a.m_email}</span>
                                    </div>
                                </div>
                            </c:if>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="slider-indicators">
        <span class="indicator active"></span>
        <span class="indicator"></span>
        <span class="indicator"></span>
    </div>
</form>
</body>
</html>