<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>ResultView</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="/tm/css/w3.css">
<link rel="stylesheet" type="text/css" href="/tm/css/user.css">
<script type="text/javascript" src="/tm/js/jquery-3.7.1.min.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style>
	body,h1,h2,h3,h4,h5 {font-family: "Poppins", sans-serif}
	body {font-size: 16px;}
	img {margin-bottom: -8px;}
	.mySlides {display: none;}
</style>

<script type="text/javascript">
	$(document).ready(function(){
		$('#home').click(function(){
			$(location).attr('href', 'http://58.72.151.124:6003/tm/');
		});
	});
</script>


</head>
<body>
 	<div class="w3-content mxw650">
 		<h1 class="w3-padding w3-center w3-amber">사용자의 설문 결과를 보여드리겠습니다.</h1>
 		
 		<div class="w3-col w3-margin-bottom">
			<div class="w3-btn w3-small w3-green w3-ripple" id="home">처음으로</div>
<c:if test="${empty ISLOGIN}">
			<div class="w3-btn w3-small w3-orange w3-ripple w3-right" id="logout">로그아웃</div>
</c:if>
		</div>
 		
 		
 	</div>
 	
</body>
</html>
