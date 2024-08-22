<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <link rel="stylesheet" href="finance/css/index.css" />
    <link rel="icon" href="favicon.ico">
    <script src="finance/js/index.js" defer></script>
    
    <title>縁結び</title>
  </head>
  <body style="overflow: hidden">
    <div class="kh-f-whole-container">
    	<div class="kh-upper-line"><img alt="upperLine" src="finance/img/upperline.png" class="kh-line-img"> </div>
    	<div class="kh-lower-line"><img alt="lowerLine" src="finance/img/lowerline.png" class="kh-line-img"> </div>
      <div class="kh-f-container">
      	<!-- <div class="kh-head"> -->
      		<div class="yj-main-s2-logo"><img alt="" src="finance/img/logo.png"> </div>
      		<div class="yj-main-s2-menu"><img alt="" src="finance/img/default_menu.png"> </div>
      	<!-- </div> -->
        <div class="kh-f-content">
          <jsp:include page="${page}"></jsp:include>
        </div>
      </div>
    </div>
  </body>
</html>
