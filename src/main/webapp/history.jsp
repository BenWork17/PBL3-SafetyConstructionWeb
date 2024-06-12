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
    <title>Document</title>
    <link rel="stylesheet" href="./css/history.css">
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
</head>
<%
List<CameraProject> cameraProjects1 = (List<CameraProject>) request.getAttribute("CameraProject1");
%>

<body>
    <div id="header"></div>
    <div class="wrapper">
        <div class="box-title">
            <span>Detection History</span>
        </div>
        <div class="box-content">
            <div class="box-searchs">
                <div class="item-title">
                    <h3>Search Detection History</h3>
                    <p>Retrieve alarms history based on detection period and location</p>
                </div>
                <form class="item-button" action="http://localhost:8081/pbl3/history" method="post" onsubmit="return Search();">
                    <div class="button-onsite">
                        <div class="name-button">Onsite</div>
                        <div class="content-button">
                            <div class="selects">
                                <select class="customSelect" name="customSelect1a" id="customSelect1">
                                </select>
                            </div>
                        </div>
                        <div class="button-channel">
                            <div class="name-button">Channel</div>
                            <div class="content-button">
                                <div class="selects">
                                    <select class="customSelect" name="customSelect2a" id="customSelect2">
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="date-time" id="date-picker">
                            <span>From: <input id="from" name="fromDate" type="text"></span>
                            <span>To: <input id="to" name="toDate" type="text"></span>
                        </div>
                        <div class="button-search">
                            <button type="submit">Search<i class="fas fa-search"></i></button>
                        </div>
                    </div>
                </form>
            </div>
            <div class="box-inquiry">
                <div class="item-title">
                    <h3>Detection History Inquiry</h3>
                    <span class="span-nd">
                    	Information After Query
                    </span>
                </div>
                <div class="inquiry">
                    <table>
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Time</th>
                                <th>Status</th>
                                <th>OnSite</th>
                                <th>Channel</th>
                                <th>Error</th>
                                <th>View details</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                            List<CameraError> cameraError = (List<CameraError>) request.getAttribute("ErrorByDate");
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
                                <td colspan="7">No errors found.</td>
                            </tr>
                            <%
                            }
                            %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <script src="./common/heardcm.js"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <script>
            fetch('./header.jsp')
                .then(response => response.text())
                .then(data => {
                    document.getElementById('header').innerHTML = data;
                })
                .catch(error => console.error('Error fetching header:', error));

            const Data = [
                <% for (int i = 0; i < cameraProjects1.size(); i++) { %>
                {
                    name: '<%= cameraProjects1.get(i).getCamera_name() %>',
                    area: '<%= cameraProjects1.get(i).getProject_name() %>'
                }
                <% if (i < cameraProjects1.size() - 1) { %>, <% } %>
                <% } %>
            ];

            var customSelector1 = document.getElementById("customSelect1");
            var customSelector2 = document.getElementById("customSelect2");
            var addedOptions = new Set();
            Data.forEach(function (item) {
                if (!addedOptions.has(item.area)) {
                    var option = document.createElement("option");
                    option.value = item.area;
                    option.text = item.area;
                    customSelector2.appendChild(option);
                    addedOptions.add(item.area);
                }
            });

            function updateCustomSelector1(area) {
                customSelector1.innerHTML = '';
                Data.filter(item => item.area === area).forEach(function (item) {
                    var option = document.createElement("option");
                    option.value = item.name;
                    option.text = item.name;
                    customSelector1.appendChild(option);
                });
            }

            customSelector2.addEventListener('change', function () {
                var selectedArea = this.value;
                updateCustomSelector1(selectedArea);
            });

            if (customSelector2.options.length > 0) {
                updateCustomSelector1(customSelector2.options[0].value);
            }

            function Search() {
                var fromDate = document.getElementById("from").value;
                var toDate = document.getElementById("to").value;
                var selectedOnsite = document.getElementById("customSelect1").value;

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

/*                 var historyText = `Search: "${selectedOnsite}" CH& Period - ${formattedFromDate} to ${formattedToDate}`;
                document.querySelector('.item-title .span-nd').textContent = historyText;
 */
                return true;  
            }
            


            function formatDate(dateString) {
                var dateParts = dateString.split('/');
                var day = dateParts[0];
                var month = dateParts[1];
                var year = dateParts[2];
                return `${year}-${month}-${day}`;
            }

            document.addEventListener("DOMContentLoaded", function () {
                var fromDate, toDate;
                document.getElementById("from").addEventListener("click", function () {
                    showDatePicker("from");
                });
                document.getElementById("to").addEventListener("click", function () {
                    showDatePicker("to");
                });

                function showDatePicker(id) {
                    var datePickerConfig = {
                        dateFormat: "dd/mm/yy",
                        onSelect: function (dateText) {
                            if (id === "from") {
                                fromDate = new Date(dateText);
                                document.getElementById("from").value = dateText;
                            } else if (id === "to") {
                                toDate = new Date(dateText);
                                if (fromDate && toDate && fromDate > toDate) {
                                    alert("End date must be greater than start date");
                                    document.getElementById("to").value = "";
                                } else {
                                    document.getElementById("to").value = dateText;
                                }
                            }
                        }
                    };
                    $(`#${id}`).datepicker(datePickerConfig).datepicker("show");
                }
            });
        </script>
</body>

</html>
