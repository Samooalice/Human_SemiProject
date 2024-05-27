<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>AJAX Example</title>
    <script type="text/javascript" src="/tm/js/jquery-3.7.1.min.js"></script>
    <script>
    	// Json내용을 VO에 담기 Test 완
        $(document).ready(function() {
            $.ajax({
                url: "http://58.72.151.124:6002/tm/result_Json.tm/",
                type: "GET",
                dataType: "json",
                success: function(data) {
                    console.log("Success:", data);
                    var el_B = document.createElement('input');
                    $(el_B).attr('type', 'hidden');
                    $(el_B).attr('name', 'birth');
                    $(el_B).attr('id', 'birth');
                    $(el_B).attr('value', data.age);

                    var el_I = document.createElement('input');
                    $(el_I).attr('type', 'hidden');
                    $(el_I).attr('name', 'interest_type');
                    $(el_I).attr('value', data.sub);
                    
                    var el_Mb = document.createElement('input');
                    $(el_Mb).attr('type', 'hidden');
                    $(el_Mb).attr('name', 'main_bank');
                    $(el_Mb).attr('value', data.bank);
                    
                    $('#frm').append(el_B);
                    $('#frm').append(el_I);
                    $('#frm').append(el_Mb);
                    $('#frm').attr('action', '/tm/getResult.tm')
                    $('#frm').submit();
                    
                    $("#age").text("Age: " + data.age);
                    $("#sub").text("Sub: " + data.sub);
                    $("#bank").text("Bank: " + data.bank);
                },
                error: function(jqXHR, textStatus, errorThrown) {
                    console.log("Error Status:", textStatus);
                    console.log("Error Thrown:", errorThrown);
                    console.log("Response Text:", jqXHR.responseText);
                    $("#result").text("Failed to load data");
                }
            });
            
            
        });
    </script>
</head>
<body>
	<form method="POST" id="frm">
	</form>
	<h1>test.jsp</h1>
    <h1 id="age">Loading...</h1>
    <h1 id="sub">Loading...</h1>
    <h1 id="bank">Loading...</h1>
    <div id="result"></div> <!-- 오류 메시지를 표시할 추가 요소 -->
</body>
</html>