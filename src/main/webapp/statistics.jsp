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
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
</head>
	<%
	List<CameraProject> cameraProjects3 = (List<CameraProject>) request.getAttribute("CameraProject_Statistics");
    List<CameraError> cameraErrors = (List<CameraError>) request.getAttribute("ErrorByDate_Statistics");

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
    
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script >
	document.addEventListener('DOMContentLoaded', () => {
	    const ctx = document.getElementById('my-chart').getContext('2d');
	    const data = {
	        labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August'],
	        datasets: [
	            {
	                label: 'Brown',
	                data: [3, 6, 2, 3, 2, 1, 5, 6],
	                backgroundColor: 'rgba(165, 42, 42, 0.2)',
	                borderColor: 'rgb(165, 42, 42)',
	                borderWidth: 1
	            },
	            {
	                label: 'Gray',
	                data: [4, 8, 1, 4, 3, 1, 6, 8],
	                backgroundColor: 'rgba(128, 128, 128, 0.2)',
	                borderColor: 'rgb(128, 128, 128)',
	                borderWidth: 1
	            },
	            {
	                label: 'Orange',
	                data: [6, 12, 2, 6, 5, 1, 8, 10],
	                backgroundColor: 'rgba(255, 159, 64, 0.2)',
	                borderColor: 'rgb(255, 159, 64)',
	                borderWidth: 1
	            },
	            {
	                label: 'Purple',
	                data: [9, 16, 4, 7, 3, 2, 9, 14],
	                backgroundColor: 'rgba(153, 102, 255, 0.2)',
	                borderColor: 'rgb(153, 102, 255)',
	                borderWidth: 1
	            },
	            {
	                label: 'Green',
	                data: [5, 10, 3, 8, 4, 2, 10, 12],
	                backgroundColor: 'rgba(75, 192, 192, 0.2)',
	                borderColor: 'rgb(75, 192, 192)',
	                borderWidth: 1
	            },
	            {
	                label: 'Yellow',
	                data: [8, 14, 5, 10, 6, 4, 15, 18],
	                backgroundColor: 'rgba(255, 205, 86, 0.2)',
	                borderColor: 'rgb(255, 205, 86)',
	                borderWidth: 1
	            },
	            {
	                label: 'Blue',
	                data: [10, 15, 7, 12, 8, 5, 13, 20],
	                backgroundColor: 'rgba(54, 162, 235, 0.2)',
	                borderColor: 'rgb(54, 162, 235)',
	                borderWidth: 1
	            },
	            {
	                label: 'Red',
	                data: [12, 19, 3, 5, 2, 3, 10, 15],
	                backgroundColor: 'rgba(255, 99, 132, 0.2)',
	                borderColor: 'rgb(255, 99, 132)',
	                borderWidth: 1
	            }
	        ]
	    };

	    new Chart(ctx, {
	        type: 'bar',
	        data: data,
	        options: {
	            scales: {
	                x: {
	                    stacked: true
	                },
	                y: {
	                    stacked: true,
	                    beginAtZero: true
	                }
	            },
	            plugins: {
	                legend: {
	                    display: true,
	                    position: 'bottom',
	                },
	                title: {
	                    display: true,
	                    text: 'Stacked Column Chart with Annotations'
	                }
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