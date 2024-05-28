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
			$('#frm').attr('action', 'http://58.72.151.124:6004/tm/getResult.tm');
			
			$('#frm').submit();
		});
	

	});
</script>


</head>
<body>
	<form method="POST" id="frm">
		<input type="hidden" name="nowPage" id="nowPage">
	</form>
 	<div class="w3-content mxw650">
 		<h1 class="w3-padding w3-center w3-amber">사용자의 설문 결과를 보여드리겠습니다.</h1>
 		
 		<div class="w3-col w3-margin-bottom">
			<div class="w3-btn w3-small w3-green w3-ripple" id="home">처음으로</div>
<c:if test="${empty ISLOGIN}">
			<div class="w3-btn w3-small w3-orange w3-ripple w3-right" id="logout">로그아웃</div>
</c:if>
		</div>
 		

 		
		<div class="w3-col">
			<div class="w3-col w3-center">
				<div class="inblock w3-left pdr5" style="width: 100px;"><div class="w3-blue-gray">상품번호</div></div>
				<div class="inblock w3-right" style="width: 100px;"><div class="w3-blue-gray">주거래은행</div></div>
				<div class="inblock w3-right pdr5" style="width: 100px;"><div class="w3-blue-gray">상품종류</div></div>
				<div class="inblock w3-right pdr5" style="width: 100px;"><div class="w3-blue-gray">대상연령</div></div>
				<div class="w3-rest pdr5"><div class="w3-blue-gray">상품이름</div></div>
			</div>
<c:if test="${not empty LIST}">
	<c:forEach var="DATA" items="${LIST}">
			<div class="w3-col">
				<div class="inblock w3-left pdr5" style="width: 100px;"><div class="w3-center">${DATA.rno}</div></div>
				<div class="inblock w3-right" style="width: 100px;"><div class="w3-center">${DATA.product_bank}</div></div>
				<div class="inblock w3-right pdr5" style="width: 100px;"><div class="w3-center">${DATA.product_type}</div></div>
				<div class="inblock w3-right pdr5" style="width: 100px;"><div class="w3-center">${DATA.join_target}</div></div>
				<div class="w3-rest pdr5">
					<div class="title">${DATA.product_name}</div>
				</div>
			</div>
	
	</c:forEach>
	
	</c:if> 
<c:if test="${empty LIST}">
			<div class="w3-col w3-border-bottom w3-margin-top">
				<h3 class="w3-center w3-text-gray">* 아직 작성된 글이 없습니다. *</h3>
			</div>
</c:if>
		</div>
 		
		 			
				<div class="w3-col w3-center w3-margin-top">
					<div class="w3-bar w3-border w3-border w3-border-blue w3-round">
		<c:if test="${PAGE.startPage eq 1}">
						<span class="w3-bar-item w3-pale-blue">&laquo;</span>
		</c:if>
		<c:if test="${PAGE.startPage ne 1}">
						<span class="w3-bar-item w3-btn w3-hover-blue pageBtn" 
															id="${PAGE.startPage - 1}">&laquo;</span>
		</c:if>
		<c:forEach var="pno" begin="${PAGE.startPage}" end="${PAGE.endPage}">
			<c:if test="${PAGE.nowPage eq pno}">
						<span class="w3-bar-item w3-btn w3-pink w3-hover-blue pageBtn" 
																		id="${pno}">${pno}</span>
			</c:if>
			<c:if test="${PAGE.nowPage ne pno}">
						<span class="w3-bar-item w3-btn w3-hover-blue pageBtn" 
																		id="${pno}">${pno}</span>
			</c:if>
		</c:forEach>
		<c:if test="${PAGE.endPage ne PAGE.totalPage}">
						<span class="w3-bar-item w3-btn w3-hover-blue pageBtn" 
															id="${PAGE.endPage + 1}">&raquo;</span>
		</c:if>
		<c:if test="${PAGE.endPage eq PAGE.totalPage}">
						<span class="w3-bar-item w3-pale-blue">&raquo;</span>
		</c:if>
					</div>
				</div>
		
				
			</div>
 	
</body>
</html>
