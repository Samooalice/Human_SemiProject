<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
  <head>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript" src="/tm/js/jquery-3.7.1.min.js"></script>
    <script>
        $(document).ready(function() {
            $.ajax({
                url: "http://58.72.151.124:6002/tm/result_Json.tm/",
                type: "GET",
                dataType: "json",
                success: function(data) {
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
    <h1>test.jsp</h1>
    <h1 id="age">Loading...</h1>
    <h1 id="sub">Loading...</h1>
    <h1 id="bank">Loading...</h1>
    <div id="result"></div> <!-- 오류 메시지를 표시할 추가 요소 -->
  </body>
</html>
