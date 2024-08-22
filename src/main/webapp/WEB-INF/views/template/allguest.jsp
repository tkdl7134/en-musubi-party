<%@ page contentType="text/html; charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html style="zoom : 100% !important;" lang="en">

<head>
    <meta charset="UTF-8">
    <title>✿ ~ 縁結び ~ ✿ </title>
    <link rel="stylesheet" href="/resources/css/template/allguest.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="/resources/js/template/allguest.js"></script>
</head>
<body>
<form>
    <header class="hw_header">
        <div class="menubar"><img src="/resources/img/logo.png" alt=""> <img src="/resources/img/Menu.png" alt=""> </div>
        <div class="hw_maker">アンケート</div>
    </header>

    <div class="hw_container">
        <!-- 필터 입력 필드 -->
        <input type="text" id="filter-input" placeholder="Text">

        <!-- 가로 스크롤 컨테이너 -->
        <div class="hw_scroll-container">
            <!-- 출席 섹션 -->
            <div class="hw_section" id="attend_section">
                <h2>出席</h2>
                <div class="hw_content">
                    <ul class="hw_list hw_sub-tabs">
                        <li class="hw_tab-button active" data-tab="attend_all">全体</li>
                        <li class="hw_tab-button" data-tab="attend_groom">新郎</li>
                        <li class="hw_tab-button" data-tab="attend_bride">新婦</li>
                    </ul>

                    <div class="hw_tab-content active" id="attend_all">
                        <c:forEach items="${allGuestList}" var="a">
                            <c:if test="${a.g_attend_wedding == 'ご出席'}">
                                <div class="hw_tab-item" data-type="${a.g_guest_type}">
                                    <span>이름 : ${a.m_fam_kanji} ${a.m_name_kanji}</span>
                                    <span>유형 : ${a.g_guest_type}</span>
                                    <span>관계 : ${a.g_relation} </span>
                                    <span>번호 : ${a.m_phone}</span>
                                    <span>이메일 : ${a.m_email}</span>
                                </div>
                            </c:if>
                        </c:forEach>
                    </div>

                    <div class="hw_tab-content" id="attend_groom">
                        <c:forEach items="${allGuestList}" var="a">
                            <c:if test="${a.g_attend_wedding == 'ご出席' && a.g_guest_type == '新郎ゲスト'}">
                                <div class="hw_tab-item" data-type="${a.g_guest_type}">
                                    <span>이름 : ${a.m_fam_kanji} ${a.m_name_kanji}</span>
                                    <span>관계 : ${a.g_relation} </span>
                                    <span>번호 : ${a.m_phone}</span>
                                    <span>이메일 : ${a.m_email}</span>
                                </div>
                            </c:if>
                        </c:forEach>
                    </div>

                    <div class="hw_tab-content" id="attend_bride">
                        <c:forEach items="${allGuestList}" var="a">
                            <c:if test="${a.g_attend_wedding == 'ご出席' && a.g_guest_type == '新婦ゲスト'}">
                                <div class="hw_tab-item" data-type="${a.g_guest_type}">
                                    <span>이름 : ${a.m_fam_kanji} ${a.m_name_kanji}</span>
                                    <span>관계 : ${a.g_relation} </span>
                                    <span>번호 : ${a.m_phone}</span>
                                    <span>이메일 : ${a.m_email}</span>
                                </div>
                            </c:if>
                        </c:forEach>
                    </div>
                </div>
            </div>

            <!-- 情報 섹션 -->
            <div class="hw_section" id="info_section">
                <h2>情報</h2>
                <div class="hw_content">
                    <ul class="hw_list hw_sub-tabs">
                        <li class="hw_tab-button active" data-tab="info_all">全体</li>
                        <li class="hw_tab-button" data-tab="info_groom">新郎</li>
                        <li class="hw_tab-button" data-tab="info_bride">新婦</li>
                    </ul>

                    <div class="hw_tab-content active" id="info_all">
                        <c:forEach items="${allGuestList}" var="a">
                            <c:if test="${a.g_attend_wedding == 'ご出席' && a.g_allergy_or == 'Yes'}">
                                <div class="hw_tab-item" data-type="${a.g_guest_type}">
                                    <span>이름 : ${a.m_fam_kanji} ${a.m_name_kanji}</span>
                                    <span>유형 : ${a.g_guest_type}</span>
                                    <span>동반자 : ${a.p_accompany_num} ${a.p_accompany_type} </span>
                                    <span>알레르기 : ${a.allergy}</span>
                                </div>
                            </c:if>
                        </c:forEach>
                    </div>

                    <div class="hw_tab-content" id="info_groom">
                        <c:forEach items="${allGuestList}" var="a">
                            <c:if test="${a.g_attend_wedding == 'ご出席' && a.g_guest_type == '新郎ゲスト' && a.g_allergy_or == 'Yes'}">
                                <div class="hw_tab-item" data-type="${a.g_guest_type}">
                                    <span>이름 : ${a.m_fam_kanji} ${a.m_name_kanji}</span>
                                    <span>동반자 : ${a.p_accompany_num} ${a.p_accompany_type} </span>
                                    <span>알레르기 : ${a.allergy}</span>
                                </div>
                            </c:if>
                        </c:forEach>
                    </div>

                    <div class="hw_tab-content" id="info_bride">
                        <c:forEach items="${allGuestList}" var="a">
                            <c:if test="${a.g_attend_wedding == 'ご出席' && a.g_guest_type == '新婦ゲスト' && a.g_allergy_or == 'Yes'}">
                                <div class="hw_tab-item" data-type="${a.g_guest_type}">
                                    <span>이름 : ${a.m_fam_kanji} ${a.m_name_kanji}</span>
                                    <span>동반자 : ${a.p_accompany_num} ${a.p_accompany_type} </span>
                                    <span>알레르기 : ${a.allergy}</span>
                                </div>
                            </c:if>
                        </c:forEach>
                    </div>
                </div>
            </div>

            <!-- 欠席 섹션 -->
            <div class="hw_section" id="absent_section">
                <h2>欠席</h2>
                <div class="hw_content">
                    <ul class="hw_list hw_sub-tabs">
                        <li class="hw_tab-button active" data-tab="absent_all">全体</li>
                        <li class="hw_tab-button" data-tab="absent_groom">新郎</li>
                        <li class="hw_tab-button" data-tab="absent_bride">新婦</li>
                    </ul>

                    <div class="hw_tab-content active" id="absent_all">
                        <c:forEach items="${allGuestList}" var="a">
                            <c:if test="${a.g_attend_wedding == 'ご欠席'}">
                                <div class="hw_tab-item" data-type="${a.g_guest_type}">
                                    <span>이름 : ${a.m_fam_kanji} ${a.m_name_kanji}</span>
                                    <span>유형 : ${a.g_guest_type}</span>
                                    <span>관계 : ${a.g_relation} </span>
                                    <span>번호 : ${a.m_phone}</span>
                                    <span>이메일 : ${a.m_email}</span>
                                </div>
                            </c:if>
                        </c:forEach>
                    </div>

                    <div class="hw_tab-content" id="absent_groom">
                        <c:forEach items="${allGuestList}" var="a">
                            <c:if test="${a.g_attend_wedding == 'ご欠席' && a.g_guest_type == '新郎ゲスト'}">
                                <div class="hw_tab-item" data-type="${a.g_guest_type}">
                                    <span>이름 : ${a.m_fam_kanji} ${a.m_name_kanji}</span>
                                    <span>관계 : ${a.g_relation} </span>
                                    <span>번호 : ${a.m_phone}</span>
                                    <span>이메일 : ${a.m_email}</span>
                                </div>
                            </c:if>
                        </c:forEach>
                    </div>

                    <div class="hw_tab-content" id="absent_bride">
                        <c:forEach items="${allGuestList}" var="a">
                            <c:if test="${a.g_attend_wedding == 'ご欠席' && a.g_guest_type == '新婦ゲスト'}">
                                <div class="hw_tab-item" data-type="${a.g_guest_type}">
                                    <span>이름 : ${a.m_fam_kanji} ${a.m_name_kanji}</span>
                                    <span>관계 : ${a.g_relation} </span>
                                    <span>번호 : ${a.m_phone}</span>
                                    <span>이메일 : ${a.m_email}</span>
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
