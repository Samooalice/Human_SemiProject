<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Iframe Example</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        .iframe-container {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            justify-content: space-between;
            overflow-x: auto; /* horizontal scrollbar */
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
    </style>
</head>
<body>

<h2 class="w3-center">최근 6개월 금융 상품 정보</h2>

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
</html>