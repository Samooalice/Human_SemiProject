<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Iframe Example</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="/tm/css/w3.css">
<link rel="stylesheet" type="text/css" href="/tm/css/user.css">
<script type="text/javascript" src="/tm/js/jquery-3.7.1.min.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<<<<<<< HEAD
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        .iframe-container {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            justify-content: space-between;
        }
        .iframe-wrapper {
            flex: 1 1 48%; /* 각 iframe을 48% 너비로 설정 */
            box-sizing: border-box;
        }
        .iframe-wrapper iframe {
            width: 100%;
            height: 600px;
            border: none;
        }
        .iframe-wrapper p {
            text-align: center;
        }
        @media (max-width: 768px) {
            .iframe-wrapper {
                flex: 1 1 100%; /* 작은 화면에서는 각 iframe을 100% 너비로 설정 */
            }
        }
        /* .centered-title {
            text-align: center;
            background-color: red;
            padding: 16px;
            margin: 0 0 20px 0; /* 여백을 추가하여 제목과 차트 사이에 간격을 둠 */
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); /* 그림자 효과 추가 */
            color: white; /* 텍스트 색상 설정 */
        } */
    </style>
</head>
=======
<style>
    .iframe-container {
        display: flex;
        justify-content: space-between;
        flex-wrap: wrap;
    }
    .iframe-wrapper {
        text-align: center;
        width: 50%;
    }
    .iframe-wrapper iframe {
        width: 100%;
        height: 600px;
    }
    @media screen and (max-width: 768px) {
        .iframe-wrapper {
            width: 50%;
            margin-bottom: 20px;
        }
    }
    
    @media screen and (max-width: 480px) {
        .iframe-wrapper iframe {
        	width : 100%;
            height: 600px;
        }
    }
</style>

<script type="text/javascript">
	$(document).ready(function(){
		$('#iframe_a').click(function(){
			var link = (this).attr('scr');
			alert('link');
			$('#iframe_c').attr('scr', '/tm/login.tm');
		});
	});
	
</script>
>>>>>>> branch 'working' of https://github.com/Samooalice/Human_SemiProject.git
<body>

<h2 class="centered-title w3-padding" style=" text-align: center;">적금 금리유형 별 평균 저축금리</h2>

<div class="iframe-container">
    <div class="iframe-wrapper">
        <iframe src="http://58.72.151.124:6002/tm/showChart1.tm/" id="iframe_a" scrolling="no"
            name="iframe_a" title="Iframe Example"></iframe>
        <p><a href="http://58.72.151.124:6002/tm/showChart1.tm/" target="iframe_c">확대해서 보기</a></p>
    </div>
    <div class="iframe-wrapper">
        <iframe src="http://58.72.151.124:6002/tm/showChart2sm.tm/" id="iframe_b" scrolling="no"
            name="iframe_b" title="Iframe Example"></iframe>
        <p><a href="http://58.72.151.124:6002/tm/showChart2.tm/" target="iframe_c">확대해서 보기</a></p>
    </div>
</div>

<iframe src="http://58.72.151.124:6002/tm/showChart1.tm/" id="iframe_c" scrolling="no"
        name="iframe_c" height="1000px" width="100%" title="Iframe Example"></iframe>

<p>When the target attribute of a link matches the name of an iframe, the link will open in the iframe.</p>

</body>
</html>