<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="model.CameraError"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="model.CameraProject"%>
<%@page import="java.util.List"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document </title>
    <link rel="stylesheet" href="./css/statistics.css">
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
</head>
	<%
	List<CameraProject> cameraProjects3 = (List<CameraProject>) request.getAttribute("CameraProject_Statistics");
    List<CameraError> cameraErrors = (List<CameraError>) request.getAttribute("ErrorByDate_Statistics");


	// Generate JSON for error types and their counts

	Map<String, Integer> errorTypeCounts = new HashMap<>();
	if (cameraErrors != null) {
	    for (CameraError error : cameraErrors) {
	        String errorType = error.getError_type();
	        errorTypeCounts.put(errorType, errorTypeCounts.getOrDefault(errorType, 0) + 1);
	    }
	}
	String errorTypeCountsJson = new Gson().toJson(errorTypeCounts);
	%>
	
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
                    <form class="element-search" action="http://localhost:8081/pbl3/statistics" method="post">
                        <div class="button">
                            <div class="button1"><span>Onsite</span></div>
                            <div class="button2" >
                                <select id="customSelect"  name="customSelect1a"></select>
                            </div>
                        </div>
                        <div class="date-time" id="date-picker">
                            <span>From: <input id="from" type="text" name="fromDate"></span>
                            <span>To: <input id="to" type="text" name="toDate"></span>
                        </div>
                        <button type="submit" class="button-search" onclick="Search()">Search<i class="fas fa-search"></i><span></span></button>
                    </form>
                </div>
                <div class="all-detection-history">
                    <div class="element-title">
                        <h3>All Detection History</h3>
                        <span>Search :All CH& Period - 2004-04-14 to 2004-05-23</span>
                    </div>
                    <div class="box-inquiry">
	                    <div class="inquiry">
		                	<table>
		                        <thead>
		                          <tr>
		                            <th>#</th>
		                            <th>Time</th>
		                            <th>Status</th>
		                            <th>OnSite</th>
		                            <th>Channel</th>
		<!--                             <th>Time</th>
		 -->                            <th>Error</th>
		                            <th>View details</th>
		                          </tr>
		                        </thead>
		                        <tbody>
			                      
									<%
									List<CameraError> cameraError = (List<CameraError>) request.getAttribute("ErrorByDate_Statistics");
									if (cameraError != null) {
									    for (int i = 0; i < cameraError.size(); i++) {
									%>
									        <tr>
									            <td><%= (i + 1) %></td>
									            <td><%= cameraError.get(i).getTimesptamp() %></td>
									            <td><%= cameraError.get(i).getStastus() %></td>
									            <td><%= cameraError.get(i).getProject_Name() %></td>
									            <td><%= cameraError.get(i).getCamera_name() %></td>
									            <td><%= cameraError.get(i).getError_type() %></td>
									            <td><%= cameraError.get(i).getdescript() %></td>
									        </tr>
									<%
									    }
									} else {
									%>
									    <tr>
									        <td colspan="6">No errors found.</td>
									    </tr>
									<%
									}
									%>
		                            </tbody>
		                      </table>
		                </div>
                
                    </div>
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
    <script src="./common/heardcm.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    
	<script >
	
	
<%--     document.addEventListener('DOMContentLoaded', () => {
        const ctx = document.getElementById('my-chart').getContext('2d');
        
        // Parse the error type counts from the JSON
        const errorTypeCounts = <%= errorTypeCountsJson %>;

        // Extract labels and data for the chart
        const labels = Object.keys(errorTypeCounts);
        const data = Object.values(errorTypeCounts);

        const myChart = new Chart(ctx, {
            type: 'bar', // Change to 'bar' for a bar chart
            data: {
                labels: labels,
                datasets: [{
                    label: 'Error Types',
                    data: data,
                    backgroundColor: 'rgba(255, 99, 132, 0.2)',
                    borderColor: 'rgba(255, 99, 132, 1)',
                    borderWidth: 1
                }]
            },
            options: {
                responsive: true,
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });
    });
	 --%>
	
	document.addEventListener('DOMContentLoaded', () => {
        const ctx = document.getElementById('my-chart').getContext('2d');
        const myChart = new Chart(ctx, {
            type: 'line',
            data: {
                labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July'],
                datasets: [{
                    label: 'Dataset 1',
                    data: [-60, 20, -30, 40, -50, 60, -70],
                    borderColor: 'rgba(255, 99, 132, 1)',
                    backgroundColor: 'rgba(255, 99, 132, 0.2)',
                    yAxisID: 'y',
                }, {
                    label: 'Dataset 2',
                    data: [10, -20, 30, -40, 50, -60, 70],
                    borderColor: 'rgba(54, 162, 235, 1)',
                    backgroundColor: 'rgba(54, 162, 235, 0.2)',
                    yAxisID: 'y1'
                }]
            },
            options: {
                responsive: true,
                interaction: {
                    mode: 'index',
                    intersect: false,
                },
                stacked: false,
                plugins: {
                    title: {
                        display: true,
                        text: 'Chart.js Line Chart - Multi Axis'
                    }
                },
                scales: {
                    y: {
                        type: 'linear',
                        display: true,
                        position: 'left',
                    },
                    y1: {
                        type: 'linear',
                        display: true,
                        position: 'right',
                        grid: {
                            drawOnChartArea: false,
                        },
                    },
                }
            }
        });
    });
	

	const Data =[
		<% if (cameraProjects3 != null) {
		    for(int i = 0; i < cameraProjects3.size(); i++) { %>
		    {
		        name: '<%= cameraProjects3.get(i).getCamera_name() %>',
		        area: '<%= cameraProjects3.get(i).getProject_name() %>'
		    }
		    <% if (i < cameraProjects3.size() - 1) { %>,<% } %>
		<%   } 
		} %>
		];

	
	var customSelector = document.getElementById("customSelect");
	Data.forEach(function (item) {
	    var option = document.createElement("option");
	    option.value = item.name;
	    option.text = item.name;
	    customSelector.appendChild(option);
	});


	function search() {
	    var fromDate = document.getElementById("from").value;
	    var toDate = document.getElementById("to").value;
	    var selectedOnsite = document.getElementById("customSelect").value;

	    if (!selectedOnsite) {
	        alert("Please select an onsite.");
	        return;
	    }

	    if (!fromDate || !toDate) {
	        alert("Please select both start and end dates.");
	        return;
	    }

	    var formattedFromDate = formatDate(fromDate);
	    var formattedToDate = formatDate(toDate);

	    var historyText = `Search: "${selectedOnsite}" CH& Period - ${formattedFromDate} to ${formattedToDate}`;
	    document.querySelector('.all-detection-history span').textContent = historyText;
	}

	function formatDate(dateString) {
	    var [day, month, year] = dateString.split('/');
	    return `${year}-${month}-${day}`;
	}


	fetch('./header.jsp')
	            .then(response => response.text())
	            .then(data => {
	                document.getElementById('header').innerHTML = data;
	            })
	            .catch(error => console.error('Error fetching header:', error));
	</script>

</body>

</html>