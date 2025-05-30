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
	int[] statis1=(int[]) request.getAttribute("Static1");
	int[] statis2=(int[]) request.getAttribute("Static2");
	int[] statis3=(int[]) request.getAttribute("Static3");
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
                    <form class="element-search" action="http://localhost:8081/pbl3/statistics" method="post" onsubmit="return Search();">
                        <div class="button">
                            <div class="button1"><span>Channel</span></div>
                            <div class="button2" >
                                <select id="customSelect"  name="customSelect1a"></select>
                            </div>
                        </div>
                        <div class="date-time" id="date-picker">
                            <span>From: <input id="from" type="text" name="fromDate"></span>
                            <span>To: <input id="to" type="text" name="toDate"></span>
                        </div>
                        <button type="submit" class="button-search" >Search<i class="fas fa-search"></i><span></span></button>
                    </form>
                </div>
                <div class="all-detection-history">
                    <div class="element-title">
                        <h3>All Detection History</h3>
                        <span>Information After Query</span>
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
	var statis1 = <%= java.util.Arrays.toString(statis1) %>;
	var statis2 = <%= java.util.Arrays.toString(statis2) %>;
	var statis3 = <%= java.util.Arrays.toString(statis3) %>;
	document.addEventListener('DOMContentLoaded', () => {
        const ctx = document.getElementById('my-chart').getContext('2d');
        const myChart = new Chart(ctx, {
            type: 'line',
            data: {
                labels: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
                datasets: [{
                    label: 'BODY',
                    data: statis1,
                    borderColor: 'rgba(255, 99, 132, 1)',
                    backgroundColor: 'rgba(255, 99, 132, 0.2)',
                    yAxisID: 'y',
                }, {
                    label: 'AREA',
                    data: statis2,
                    borderColor: 'rgba(54, 162, 235, 1)',
                    backgroundColor: 'rgba(54, 162, 235, 0.2)',
                    yAxisID: 'y'
                }, {
                    label: 'MACHINE',
                    data: statis3,
                    borderColor: 'rgb(153, 102, 255)',
                    backgroundColor: 'rgba(54, 162, 235, 0.2)',
                    yAxisID: 'y'
                }
                ]
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


	function Search() {
	    var fromDate = document.getElementById("from").value;
	    var toDate = document.getElementById("to").value;
	    var selectedOnsite = document.getElementById("customSelect").value;

        if (!selectedOnsite) {
            alert("Please select an onsite.");
            return false;  
        }

        if (!fromDate || !toDate) {
            alert("Please select both start and end dates.");
            return false;  
        }
        var fromDateObj = new Date(document.getElementById("from").value);
        var toDateObj = new Date(document.getElementById("to").value);

        if (fromDateObj > toDateObj) {
            alert("End date must be greater than start date");
            return false;  
        }

        alert('Search success');

	    var formattedFromDate = formatDate(fromDate);
	    var formattedToDate = formatDate(toDate);

/* 	    var historyText = `Search: "${selectedOnsite}" CH& Period - ${formattedFromDate} to ${formattedToDate}`;
	    document.querySelector('.all-detection-history span').textContent = historyText;
	     */
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