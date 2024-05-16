<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="model.CameraProject"%>
    <%@page import="java.util.List"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
    <%@page import="com.google.gson.Gson"%>
    
    
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
	List<CameraProject> cameraProjects= (List<CameraProject>) request.getAttribute("CameraProject");
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
                <form class="item-button" action="" method="">
                    <div class="button-onsite">
                        <div class="name-button">Onsite</div>
                        <div class="content-button">
                            <div class="selects">
                                <select class="customSelect" id="customSelect1">
                                </select>
                            </div>
                        </div>
                        <div class="button-channel">
                            <div class="name-button">Channel</div>
                            <div class="content-button">
                                <div class="selects">
                                    <select class=" customSelect" id="customSelect2">
                                    </select>
                                </div>

                            </div>
                        </div>
                        <div class="date-time" id="date-picker">
                            <span>From: <input id="from" type="text"></span>
                            <span>To: <input id="to" type="text"></span>
                        </div>
                        <div class="button-search">
                            <button type ="submit" onclick="Search()">Search<i class="fas fa-search"></i></button>
                        </div>
                    </div>
                </form>
            </div>
            <div class="box-inquiry">
                <div class="item-title">
                    <h3>Detection History Inquiry</h3>
                    <span class="span-nd">Search :All CH& Period - 2004-04-14 to 2004-05-23</span>
                </div>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <script >
        fetch('./header.jsp')
        .then(response => response.text())
        .then(data => {
            document.getElementById('header').innerHTML = data;
        })
        .catch(error => console.error('Error fetching header:', error));
            
        
        	
        	
        	
        	const Data =[
        		<%for(int i=0; i<cameraProjects.size();i++){%>
        		{
        			name:'<%= cameraProjects.get(i).getCamera_name()%>',
        			area:'<%= cameraProjects.get(i).getProject_name() %>'
        		}
        		<% if(i < cameraProjects.size() - 1) { %>,<% } %>
        		<%}%>
        	];
        	

            var customSelector1 = document.getElementById("customSelect1");
            Data.forEach(function (item) {
                var option = document.createElement("option");
                option.value = item.name;
                option.text = item.name;
                customSelector1.appendChild(option);
            });
            var customSelector2 = document.getElementById("customSelect2");
            Data.forEach(function (item) {
                var option = document.createElement("option");
                option.value = item.area;
                option.text = item.area;
                customSelector2.appendChild(option);
            })

            function Search() {
                var fromDate = document.getElementById("from").value;
                var toDate = document.getElementById("to").value;
                var selectedOnsite = document.getElementById("customSelect1").value; // Sửa đổi ở đây
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
                document.querySelector('.item-title .span-nd').textContent = historyText;
            }
            
            function formatDate(dateString) {
                var [day, month, year] = dateString.split('/');
                return `${year}-${month}-${day}`;
            }
            

            function search() {
                var fromDate = new Date(document.getElementById("from").value);
                var toDate = new Date(document.getElementById("to").value);

                if (fromDate > toDate) {
                    alert("End date must be greater than start date");
                    return;
                }

                // Thực hiện tìm kiếm dựa trên fromDate và toDate
                // Viết mã tìm kiếm ở đây
            }

            // Khởi tạo datepicker cho input "From" và "To"
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