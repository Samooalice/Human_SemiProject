<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
  <head>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript" src="/tm/js/jquery-3.7.1.min.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['bar']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart(bank, max_Tex, min_Tex, mid_Tex, bank1, bank2, bank3, bank4) {
        var data = google.visualization.arrayToDataTable([
          [bank, max_Tex, min_Tex, mid_Tex],
          [bank1, 1000, 400, 200],
          [bank2, 1170, 460, 250],
          [bank3, 660, 1120, 300],
          [bank4, 1030, 540, 350]
        ]);

        var options = {
          chart: {
            title: '은행별 금리 현황',
            subtitle: 'Sales, Expenses, and Profit: 2014-2017',
          }
        };

        var chart = new google.charts.Bar(document.getElementById('columnchart_material'));

        chart.draw(data, google.charts.Bar.convertOptions(options));
      }
    </script>
    <script>
        $(document).ready(function() {
            $.ajax({
                url: "http://58.72.151.124:6002/tm/test.tm/",
                type: "GET",
                dataType: "json",
                success: function(data) {
                    console.log("Success:", data);
                    $("#bank").text("bank: " + data.bank);
                    $("#max_Tex").text("max_Tex: " + data.max_Tex);
                    $("#min_Tex").text("min_Tex: " + data.min_Tex);
                    $("#mid_Tex").text("mid_Tex: " + data.mid_Tex);
                    $("#bank1").text("bank1: " + data.bank1);
                    $("#bank2").text("bank2: " + data.bank2);
                    $("#bank3").text("bank3: " + data.bank3);
                    $("#bank4").text("bank4: " + data.bank4);
                    
                    drawChart(data.bank, data.max_Tex, data.min_Tex, data.mid_Tex,
                    		data.bank1, data.bank2, data.bank3, data.bank4
                    );
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
    <div id="columnchart_material" style="width: 800px; height: 500px;"></div>
    <h1>test.jsp</h1>
    <h1 id="bank">Loading...</h1>
    <h1 id="max_Tex">Loading...</h1>
    <h1 id="min_Tex">Loading...</h1>
    <h1 id="mid_Tex">Loading...</h1>
    <h1 id="bank1">Loading...</h1>
    <h1 id="bank2">Loading...</h1>
    <h1 id="bank3">Loading...</h1>
    <h1 id="bank4">Loading...</h1>
    <div id="result"></div> <!-- 오류 메시지를 표시할 추가 요소 -->
  </body>
</html>
