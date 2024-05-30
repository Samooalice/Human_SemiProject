<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="/tm/css/w3.css">
    <link rel="stylesheet" type="text/css" href="/tm/css/user.css">
    <script type="text/javascript" src="/tm/js/jquery-3.7.1.min.js"></script>
    <title>Chart1</title>
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
            width: 100%; /* adjust the width */
        }
        .iframe-wrapper {
            flex: 1 1 48%; /* 각 iframe을 48% 너비로 설정 */
            box-sizing: border-box;
            position: relative; /* 상대 위치 지정 */
            text-align: center; /* 중앙 정렬 */
        }
        .iframe-wrapper iframe {
            width: 100%;
            height: 600px;
            border: none;
        }
        .iframe-wrapper .w3-btn {
            display: inline-block; /* 중앙 정렬을 위한 인라인 블록 */
            margin-top: 10px;
        }
        @media (max-width: 768px) {
            .iframe-wrapper {
                flex: 1 1 100%; /* 작은 화면에서는 각 iframe을 100% 너비로 설정 */
            }
        }
        #fullchart {
            display: none; /* Initially hide the modal */
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.8);
            justify-content: center;
            align-items: center;
            z-index: 1000;
        }
        #fullchart iframe {
            border: none;
            width: 90%;
            height: 90%;
        }
        #close-btn {
            position: absolute;
            top: 20px;
            right: 20px;
            background: #fff;
            border: none;
            padding: 10px;
            cursor: pointer;
            border-radius: 5px;
        }
        #close-btn:hover {
            background: #ccc;
        }
    </style>
    <script type="text/javascript">
        $(document).ready(function() {
            $('#chart1').click(function() {
                $('#fullchart iframe').attr('src', 'http://58.72.151.124:6002/tm/showChart1.tm/');
                $('#fullchart').show();
            });

            $('#chart2').click(function() {
                $('#fullchart iframe').attr('src', 'http://58.72.151.124:6002/tm/showChart2.tm/');
                $('#fullchart').show();
            });

            $('#close-btn').click(function() {
                $('#fullchart').hide();
                $('#fullchart iframe').attr('src', '');
            });
        });
    </script>
</head>
<body>

<h2 class="w3-center">최근 6개월 금융 상품 정보</h2>

<div class="iframe-container">
    <div class="iframe-wrapper">
        <iframe src="http://58.72.151.124:6002/tm/showChart1.tm/" id="iframe_a" scrolling="no"
            name="iframe_a" title="Iframe Example"></iframe>
        <div class="w3-btn w3-blue" id="chart1">확대해서 보기</div>
    </div>
    <div class="iframe-wrapper">
        <iframe src="http://58.72.151.124:6002/tm/showChart2sm.tm/" id="iframe_b" scrolling="no"
            name="iframe_b" title="Iframe Example"></iframe>
        <div class="w3-btn w3-blue" id="chart2">확대해서 보기</div>
    </div>
</div>

<div id="fullchart">
    <button id="close-btn">Close</button>
    <iframe src="" scrolling="no" title="Iframe Example"></iframe>
</div>

<p>When the target attribute of a link matches the name of an iframe, the link will open in the iframe.</p>

</body>
</html>
