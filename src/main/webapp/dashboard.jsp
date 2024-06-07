<%@page import="java.util.List"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="model.Detective"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>

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
<%
int[] detections1 = (int[]) request.getAttribute("detectiveStatic1");
int[] detections2 = (int[]) request.getAttribute("detectiveStatic2");
int[] detections3 = (int[]) request.getAttribute("detectiveStatic3");
String monthlyReportDataJson = (String) request.getAttribute("monthlyReportData");
%>
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
                        
                    </div>
                    <div class="Chart">
                        <canvas id="chart1"></canvas>
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
                       
                    </div>
                    <div class="chart">
                        <canvas id="chart2"></canvas>
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
                    </div>
                    <div class="chart">
                        <canvas id="chart3"></canvas>
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
    <script>

    var detections1 = <%= java.util.Arrays.toString(detections1) %>;
    var detections2 = <%= java.util.Arrays.toString(detections2) %>;
    var detections3 = <%= java.util.Arrays.toString(detections3) %>;

    new Chart(document.getElementById('chart1').getContext('2d'), {
        type: 'bar',
        data: {
            labels: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
            datasets: [{
                label: 'Body Detections',
                data: detections1,
                backgroundColor: [
                    'rgba(255, 99, 132, 0.2)',
                    'rgba(255, 159, 64, 0.2)',
                    'rgba(255, 205, 86, 0.2)',
                    'rgba(75, 192, 192, 0.2)',
                    'rgba(54, 162, 235, 0.2)',
                    'rgba(128, 128, 128, 0.2)',
                    'rgba(153, 102, 255, 0.2)'
                ],
                borderColor: [
                    'rgb(255, 99, 132)',
                    'rgb(255, 159, 64)',
                    'rgb(255, 205, 86)',
                    'rgb(75, 192, 192)',
                    'rgb(54, 162, 235)',
                    'rgb(128, 128, 128)',
                    'rgb(153, 102, 255)'
                ],
                borderWidth: 1
            }]
        },
        options: {
            scales: {
                y: {
                    beginAtZero: true
                }
            },
            plugins: {
                legend: {
                    display: false
                }
            }
        }
    });

    new Chart(document.getElementById('chart2').getContext('2d'), {
        type: 'bar',
        data: {
            labels: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
            datasets: [{
                label: 'Area Detections',
                data: detections2,
                backgroundColor: [
                    'rgba(255, 99, 132, 0.2)',
                    'rgba(255, 159, 64, 0.2)',
                    'rgba(255, 205, 86, 0.2)',
                    'rgba(75, 192, 192, 0.2)',
                    'rgba(54, 162, 235, 0.2)',
                    'rgba(128, 128, 128, 0.2)',
                    'rgba(153, 102, 255, 0.2)'
                ],
                borderColor: [
                    'rgb(255, 99, 132)',
                    'rgb(255, 159, 64)',
                    'rgb(255, 205, 86)',
                    'rgb(75, 192, 192)',
                    'rgb(54, 162, 235)',
                    'rgb(128, 128, 128)',
                    'rgb(153, 102, 255)'
                ],
                borderWidth: 1
            }]
        },
        options: {
            scales: {
                y: {
                    beginAtZero: true
                }
            },
            plugins: {
                legend: {
                    display: false
                }
            }
        }
    });

    new Chart(document.getElementById('chart3').getContext('2d'), {
        type: 'bar',
        data: {
            labels: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
            datasets: [{
                label: 'Machine Detections',
                data: detections3,
                backgroundColor: [
                    'rgba(255, 99, 132, 0.2)',
                    'rgba(255, 159, 64, 0.2)',
                    'rgba(255, 205, 86, 0.2)',
                    'rgba(75, 192, 192, 0.2)',
                    'rgba(54, 162, 235, 0.2)',
                    'rgba(128, 128, 128, 0.2)',
                    'rgba(153, 102, 255, 0.2)'
                ],
                borderColor: [
                    'rgb(255, 99, 132)',
                    'rgb(255, 159, 64)',
                    'rgb(255, 205, 86)',
                    'rgb(75, 192, 192)',
                    'rgb(54, 162, 235)',
                    'rgb(128, 128, 128)',
                    'rgb(153, 102, 255)'
                ],
                borderWidth: 1
            }]
        },
        options: {
            scales: {
                y: {
                    beginAtZero: true
                }
            },
            plugins: {
                legend: {
                    display: false
                }
            }
        }
    });

    document.addEventListener('DOMContentLoaded', () => {
        const ctx = document.getElementById('my-chart').getContext('2d');
        const monthlyReportData = JSON.parse('<%= monthlyReportDataJson %>');

        const labels = Object.keys(monthlyReportData);
        const datasets = Object.keys(monthlyReportData).map(errorType => ({
            label: errorType,
            data: monthlyReportData[errorType],
            backgroundColor: getRandomColor(),
            borderColor: getRandomColor(),
            borderWidth: 1
        }));

        new Chart(ctx, {
            type: 'bar',
            data: {
                labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'],
                datasets: datasets
            },
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

    function getRandomColor() {
        const r = Math.floor(Math.random() * 255);
        const g = Math.floor(Math.random() * 255);
        const b = Math.floor(Math.random() * 255);
        return `rgba(${r}, ${g}, ${b}, 0.6)`;
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
