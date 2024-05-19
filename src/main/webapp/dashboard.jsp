<%@page import="java.util.List"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="model.Detective"%>

<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./css/dashboard.css">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <title>Document</title>
</head>
<body>
    <div id="header"></div>
    <div class="wrapper">
        <div class="box-title">
            <span>Dashboard</span>
        </div>
        <div class="box-notification">
            <!-- thong bao 1 -->
            <div class="notifications">
                <div class="item-title-notification">
                    <h5>Weekly Emergency Notification Detection</h5>
                    <p>Worker Collapsed & Crash</p>
                </div>
                <div class="item-statistics">
                    <div class="data">
                        <span>0</span>
                        <p>Compared to last week</p>
                        <span>0</span>
                    </div>
                    <div class="Chart">
                        <canvas class="myChart-1"></canvas>
                    </div>
                </div>
            </div>
            <!-- thong bao 2 -->
            <div class="notifications">
                <div class="item-title-notification">
                    <h5>Weekly Danger Notification Detection</h5>
                    <p>Entry into Hazardous Area</p>
                </div>
                <div class="item-statistics">
                    <div class="data">
                        <span>0</span>
                        <p>Compared to last week</p>
                        <span>0</span>
                    </div>
                    <div class="chart">
                        <canvas class="myChart-2"></canvas>
                    </div>
                </div>
            </div>
            <!-- tb 3 -->
            <div class="notifications">
                <div class="item-title-notification">
                    <h5>Weekly Warning Notification Detection</h5>
                    <p>Hard hat Non-Compliance & No Signalman</p>
                </div>
                <div class="item-statistics">
                    <div class="data">
                        <span>0</span>
                        <p>Compared to last week</p>
                        <span>0</span>
                    </div>
                    <div class="chart">
                        <canvas class="myChart-3"></canvas>
                    </div>
                </div>
            </div>
        </div >
        <!-- o nay phan vox lich su -->
		<div class="box-histore">
			<!-- div trais -->
			<div class="detection-history">
				<div class="title-detection-history">
					<h4>Detection History</h4>
				</div>
				<div class="list-detection-history">
					<table>
						<thead>
							<tr>
								<th>Time</th>
								<th>Detection</th>
							</tr>
						</thead>
						<tbody>
							<%
							List<Detective> detective1 = (List<Detective>) request.getAttribute("detective");
							if (detective1 != null) {
								for (int i = 0; i < detective1.size(); i++) {
							%>
							<tr>
								<td><%=detective1.get(i).getTimestamp()%></td>
								<td><%=detective1.get(i).getDescripts()%></td>
							</tr>

							<%
							}
							} else {
							%>
							<tr>
								<td colspan="3">No errors found.</td>
							</tr>
							<%
							}
							%>


						</tbody>
					</table>
				</div>
			</div>
			<div>
				<p></p>
			</div>
			<!-- div phai -->
			<div class="box-report">
				<div class="monthly-report">
					<div class="title-monthly-report">
						<h4>Monthly Report</h4>
					</div>
					<div>
						<canvas id="my-chart"></canvas>
					</div>
				</div>
				<div class="view">
					<div class="view-detection-history"></div>
					<div class="view-statistics"></div>
				</div>
			</div>
		</div>
	</div>
    <script src="./js/dashboard.js"></script>
    
</body>
</html>