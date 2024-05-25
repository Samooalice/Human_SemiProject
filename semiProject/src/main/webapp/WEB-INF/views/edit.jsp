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
		
		$('#join').click(function(){
	        $('#frm').submit();
		});
	});
</script>


</head>
<body>
	<div class="w3-content mxw650">
	 	<h1 class="w3-center w3-amber w3-padding">Edit Page</h1>
		    <form action="/tm/editProc.tm" method="POST" id="frm"
		    class="w3-green w3-center w3-margin-top w3-card-4">
		        
		        <div class="w3-col w3-padding w3-margin-top">
			        <label for="nickname">당신의 닉네임은 무엇입니까? : </label>
			        <input type="hidden" name="nickname" value="${param.nickname}" id="nickname" readonly/>
		        </div>
		        
		        <div class="w3-col w3-padding w3-margin-top">
			        <label for="period_day">희망하는 예치기간은 몇 개월입니까? : </label>
			        <select name="period_day" id="period_day">
			        	<option value="12개월">12개월</option>
			        	<option value="24개월">24개월</option>
			        	<option value="36개월">36개월</option>
			        </select>
		        </div>
		        
		        <div class="w3-col w3-padding w3-margin-top">
			        <label for="birth">당신의 나이는 어떤 층에 속합니까? : </label>
			       <select name="birth" id="birth">
			        	<option value="청년층">청년층</option>
			        	<option value="노년층">노년층</option>
			        	<option value="선택안함">선택안함</option>
			        </select>
		        </div>
		        
		        <div class="w3-col w3-padding w3-margin-top">
			        <label for="gen">당신의 성별은 무엇입니까? : </label>
			        <select name="gen" id="gen">
			        	<option value="M">M</option>
			        	<option value="F">F</option>
			        </select>
		        </div>
		        
		        <div class="w3-col w3-padding w3-margin-top">
			        <label for="main_bank">당신이 희망하는 은행은 어떤 은행입니까? : </label>
			        <select name="main_bank" id="main_bank">
			        	<option value="국민은행">국민은행</option>
			        	<option value="신한은행">신한은행</option>
			        	<option value="우리은행">우리은행</option>
			        	<option value="하나은행">하나은행</option>
			        	<option value="기타">기타</option>
			        </select>
		        </div>
		        
		        <div class="w3-col w3-padding w3-margin-top">
			        <label for="interest_type">당신이 희망하는 상품종류는 무엇입니까? : </label>
			        <select name="interest_type" id="interest_type">
			        	<option value="저축">저축</option>
			        	<option value="카드">카드</option>
			        	<option value="투자">투자</option>
			        	<option value="대출">대출</option>
			        	<option value="선택안함">선택안함</option>
			        </select>
		        </div>
		    </form>
		    
		        <div class="w3-col w3-padding w3-center">
			        <div class="w3-btn w3-center w3-brown w3-margin-top w3-margin-bottom" id="main">메인으로</div>
			        <div class="w3-btn w3-center w3-brown w3-margin-top w3-margin-bottom" id="edit">정보수정하기</div>
		        </div>
	</div>
</body>
</html>
