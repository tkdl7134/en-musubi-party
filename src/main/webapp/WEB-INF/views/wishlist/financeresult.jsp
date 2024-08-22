<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="/resources/css/wishlist/result.css" />
<div class="kh-f-res-container">
	<div class="kh-f-res-img-box">
		<img alt="noImg" src="/resources/img/Resultmsg.png">
	</div>
	<div class="kh-f-res-btn-box">
		<c:if test="${loginType=='line' }">
			<div>
				<button class="kh-f-btn" onclick="location.href='MemberRegC'">縁結び会員登録</button>
			</div>
		</c:if>
		<div class="kh-f-tex">
			<a href="/">メインに戻る</a>
		</div>
	</div>
</div>
</html>
