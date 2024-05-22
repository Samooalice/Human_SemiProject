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
			$(location).attr('href', '/tm/login.tm')
		});
		
		$('#link1').click(function(){
			$(location).attr('href', 'http://pf.kakao.com/_xbzjxcG/chat');
		});
		
		$('#link2').click(function(){
			$(location).attr('href', 'https://namu.wiki/w/%EB%AA%A8%EB%91%90%EC%9D%98%EB%A7%88%EB%B8%94%20for%20kakao/%EB%B9%84%ED%8C%90?from=%EC%A3%BC%EC%9E%91%EC%9D%98%20%EB%A7%88%EB%B8%94#fn-3');
		});
	});
	
	
</script>


</head>
<body>
<!-- Header with Slideshow -->
<header class="w3-display-container w3-center">
  <button class="w3-button w3-block w3-green w3-hide-large w3-hide-medium" onclick="document.getElementById('download').style.display='block'">Download </button>
  <div class="mySlides w3-animate-opacity">
    <img class="w3-image" src="https://www.w3schools.com/w3images/app.jpg" alt="Image 1" style="min-width:500px" width="1500" height="1000">
    <div class="w3-display-left w3-padding w3-hide-small" style="width:35%">
      <div class="w3-black w3-opacity w3-hover-opacity-off w3-padding-large w3-round-large">
        <h1 class="w3-xlarge">Login</h1>
        <hr class="w3-opacity">
			<div class="w3-container w3-padding w3-margin-top w3-round-large w3-card-4 pdh30">
<c:if test="${not empty ISLOGIN}">
	            <div class="w3-col w3-padding">
	                <label for="id" class="w3-col m4 w3-right-align w3-text-gray lbl">ID : </label>
	                <input type="text" class="w3-col m8 w3-input w3-border"
	                        name="id" id="id" placeholder="아이디를 입력하세요.">
	            </div>
	            <div class="w3-col w3-padding">
	                <label for="pw" class="w3-col m4 w3-right-align w3-text-gray lbl">PW : </label>
	                <input type="password" class="w3-col m8 w3-input w3-border"
	                    name="pw" id="pw" placeholder="비밀번호를 입력하세요.">
	            </div>
</c:if>


<c:if test="${empty ISLOGIN}">
</c:if>
	        </div>        
        <p><button id="login" class="w3-button w3-half w3-block w3-green w3-round">로그인</button></p>
       
        <p><button id="join" class="w3-button w3-half w3-block w3-green w3-round">회원가입</button></p> 
      </div>
    </div>
  </div>

  <a href="#sc" class="w3-button w3-black w3-display-right w3-margin-right w3-round w3-hide-small w3-hover-light-grey">Take Tour</a>

</header>

<!-- 대체뭐니 설명 섹션 -->
<div class="w3-padding-64 w3-white">
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
		<p>- 사용자가 설정한 키워드를 기반으로 최신 예/적금 상품을 큐레이션하여 제공</p>
		<p>- 관심분야에 따른 투자 Tip등을 간단하게 확인</p>
		
		<p>* 실시간 업데이트</p>
		<p>- 실시간으로 업데이트 되는 금융 소식을 통해 빠른 시장변동에 대응</p>
		<p>- 중요 소식은 알림으로 즉시 전달받고, 중요정보를 놓치지 않도록 지원</p>
		
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
		<p>시간 절약: 바쁜 일상 속에서 최신 금융 정보를 쉽게 얻어 시간과 노력을 절약</p>
		<p>지식 확장: 다양한 전문가의 분석과 조언을 통해 금융지식 확장</p>
		<p>투자 효율성: 맞춤형 정보를 바탕으로, 보다 효율적인 자산관리와 투자 가능</p>
		
      <button class="w3-button w3-light-grey w3-padding-large w3-section w3-hide-small" onclick="document.getElementById('download').style.display='block'">
        <i class="fa fa-download"></i> Download Application
      </button>
      <p>Available for <i class="fa fa-android w3-xlarge w3-text-green"></i> <i class="fa fa-apple w3-xlarge"></i> <i class="fa fa-windows w3-xlarge w3-text-blue"></i></p>
    </div>
    <div class="w3-col l4 m6">
      <img src="https://www.w3schools.com/w3images/app4.jpg" class="w3-image w3-right w3-hide-small" width="335" height="471">
      <div class="w3-center w3-hide-large w3-hide-medium">
        <button class="w3-button w3-block w3-padding-large" onclick="document.getElementById('download').style.display='block'">
          <i class="fa fa-download"></i> Download Application
        </button>
        <img src="https://www.w3schools.com/w3images/app5.jpg" class="w3-image w3-margin-top" width="335" height="471">
      </div>
    </div>
  </div>
</div>

<!-- Modal -->
<div id="download" class="w3-modal w3-animate-opacity">
  <div class="w3-modal-content" style="padding:32px">
    <div class="w3-container w3-white">
      <i onclick="document.getElementById('download').style.display='none'" class="fa fa-remove w3-xlarge w3-button w3-transparent w3-right w3-xlarge"></i>
      <h2 class="w3-wide">DOWNLOAD</h2>
      <p>Download the app in AppStore, Google Play or Microsoft Store.</p>
      <i class="fa fa-android w3-large"></i> <i class="fa fa-apple w3-large"></i> <i class="fa fa-windows w3-large"></i>
      <p><input class="w3-input w3-border" type="text" placeholder="Enter e-mail"></p>
      <button type="button" class="w3-button w3-block w3-padding-large w3-red w3-margin-bottom" onclick="document.getElementById('download').style.display='none'">Fake Download</button>
    </div>
  </div>
</div>

