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
			$(location).attr('href', 'http://58.72.151.124:6004/tm/');
		});
		
		$('.pageBtn').click(function(){
			var nowPage = $(this).attr('id');
			$('#nowPage').val(nowPage);
			$('#frm').attr('action', 'http://58.72.151.124:6004/tm/getResult.tm')
			$('#frm').submit();
		});
	

	});
</script>


</head>
<body>
	<form method="POST" id="frm">
		<input type="hidden" name="nowPage" id="nowPage">
		<input type="hidden" name="birth" id="birth" value="${DATA.birth }">
		<input type="hidden" name="main_bank" id="main_bank" value="${DATA.main_bank}">
		<input type="hidden" name="interest_type" id="interest_type" value="${DATA.interest_type}">
	</form>
 	<div class="w3-content mxw650" style="margin-top:75px;'">
 		<h1 class="w3-padding w3-center w3-green">고객님을 위한 추천상품 목록</h1>
 		
 		<div class="w3-col w3-margin-bottom">
			<div class="w3-btn w3-small w3-black w3-right w3-ripple" id="home"> <i class="fa fa-paper-plane"></i> 메인으로</div>
<c:if test="${empty ISLOGIN}">
			<div class="w3-btn w3-small w3-black w3-ripple w3-right" style="margin-right:5px;" id="logout"><i class="fa fa-sign-out"></i> 로그아웃</div>
</c:if>
		</div>
 		

		
		<div class="w3-col w3-center">
<c:if test="${not empty LIST}">
	<c:forEach var="DATA" items="${LIST}">
		<div class="inblock w3-margin-bottom" style="width:310px; height:300px;">
			<div class="w3-col">
			  	<ul class="w3-border w3-center w3-hover-shadow" style="width:310px; height:300px;list-style-type: none; padding-left: 0px;">
			    	<li class="w3-xlarge w3-padding-32 ${DATA.w3color}">${DATA.product_bank}</li>
			    	<li class="w3-padding-16 pdh20"><b class="w3-col m5 w3-light-align">상품 종류 : </b><div class="w3-col m6 w3-center">${DATA.product_type}</div></li>
			    	<li class="w3-padding-16 pdh20"><b class="w3-col m5 w3-light-align">대상 연령 : </b><div class="w3-col m6 w3-center"> ${DATA.join_target}</li>
			    	<li class="w3-padding-16 pdh20 w3-padding">
			      		<h2 class="w3-wide w3-padding" style="font-size: 15px;"><b>${DATA.product_name}</b></h2>
			    	</li>
				</ul>
					
    			
			</div>
</div>
	</c:forEach>
		</div>
	
	</c:if> 
<c:if test="${empty LIST}">
			<div class="w3-col w3-border-bottom w3-margin-top">
				<h3 class="w3-center w3-text-gray">* 아직 조건에 맞는 상품이 없습니다. *</h3>
			</div>
</c:if>
		</div>
 		
		 			
				<div class="w3-col w3-center" style="margin-top:50px;">
					<div class="w3-bar w3-border w3-border w3-border-green w3-round">
		<c:if test="${PAGE.startPage eq 1}">
						<span class="w3-bar-item w3-pale-green">&laquo;</span>
		</c:if>
		<c:if test="${PAGE.startPage ne 1}">
						<span class="w3-bar-item w3-btn w3-hover-gray pageBtn" 
															id="${PAGE.startPage - 1}">&laquo;</span>
		</c:if>
		<c:forEach var="pno" begin="${PAGE.startPage}" end="${PAGE.endPage}">
			<c:if test="${PAGE.nowPage eq pno}">
						<span class="w3-bar-item w3-btn w3-green w3-hover-gray pageBtn" 
																		id="${pno}">${pno}</span>
			</c:if>
			<c:if test="${PAGE.nowPage ne pno}">
						<span class="w3-bar-item w3-btn w3-hover-gray pageBtn" 
																		id="${pno}">${pno}</span>
			</c:if>
		</c:forEach>
		<c:if test="${PAGE.endPage ne PAGE.totalPage}">
						<span class="w3-bar-item w3-btn w3-hover-gray pageBtn" 
															id="${PAGE.endPage + 1}">&raquo;</span>
		</c:if>
		<c:if test="${PAGE.endPage eq PAGE.totalPage}">
						<span class="w3-bar-item w3-pale-green">&raquo;</span>
		</c:if>
					</div>
				</div>
		
				
			</div>
 	
</body>
</html>
