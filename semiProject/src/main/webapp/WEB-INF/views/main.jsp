<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Test_main</title>
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
		$('#login').click(function(){
			$(location).attr('href', '/tm/login.tm');
		});
		
		$('#logout').click(function(){
			$(location).attr('href', '/tm/logoutProc.tm');
		});
		
		$('#edit').click(function(){
			$(location).attr('href','/tm/edit.tm');
		});

		$('#chat').click(function(){
			$(location).attr('href', 'http://pf.kakao.com/_xbwxixcG/chat');
		});
		
		$('#link1').click(function(){
			$(location).attr('href', 'http://pf.kakao.com/_xbzjxcG/chat');
		});
	});
	
</script>


</head>
<body>
<!-- Header with Slideshow -->
<header class="w3-display-container w3-center">
  <button class="w3-button w3-block w3-green w3-hide-large w3-hide-medium" onclick="document.getElementById('download').style.display='block'">Download </button>
  <div class="mySlides w3-animate-opacity">
    <img class="w3-image" src="/tm/image/mainview/main8.jpg" alt="Image 1" style="min-width:500px" width="1500" height="1000">
    <div class="w3-display-left w3-padding w3-hide-small" style="width:35%">
    
<c:if test="${empty SID}">
      <div class="w3-black w3-opacity w3-hover-opacity-off w3-padding-large w3-round-large">
        <h1 class="w3-xlarge">Login</h1>
        <hr class="w3-opacity">
			
        
					<p><button id="login" class="w3-button w3-block w3-green w3-round w3-margin-right">로그인</button></p>
	        		
	        </div>     
      </div>
</c:if>
    
<c:if test="${not empty SID}">
      <div class="w3-black w3-opacity w3-hover-opacity-off w3-padding-large w3-round-large">
	      <h1 class="w3-xlarge">[ ${SID} ]님 환영합니다!</h1>
	      <hr class="w3-opacity">
	      <div class="w3-container w3-padding w3-margin-top w3-round-large w3-card-4 pdh30">
	      	<div><button id="chat" class="w3-button w3-block w3-green w3-round w3-margin-bottom">채팅시작</button></div>
	      	<div><button id="edit" class="w3-button w3-block w3-green w3-round w3-margin-bottom">정보수정</button></div>
	      	<div><button id="logout" class="w3-button w3-block w3-green w3-round">로그아웃</button></div> 
	      </div>      
      </div>
</c:if>

    </div>
  </div>

</header>

