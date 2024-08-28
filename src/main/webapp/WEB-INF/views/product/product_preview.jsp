
<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="../menubar.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <link rel="icon" type="image/png" href="/img/favicon.png">
    <title>✿ ~ 縁結び ~ ✿</title>
    <!-- Noto Serif Japanese 폰트 적용 -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Noto+Serif+JP:wght@200..900&display=swap" rel="stylesheet"/>
    <%--  CSS --%>
    <link rel="stylesheet" href="/css/product/product_preview.css" />
    <%--  JS --%>
    <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>

    <script src="/js/product/product_preview.js"></script>
</head>
<body>
<%--Content--%>
<div id="je_product-preview-container">
<div class="je_page-title">プレビュー</div>
    <div class="je_page-content">
        <div class="je_preview-container">
            <div class="je_preview">
                <div class="je_preview-phone">
                    <img src="/img/iphone-box.png" alt="" />
                    <div id="je_overlay">
                        <div class="je_overlay-txt">
                            1回タッチした後、 <br /> <br>
                            画像をドラッグすると、<br />
                            詳しく見ることができます
                        </div>
                        <div class="scroll-downs">
                            <div class="mousey">
                                <div class="scroller"></div>
                            </div>
                        </div>
                    </div>
                    <div class="je_example_img">
                        <img src="/img/${oneTemplate.t_example}" alt="" />
                    </div>
                </div>
            </div>
            <div
                    class="je_example-closeUp-button"
                    data-target="#layer"
                    data-example="/img/${oneTemplate.t_example}"
                    type="button"
            >
                <img src="/img/zoom-icon.png" alt="" />
                <span>サンプルを大きく表示</span>
            </div>
        </div>
        <div class="je_product-make-button" onclick="location.href='/product/${oneTemplate.t_pk}/make'"><span>制作</span></div>
    </div>

    <!-- change -->
    <div class="je_dim-layer">
        <div class="je_dimBg"></div>
        <div id="je_layer" class="je_pop-layer">
            <div class="je_pop-container">
                <div class="je_pop-conts">
                    <!-- content //-->
                    <div class="je_pop-image">
                        <img src="" alt="" />
                    </div>
                    <!-- db에 저장되어있는 template-img READ -->
                    <img src="" alt="" />
                    <div class="je_btn-r">
                        <a href="#" class="je_btn-layerClose">閉じる</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- change -->
</div>
</body>
</html>