<!-- Clarity Section -->
<div id="Clarity" class="w3-padding-64 w3-light-grey">
  <div class="w3-row-padding">
    <div class="w3-col l4 m6">
      <img class="w3-image w3-round-large w3-hide-small w3-grayscale" src="https://www.w3schools.com/w3images/app2.jpg" alt="App" width="335" height="471">
    </div>
    <div class="w3-col l8 m6">
      <span id="sc"><h1 class="w3-xxlarge"><b>고객님들에게 전하는 말</b></h1></span>
      <p>자산 관리는 이제 더이상 어려운 일이 아닙니다. eocpa 키워드 기반 금융소식
      	 제공 서비스를 통해 최신 금융정보를 손쉽게 얻고, 현명한 자산관리를 실현하세요!
      	 지금 바로 가입하고, 당신의 자산 관리를 한단계 업그레이드 하세요!</p>
    </div>
  </div>
</div>

<!-- Features Section -->
<div class="w3-container w3-padding-64 w3-dark-grey w3-center">
  <h1 class="w3-jumbo"><b>Features</b></h1>
  <p>This app is just so lorem ipsum.</p>

  <div class="w3-row" style="margin-top:64px">
    <div class="w3-col s3">
      <i class="fa fa-bolt w3-text-orange w3-jumbo"></i>
      <p>Fast</p>
    </div>
    <div class="w3-col s3">
      <i class="fa fa-heart w3-text-red w3-jumbo"></i>
      <p>Loved</p>
    </div>
    <div class="w3-col s3">
      <i class="fa fa-camera w3-text-yellow w3-jumbo"></i>
      <p>Clarity</p>
    </div>
    <div class="w3-col s3">
      <i class="fa fa-battery-full w3-text-green w3-jumbo"></i>
      <p>Power</p>
    </div>
  </div>

  <div class="w3-row" style="margin-top:64px">
    <div class="w3-col s3">
      <i class="fa fa-diamond w3-text-white w3-jumbo"></i>
      <p>Sharp</p>
    </div>
    <div class="w3-col s3">
      <i class="fa fa-cloud w3-text-blue w3-jumbo"></i>
      <p>Cloud</p>
    </div>
    <div class="w3-col s3">
      <i class="fa fa-globe w3-text-amber w3-jumbo"></i>
      <p>Global</p>
    </div>
    <div class="w3-col s3">
      <i class="fa fa-hdd-o w3-text-cyan w3-jumbo"></i>
      <p>Storage</p>
    </div>
  </div>
  
  <div class="w3-row" style="margin-top:64px">
    <div class="w3-col s3">
      <i class="fa fa-user w3-text-sand w3-jumbo"></i>
      <p>Safe</p>
    </div>
    <div class="w3-col s3">
      <i class="fa fa-shield w3-text-orange w3-jumbo"></i>
      <p>Stabile</p>
    </div>
    <div class="w3-col s3">
      <i class="fa fa-wifi w3-text-grey w3-jumbo"></i>
      <p>Connected</p>
    </div>
    <div class="w3-col s3">
      <i class="fa fa-image w3-text-pink w3-jumbo"></i>
      <p>HD</p>
    </div>
  </div>
</div>

<!-- Pricing Section -->
<div class="w3-padding-64 w3-center w3-white">
  <h1 class="w3-jumbo"><b>Pricing</b></h1>
  <p class="w3-large">Choose a pricing plan that fits your needs.</p>
  <div class="w3-row-padding" style="margin-top:64px">
    <div class="w3-half w3-section">
      <ul class="w3-ul w3-card w3-hover-shadow">
        <li class="w3-dark-grey w3-xlarge w3-padding-32">Basic</li>
        <li class="w3-padding-16"><b>250</b> Photos</li>
        <li class="w3-padding-16"><b>10</b> Features</li>
        <li class="w3-padding-16"><b>No</b> Ads</li>
        <li class="w3-padding-16"><b>Office hours</b> Support</li>
        <li class="w3-padding-16">
          <h2 class="w3-opacity">$ 25</h2>
        </li>
        <li class="w3-light-grey w3-padding-24">
          <button id="link1" class="w3-button w3-black w3-padding-large" ><i class="fa fa-download"></i> Download</button>
        </li>
      </ul>
    </div>
    <div class="w3-half w3-section">
      <ul class="w3-ul w3-card w3-hover-shadow">
        <li class="w3-red w3-xlarge w3-padding-32">Premium</li>
        <li class="w3-padding-16"><b>1000</b> Photos</li>
        <li class="w3-padding-16"><b>50</b> Features</li>
        <li class="w3-padding-16"><b>No</b> Ads</li>
        <li class="w3-padding-16"><b>Endless</b> Support</li>
        <li class="w3-padding-16">
          <h2 class="w3-opacity">$ 99</h2>
        </li>
        <li class="w3-light-grey w3-padding-24">
          <button id = "link2" class="w3-button w3-black w3-padding-large" > <i class="fa fa-download"></i> Download</button> <!-- 웹사이트 연결 임시 테스트 -->
        </li>
      </ul>
    </div>
  </div>
  <br>
</div>

<!-- Footer -->
<footer class="w3-container w3-padding-32 w3-light-grey w3-center w3-xlarge">
  <div class="w3-section">
    <i class="fa fa-facebook-official w3-hover-opacity"></i>
    <i class="fa fa-instagram w3-hover-opacity"></i>
    <i class="fa fa-snapchat w3-hover-opacity"></i>
    <i class="fa fa-pinterest-p w3-hover-opacity"></i>
    <i class="fa fa-twitter w3-hover-opacity"></i>
    <i class="fa fa-linkedin w3-hover-opacity"></i>
  </div>
  <p class="w3-medium">Powered by <a href="https://www.w3schools.com/w3css/default.asp" target="_blank" class="w3-hover-text-green">w3.css</a></p>
</footer>

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