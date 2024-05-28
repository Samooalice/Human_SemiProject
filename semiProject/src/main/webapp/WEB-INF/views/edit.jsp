<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>EditView</title>
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
		
		$('#main').click(function(){
			$(location).attr('href','/tm/');
		});
		
		$('#edit').click(function(){
	        $('#frm').submit();
		});
	});
</script>


</head>
<body>
<div class="w3-content mxw650">
<!-- Contact Section -->
<div class="w3-light-grey" style="padding:175px">
  <h3 class="w3-center">회원정보 수정</h3>
  <p class="w3-center w3-large">수정할 회원정보를 입력해 주세요:</p>
  <div style="margin-top:48px">
   
    <form action="/tm/editProc.tm" method="POST" id="frm">
 
 	<label for="nickname" class="w3-col mgb20">당신의 닉네임은 무엇입니까? : </label>
	<input class="w3-padding w3-border w3-border-green" style="width:150%;"
		 type="text" name="nickname" value="${SID}" id="nickname" readonly/>
 
   	 <label for="period_day" class="w3-col w3-select">희망하는 예치기간은 몇 개월입니까? : </label>
   	 <select name="period_day" class="w3-select w3-padding w3-border w3-border-green"  >
		<option value="12개월">12개월</option>
		<option value="24개월">24개월</option>
		<option value="36개월">36개월</option>
	</select>
	
   	 <label for="birth" class="w3-col w3-margin-top">고객님의 연령은 어떤 층에 속하십니까? : </label>
   	 <select name="birth" class="w3-select w3-padding w3-border w3-border-green"  >
		<option value="청년층">청년층</option>
		<option value="노년층">노년층</option>
		<option value="선택안함">선택안함</option>
	</select>
	
   	 <label for="gen" class="w3-col w3-margin-top">고객님의 성별은 무엇입니까? : </label>
   	 <select name="gen" class="w3-select w3-padding w3-border w3-border-green"  >
		<option value="M">M</option>
		<option value="F">F</option>
	</select>
	
   	 <label for="main_bank" class="w3-col w3-margin-top">주 거래처로 어떤 은행을 희망하십니까? : </label>
   	 <select name="main_bank" class="w3-select w3-padding w3-border w3-border-green"  >
		<option value="KB국민은행">KB국민은행</option>
		<option value="신한은행">신한은행</option>
		<option value="우리은행">우리은행</option>
		<option value="하나은행">하나은행</option>
		<option value="기타">기타</option>
	</select>
	
   	 <label for="interest_type" class="w3-col w3-margin-top">희망하시는 금융상품은 어떤 종류입니까? : </label>
   	 <select name="interest_type" class="w3-select w3-padding w3-border w3-border-green"  >
		<option value="저축">저축</option>
		<option value="카드">카드</option>
		<option value="투자">투자</option>
		<option value="대출">대출</option>
		<option value="선택안함">선택안함</option>
	</select>
      </form>
      
        <button class="w3-button w3-black w3-margin-top" id="edit">
          <i class="fa fa-paper-plane"></i> 정보 수정하기
          
        <button class="w3-button w3-black w3-margin-top w3-right" id="main">
          <i class="fa fa-home"></i> 메인으로
        </button>
      
  </div>
</div>
</div>
</body>
</html>