<%@ page contentType="text/html; charset=utf-8" %>
<%@ include file="../menubar.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html style="zoom : 100% !important;" lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <link rel="icon" type="image/png" href="/img/favicon.png">
    <title> ✿ ~ 縁結び ~ ✿ </title>
    <link rel="stylesheet" href="/css/template/allguest.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="/js/template/allguest.js"></script>
</head>
<body>
<form>

    <div class="je_page-title">アンケート</div>
    <div class="hw_container">

        <input type="text" id="filter-input" placeholder="Search">

        <div class="hw_scroll-container">
            <div class="hw_section" id="attend_section">
                <div class="hw_content_title">
                    <button type="button" class="nav-button prev-page" style="visibility:hidden;">
                        <img src="/img/Next.png" style="visibility:hidden;">
                    </button>
                    <div class="hw_content_mini_title">出席</div>
                    <button type="button" class="nav-button next-page">
                        <img src="/img/Next.png">
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
                                        <span class="guest-name">名前 : ${fn:trim(a.m_fam_kanji)} ${fn:trim(a.m_name_kanji)}</span>
                                        <button type="button" class="toggle-details">見る</button>
                                    </div>
                                    <div class="guest-details" style="display: none;">
                                        <span>招待者 : ${a.g_guest_type}</span>
                                        <span>関係 : ${a.g_relation} </span>
                                        <span>番号 : ${a.m_phone}</span>
                                        <span>メール : ${a.m_email}</span>
                                    </div>
                                </div>
                            </c:if>
                        </c:forEach>
                    </div>

                    <div class="hw_tab-content" id="attend_groom">
                        <c:forEach items="${guestDetailVOList}" var="a">
                            <c:if test="${a.g_attend_wedding == 'ご出席' && a.g_guest_type == '新郎'}">
                                <div class="hw_tab-item" data-type="${a.g_guest_type}">
                                    <div class="guest-info">
                                        <span class="guest-name">名前 : ${fn:trim(a.m_fam_kanji)} ${fn:trim(a.m_name_kanji)}</span>
                                        <button type="button" class="toggle-details">見る</button>
                                    </div>
                                    <div class="guest-details" style="display: none;">
                                        <span>関係 : ${a.g_relation} </span>
                                        <span>番号 : ${a.m_phone}</span>
                                        <span>メール : ${a.m_email}</span>
                                    </div>
                                </div>
                            </c:if>
                        </c:forEach>
                    </div>

                    <div class="hw_tab-content" id="attend_bride">
                        <c:forEach items="${guestDetailVOList}" var="a">
                            <c:if test="${a.g_attend_wedding == 'ご出席' && a.g_guest_type == '新婦'}">
                                <div class="hw_tab-item" data-type="${a.g_guest_type}">
                                    <div class="guest-info">
                                        <span class="guest-name">名前 : ${fn:trim(a.m_fam_kanji)} ${fn:trim(a.m_name_kanji)}</span>
                                        <button type="button" class="toggle-details">見る</button>
                                    </div>
                                    <div class="guest-details" style="display: none;">
                                        <span>関係 : ${a.g_relation} </span>
                                        <span>番号 : ${a.m_phone}</span>
                                        <span>メール : ${a.m_email}</span>
                                    </div>
                                </div>
                            </c:if>
                        </c:forEach>
                    </div>
                </div>
            </div>

            <div class="hw_section" id="info_section">
                <div class="hw_content_title">
                    <button type="button" class="nav-button prev-page">
                        <img src="/img/Next.png" style="transform: rotate(180deg);">
                    </button>
                    <div class="hw_content_mini_title">特別事項</div>
                    <button type="button" class="nav-button next-page">
                        <img src="/img/Next.png">
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
                            <c:if test="${a.g_attend_wedding == 'ご出席' && (a.g_allergy_or == 'Yes' || a.p_accompany_num != null)}">
                                <div class="hw_tab-item" data-type="${a.g_guest_type}">
                                    <div class="guest-info">
                                        <span class="guest-name">名前 : ${fn:trim(a.m_fam_kanji)} ${fn:trim(a.m_name_kanji)}</span>
                                        <button type="button" class="toggle-details">見る</button>
                                    </div>
                                    <div class="guest-details" style="display: none;">
                                        <span>招待者 : ${a.g_guest_type}</span>

                                        <c:set var="adultCount" value="0"/>
                                        <c:set var="childCount" value="0"/>
                                        <c:set var="babyCount" value="0"/>

                                        <c:forEach var="type" items="${a.p_accompany_type}">
                                            <c:choose>
                                                <c:when test="${type == 'ご成年'}">
                                                    <c:set var="adultCount" value="${adultCount + 1}"/>
                                                </c:when>
                                                <c:when test="${type == 'お子様'}">
                                                    <c:set var="childCount" value="${childCount + 1}"/>
                                                </c:when>
                                                <c:when test="${type == '幼子'}">
                                                    <c:set var="babyCount" value="${babyCount + 1}"/>
                                                </c:when>
                                            </c:choose>
                                        </c:forEach>

                                        <c:if test="${adultCount > 0 || childCount > 0 || babyCount > 0 || a.g_allergy_or == 'Yes'}">
                                            <div>
                                                <c:if test="${adultCount > 0 || childCount > 0 || babyCount > 0}">
                                                    <span>同行者 :</span>
                                                    <c:if test="${adultCount > 0}">
                                                        <span>ご成年 ${adultCount}人</span><c:if test="${childCount > 0 || babyCount > 0}">, </c:if>
                                                    </c:if>
                                                    <c:if test="${childCount > 0}">
                                                        <span>お子様 ${childCount}人</span><c:if test="${babyCount > 0}">, </c:if>
                                                    </c:if>
                                                    <c:if test="${babyCount > 0}">
                                                        <span>幼子 ${babyCount}人</span>
                                                    </c:if>
                                                </c:if>

                                                <c:if test="${a.g_allergy_or == 'Yes'}">
                                                    <span>アレルギー : ${a.allergy}</span>
                                                </c:if>
                                            </div>
                                        </c:if>
                                    </div>
                                </div>
                            </c:if>
                        </c:forEach>
                    </div>

                    <div class="hw_tab-content" id="info_groom">
                        <c:forEach items="${guestDetailVOList}" var="a">
                            <c:if test="${a.g_attend_wedding == 'ご出席' && a.g_guest_type == '新郎' && (a.g_allergy_or == 'Yes' || a.p_accompany_num != null)}">
                                <div class="hw_tab-item" data-type="${a.g_guest_type}">
                                    <div class="guest-info">
                                        <span class="guest-name">名前 : ${fn:trim(a.m_fam_kanji)} ${fn:trim(a.m_name_kanji)}</span>
                                        <button type="button" class="toggle-details">見る</button>
                                    </div>
                                    <div class="guest-details" style="display: none;">
                                        <span>招待者 : ${a.g_guest_type}</span>

                                        <c:set var="adultCount" value="0"/>
                                        <c:set var="childCount" value="0"/>
                                        <c:set var="babyCount" value="0"/>

                                        <c:forEach var="type" items="${a.p_accompany_type}">
                                            <c:choose>
                                                <c:when test="${type == 'ご成年'}">
                                                    <c:set var="adultCount" value="${adultCount + 1}"/>
                                                </c:when>
                                                <c:when test="${type == 'お子様'}">
                                                    <c:set var="childCount" value="${childCount + 1}"/>
                                                </c:when>
                                                <c:when test="${type == '幼子'}">
                                                    <c:set var="babyCount" value="${babyCount + 1}"/>
                                                </c:when>
                                            </c:choose>
                                        </c:forEach>

                                        <c:if test="${adultCount > 0 || childCount > 0 || babyCount > 0 || a.g_allergy_or == 'Yes'}">
                                            <div>
                                                <c:if test="${adultCount > 0 || childCount > 0 || babyCount > 0}">
                                                    <span>同行者 :</span>
                                                    <c:if test="${adultCount > 0}">
                                                        <span>ご成年 ${adultCount}人</span><c:if test="${childCount > 0 || babyCount > 0}">, </c:if>
                                                    </c:if>
                                                    <c:if test="${childCount > 0}">
                                                        <span>お子様 ${childCount}人</span><c:if test="${babyCount > 0}">, </c:if>
                                                    </c:if>
                                                    <c:if test="${babyCount > 0}">
                                                        <span>幼子 ${babyCount}人</span>
                                                    </c:if>
                                                </c:if>

                                                <c:if test="${a.g_allergy_or == 'Yes'}">
                                                    <span>アレルギー : ${a.allergy}</span>
                                                </c:if>
                                            </div>
                                        </c:if>
                                    </div>
                                </div>
                            </c:if>
                        </c:forEach>
                    </div>

                    <div class="hw_tab-content" id="info_bride">
                        <c:forEach items="${guestDetailVOList}" var="a">
                            <c:if test="${a.g_attend_wedding == 'ご出席' && a.g_guest_type == '新婦' && (a.g_allergy_or == 'Yes' || a.p_accompany_num != null)}">
                                <div class="hw_tab-item" data-type="${a.g_guest_type}">
                                    <div class="guest-info">
                                        <span class="guest-name">名前 : ${fn:trim(a.m_fam_kanji)} ${fn:trim(a.m_name_kanji)}</span>
                                        <button type="button" class="toggle-details">見る</button>
                                    </div>
                                    <div class="guest-details" style="display: none;">
                                        <span>招待者 : ${a.g_guest_type}</span>

                                        <c:set var="adultCount" value="0"/>
                                        <c:set var="childCount" value="0"/>
                                        <c:set var="babyCount" value="0"/>

                                        <c:forEach var="type" items="${a.p_accompany_type}">
                                            <c:choose>
                                                <c:when test="${type == 'ご成年'}">
                                                    <c:set var="adultCount" value="${adultCount + 1}"/>
                                                </c:when>
                                                <c:when test="${type == 'お子様'}">
                                                    <c:set var="childCount" value="${childCount + 1}"/>
                                                </c:when>
                                                <c:when test="${type == '幼子'}">
                                                    <c:set var="babyCount" value="${babyCount + 1}"/>
                                                </c:when>
                                            </c:choose>
                                        </c:forEach>

                                        <c:if test="${adultCount > 0 || childCount > 0 || babyCount > 0 || a.g_allergy_or == 'Yes'}">
                                            <div>
                                                <c:if test="${adultCount > 0 || childCount > 0 || babyCount > 0}">
                                                    <span>同行者 :</span>
                                                    <c:if test="${adultCount > 0}">
                                                        <span>ご成年 ${adultCount}人</span><c:if test="${childCount > 0 || babyCount > 0}">, </c:if>
                                                    </c:if>
                                                    <c:if test="${childCount > 0}">
                                                        <span>お子様 ${childCount}人</span><c:if test="${babyCount > 0}">, </c:if>
                                                    </c:if>
                                                    <c:if test="${babyCount > 0}">
                                                        <span>幼子 ${babyCount}人</span>
                                                    </c:if>
                                                </c:if>

                                                <c:if test="${a.g_allergy_or == 'Yes'}">
                                                    <span>アレルギー : ${a.allergy}</span>
                                                </c:if>
                                            </div>
                                        </c:if>
                                    </div>
                                </div>
                            </c:if>
                        </c:forEach>
                    </div>

                </div>
            </div>

            <div class="hw_section" id="absent_section">
                <div class="hw_content_title">
                    <button type="button" class="nav-button prev-page">
                        <img src="/img/Next.png" style="transform: rotate(180deg);">
                    </button>
                    <div class="hw_content_mini_title">欠席</div>
                    <button type="button" class="nav-button next-page" style="visibility:hidden;">
                        <img src="/img/Next.png" style="visibility:hidden;">
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
                            <c:if test="${a.g_attend_wedding == 'ご欠席' || a.g_attend_wedding == '保留'}">
                                <div class="hw_tab-item" data-type="${a.g_guest_type}">
                                    <div class="guest-info">
                                        <span class="guest-name">名前 : ${fn:trim(a.m_fam_kanji)} ${fn:trim(a.m_name_kanji)}</span>
                                        <button type="button" class="toggle-details">見る</button>
                                    </div>
                                    <div class="guest-details" style="display: none;">
                                        <span>招待者 : ${a.g_guest_type}</span>
                                        <span>関係 : ${a.g_relation} </span>
                                        <span>番号 : ${a.m_phone}</span>
                                        <span>メール : ${a.m_email}</span>
                                    </div>
                                </div>
                            </c:if>
                        </c:forEach>
                    </div>

                    <div class="hw_tab-content" id="absent_groom">
                        <c:forEach items="${guestDetailVOList}" var="a">
                            <c:if test="${(a.g_attend_wedding == 'ご欠席' || a.g_attend_wedding == '保留') && a.g_guest_type == '新郎'}">
                                <div class="hw_tab-item" data-type="${a.g_guest_type}">
                                    <div class="guest-info">
                                        <span class="guest-name">名前 : ${fn:trim(a.m_fam_kanji)} ${fn:trim(a.m_name_kanji)}</span>
                                        <button type="button" class="toggle-details">見る</button>
                                    </div>
                                    <div class="guest-details" style="display: none;">
                                        <span>関係 : ${a.g_relation} </span>
                                        <span>番号 : ${a.m_phone}</span>
                                        <span>メール : ${a.m_email}</span>
                                    </div>
                                </div>
                            </c:if>
                        </c:forEach>
                    </div>

                    <div class="hw_tab-content" id="absent_bride">
                        <c:forEach items="${guestDetailVOList}" var="a">
                            <c:if test="${(a.g_attend_wedding == 'ご欠席' || a.g_attend_wedding == '保留') && a.g_guest_type == '新婦'}">
                                <div class="hw_tab-item" data-type="${a.g_guest_type}">
                                    <div class="guest-info">
                                        <span class="guest-name">名前 : ${fn:trim(a.m_fam_kanji)} ${fn:trim(a.m_name_kanji)}</span>
                                        <button type="button" class="toggle-details">見る</button>
                                    </div>
                                    <div class="guest-details" style="display: none;">
                                        <span>関係 : ${a.g_relation} </span>
                                        <span>番号 : ${a.m_phone}</span>
                                        <span>メール : ${a.m_email}</span>
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