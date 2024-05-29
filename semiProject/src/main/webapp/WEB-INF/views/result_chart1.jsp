<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Chart_1</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="/tm/css/w3.css">
<link rel="stylesheet" type="text/css" href="/tm/css/user.css">
<script type="text/javascript" src="/tm/js/jquery-3.7.1.min.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
    .iframe-container {
        display: flex;
        justify-content: space-between;
    }
    .iframe-wrapper {
        text-align: center;
        width: 50%;
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
<body>

<h2 class = 'w3-center'>최근 6개월 금융 상품 정보</h2>

<div class="iframe-container">
    <div class="iframe-wrapper">
        <iframe src="http://58.72.151.124:6002/tm/showChart1.tm/" id="iframe_a"
            name="iframe_a" height="600px" width="100%" title="Iframe Example"></iframe>
        <p><a href="http://58.72.151.124:6002/tm/showChart1.tm/" target="iframe_c">확대해서 보기</a></p>
    </div>
    <div class="iframe-wrapper">
        <iframe src="http://58.72.151.124:6002/tm/showChart2sm.tm/" id="iframe_b"
            name="iframe_b" height="600px" width="100%" title="Iframe Example"></iframe>
        <p><a href="http://58.72.151.124:6002/tm/showChart2.tm/" target="iframe_c">확대해서 보기</a></p>
    </div>
</div>

<iframe src="http://58.72.151.124:6002/tm/showChart1.tm/" id="iframe_c"
        name="iframe_c" height="1000px" width="100%" title="Iframe Example"></iframe>
        

<p>When the target attribute of a link matches the name of an iframe, the link will open in the iframe.</p>

</body>
</html>
