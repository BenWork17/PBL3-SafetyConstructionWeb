<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document </title>
    <link rel="stylesheet" href="./css/statistics.css">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
</head>

<body>
    <div id="header"></div>
    <div class="wrapper">
        <div class="box-title">
            <span>Onsite Statistics</span>
        </div>
        <div class="box-content">
            <div class="box-searchs">
                <div class="search-onsite-statistics">
                    <div class="element-title">
                        <h3>Search Onsite Statistics</h3>
                        <p>Set statistical data period</p>
                    </div>
                    <div class="element-search">
                        <div class="button">
                            <div class="button1"><span>Onsite</span></div>
                            <div class="button2">
                                <select id="customSelect"></select>
                            </div>
                        </div>
                        <div class="date-time" id="date-picker">
                            <span>From: <input id="from" type="text"></span>
                            <span>To: <input id="to" type="text"></span>
                        </div>
                        <button class="button-search" onclick="search()">Search<i class="fas fa-search"></i><span></span></button>
                    </div>
                </div>
                <div class="all-detection-history">
                    <div class="element-title">
                        <h3>All Detection History</h3>
                        <span>Search :All CH& Period - 2004-04-14 to 2004-05-23</span>
                    </div>
                    <div class="History"></div>
                </div>
            </div>
            <div class="report">
                <span>Detailed report in 'Detection History'</span>
                <div class="chart">
                    <canvas id="my-chart"></canvas>
                </div>
            </div>
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="./js/statistics.js"></script>

</body>

</html>