<!-- 대체뭐니 설명 섹션 -->
<div class="w3-padding-64 w3-light-gray">
  <div class="w3-row-padding">
    <div class="w3-col l8 m6">
      <h1 class="w3-jumbo"><b>That's Money</b></h1>
      <h1 class="w3-xxxlarge w3-text-green"><b>대체 뭐니?</b></h1>
      <span class="w3-xlarge">현대인의 든든한 자산관리 친구! 대체 뭐니?(That's Money!)</span>
      <p>현대 사회에서 자산 관리는 더 이상 선택이 아닌 필수입니다. 
		하지만 바쁜 일상 속에서 최신 금융 소식을 따라잡고, 이를 바탕으로 
		자산 관리를 체계적으로 하는 것은 결코 쉬운 일이 아닙니다. 
		그래서 대체 뭐니?(That's Money!)는 여러분의 자산 관리를 돕기 위해 
		키워드 기반 금융상품 소개 서비스를 제공합니다.
      </p>
      <span class="w3-xlarge">대체 뭐니?(That's Money!)란?</span>
      <p>대체 뭐니?(That's Money!)는 최신 금융 상품을 손쉽게 얻고 활용할 수 있도록 설계되었습니다. 
		 대체 뭐니?(That's Money!)봇과의 키워드 중심 대화를 통해 여러분의 투자성향과 최신 트렌드를 융합하여
		 바쁜 현대인들도 손쉽게 자산을 관리할 수 있습니다.</p>
		
	  <span class="w3-xlarge w3-text-green">[주요기능]</span>
		<p>* 맞춤형 금융상품 제공</p>
		<pre>- 사용자가 설정한 키워드를 기반으로 최신 예/적금 상품을 큐레이션하여 제공
- 관심분야에 따른 투자 Tip등을 간단하게 확인</pre>
		
		<p>* 실시간 업데이트</p>
		<pre>- 실시간으로 업데이트 되는 금융 소식을 통해 빠른 시장변동에 대응
- 중요 소식은 알림으로 즉시 전달받고, 중요정보를 놓치지 않도록 지원</pre>
		
		<p>* 사용 친화적 인터페이스</p>
		<p>- 직관적이고 사용하기 쉬운 인터페이스로 누구나 쉽게 접근 가능</p>
		
		<span class="w3-xlarge w3-text-green">[이용방법]</span>
		<p>Step 1. 가입키워드 설정</p>
		<p>- 연령층, 관심상품, 주거래은행 등 사용자 직접 선택</p>
		
		<p>Step 2. 예/적금 상품 수신</p>
		<p>- 전체 금융권 출시 예/적금 상품 검색 및 분석</p>
		
		<p>Step 3. 사용자 맞춤 예/적금 상품 추천</p>
		<p>- 시중에 접수중인 예/적금 상품 제공</p>
		
		<span class="w3-xlarge w3-text-green">[대체뭐니?(That's Money!)의 이점]</span>
		<pre>시간 절약: 바쁜 일상 속에서 최신 금융 정보를 쉽게 얻어 시간과 노력을 절약
지식 확장: 다양한 전문가의 분석과 조언을 통해 금융지식 확장
투자 효율성: 맞춤형 정보를 바탕으로, 보다 효율적인 자산관리와 투자 가능</pre>
		
    </div>
    <div class="w3-col l4 m6">
      <img src="/tm/image/mainview/app1.jpg" class="w3-image w3-right w3-hide-small" width="335" height="471">
      <img src="/tm/image/mainview/app5.jpg" class="w3-image w3-right w3-hide-small" width="335" height="471">
      <img src="/tm/image/mainview/app4.jpg" class="w3-image w3-right w3-hide-small" width="335" height="471">
      <img src="/tm/image/mainview/view13.jpg" class="w3-image w3-right w3-hide-small" width="335" height="471">
      <img src="/tm/image/mainview/view6.jpg" class="w3-image w3-right w3-hide-small" width="335" height="471">
      <div class="w3-center w3-hide-large w3-hide-medium">
      </div>
    </div>
  </div>
</div>

<!-- Clarity Section -->
<div id="Clarity" class="w3-padding-64 w3-gray">
  <div class="w3-row-padding">
    <div class="w3-col l4 m6">
      <img class="w3-image w3-round-large w3-hide-small w3-grayscale" src="/tm/image/mainview/footter2.jpg" alt="App" width="335" height="471">
    </div>
    <div class="w3-col l8 m6">
      <span id="sc"><h1 class="w3-xxlarge"><b>고객님들에게 전하는 말</b></h1></span>
      <p>자산 관리는 이제 더이상 어려운 일이 아닙니다. eocpa 키워드 기반 금융소식
      	 제공 서비스를 통해 최신 금융정보를 손쉽게 얻고, 현명한 자산관리를 실현하세요!
      	 지금 바로 가입하고, 당신의 자산 관리를 한단계 업그레이드 하세요!</p>
    </div>
  </div>
</div>


<script>
// Slideshow
var slideIndex = 1;
showDivs(slideIndex);

function plusDivs(n) {
  showDivs(slideIndex += n);
}

function showDivs(n) {
  var i;
  var x = document.getElementsByClassName("mySlides");
  if (n > x.length) {slideIndex = 1}
  if (n < 1) {slideIndex = x.length}
  for (i = 0; i < x.length; i++) {
    x[i].style.display = "none";  
  }
  x[slideIndex-1].style.display = "block";  
}
</script>

</body>
</html>