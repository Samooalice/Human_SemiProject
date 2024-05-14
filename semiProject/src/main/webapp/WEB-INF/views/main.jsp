<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Son Main</title>
<link rel="stylesheet" type="text/css" href="/css/w3.css">
<link rel="stylesheet" type="text/css" href="/css/user.css">
<script type="text/javascript" src="/js/jquery-3.7.1.min.js"></script>
<style type="text/css">

</style>
<script type="text/javascript">
	$(document).ready(function(){
		$('#tmain').click(function(){
			$(location).attr('href', '/test_main.semi');
		});
	});
</script>
</head>
<body>

	
	<div class="w3-content mxw650 w3-center">
		<h1 class="w3-deep-purple w3-padding w3-card-4">Finance Chat Bot Main</h1>

		<div class="w3-col mgt10">
<!-- 로그인에 성공하면 session에 SID라는 속성으로 아이디를 기억시켜 놓을 것이므로 -->
			<div class="w3-btn w3-small w3-pink w3-left" id="tmain">Test 메인화면 가기</div>
			<div class="w3-btn w3-small w3-amber w3-left" id="gboard">방명록</div>
<c:if test="${not empty SID}">
			<div class="w3-btn w3-small w3-orange w3-right" id="logout">로그아웃</div>
			<div class="w3-btn w3-small w3-light-green w3-left" id="idList"> 회원들 </div>
			<div class="w3-btn w3-small w3-blue w3-left" id="myInfo">myInfo</div>
</c:if>
<c:if test="${empty SID}">
			<div class="w3-btn w3-small w3-blue w3-right" id="join">회원가입</div>
			<div class="w3-btn w3-small w3-green w3-right" id="login">로그인</div>
</c:if>
		</div>
		
		<!-- git 연동 글남김 -->
		<div class="w3-col mgt10">		
			<h1 class="w3-yellow w3-padding">광혁 왔다 감</h1>
			<h1 class="w3-yellow w3-padding">Test</h1>
			<h1 class="w3-yellow w3-padding">Test - response</h1>
			
		</div>
	</div>
</body>
</html>