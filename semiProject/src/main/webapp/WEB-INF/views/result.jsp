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
		
		$(document.frm.type).change(function(){
			$('#frm').submit();
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
 		
 		<form method="GET" action="/tm/result.tm" name="frm" id="frm" >
 		 <div class="w3-col w3-padding">
                <label class="w3-col m3 lbl w3-text-gray w3-right-align">성 별 : </label>
                <div class="w3-col m8">
                    <div class="w3-half w3-center">
                        <input type="radio" name="type" id="type" 
                                class="w3-radio rdo" value="type">
                        <label for="type" class="genlbl w3-text-gray">투자성향</label>
                    </div>
                    <div class="w3-half w3-center">
                        <input type="radio" name="type" id="type" class="w3-radio rdo" value="bank">
                        <label for="bank" class="genlbl w3-text-gray">주거래은행</label>
                    </div>
                    <div class="w3-half w3-center">
                        <input type="radio" name="type" id="type" class="w3-radio rdo" value="birth">
                        <label for="birth" class="genlbl w3-text-gray">연령</label>
                    </div>
                </div>
            </div>
 		</form>
 		
		<div class="w3-col">
			<div class="w3-col w3-center">
				<div class="inblock w3-left pdr5" style="width: 100px;"><div class="w3-blue-gray">글번호</div></div>
				<div class="inblock w3-right" style="width: 100px;"><div class="w3-blue-gray">파일</div></div>
				<div class="inblock w3-right pdr5" style="width: 100px;"><div class="w3-blue-gray">작성일</div></div>
				<div class="inblock w3-right pdr5" style="width: 100px;"><div class="w3-blue-gray">작성자</div></div>
				<div class="w3-rest pdr5"><div class="w3-blue-gray">글제목</div></div>
			</div>
<c:if test="${not empty LIST}">
	<c:forEach var="DATA" items="${LIST}">
	
				<div class="inblock w3-left pdr5" style="width: 100px;"><div class="w3-center fbno">0</div>
				<div class="inblock w3-right" style="width: 100px;"><div class="w3-center file">${DATA.PRODUCT_BANK}</div></div>
				<div class="inblock w3-right pdr5" style="width: 100px;"><small class="w3-center wdate">${DATA.PRODUCT_TYPE}</small></div>
				<div class="inblock w3-right pdr5" style="width: 100px;"><div class="w3-center writer">${DATA.JOIN_TARGET}</div></div>
				<div class="w3-rest pdr5">
					<div class="title">${DATA.PRODUCT_NAME}</div>
				  <div class="w3-button w3-blue w3-right" id="chkBtn">check</div>
				</div>
			</div>
		</div>
	</c:forEach>
	
	</c:if> <!-- 리스트가 비어있지 않은 경우 방명록 리스트 조건처리 닫는 태그 -->
<c:if test="${empty LIST}">
			<div class="w3-col w3-border-bottom w3-margin-top">
				<h3 class="w3-center w3-text-gray">* 아직 작성된 글이 없습니다. *</h3>
			</div>
</c:if>
		</div>
 		
 
 	
</body>
</html>
