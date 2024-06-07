<%@page import="model.CameraProject"%>
<%@page import="model.CameraError"%>
<%@page import="java.util.List"%>
<%@page import="com.google.gson.Gson"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./css/cctv.css">
    <title>Document </title>

</head>
<%
List<CameraProject> cameraProject11=(List<CameraProject>) request.getAttribute("CameraProject1");
%>
<body>
    <div id="header"></div>

    <div class="wrapper">
        <div class="box-title">
            <span>CCTV</span>
        </div>
        <div class="box-content">
            <!-- content top -->
            <div class="content-top">
                <!-- cctv -->
                <div class="box-cctv">
                    <form  class="box-selects" action="http://localhost:8081/pbl3/cctv" method="post">
                        <div class="selectss">
                            <div class="select1">
                                <select class="customSelect" name ="customSelect1b" id="customSelect1">
                                </select>
                            </div>
                            <div class="select2">
                                <select class=" customSelect" name ="customSelect2b" id="customSelect2">
                                </select>
                            </div>
                        </div>
                         <button type="submit" class="add">
                         <h3 class="add-p">+       Submit</h3>
                         </button>
                    </form>

						<%
						    List<CameraError> cameraErrors = (List<CameraError>) request.getAttribute("CameraError1");
						    String videoSrc = "";
						    if (cameraErrors != null && !cameraErrors.isEmpty()) {
						        CameraError firstError = cameraErrors.get(0); // Get the first element
						        videoSrc = firstError.getIP_address(); // Assume getSrc() method exists in CameraError
						    }
						%>
						<div class="cctv">
						    <iframe class="video-cctv" frameborder="0" type="video/mp4" src="<%= videoSrc %>" width="100%" height="100%" allow="autoplay"></iframe>
						</div>

						
						   
                </div>
                <!--history  -->
                <div class="box-history">
                    <div class="box-date-time">
                        <div class="loca-da-ti">
                            <div class="location" id="location"></div>
                            <div class="date-time">
                                <div class="date">
                                    <p class="title-element">Date:</p>
                                    <p class="time-element" id="date"></p>
                                    <p class="title-element">/</p>
                                    <p class="time-element" id="month"></p>
                                    <p class="title-element">/</p>
                                    <p class="time-element" id="year"></p>

                                </div>
                                <div class="time">
                                    <p class="title-element">Time:</p>
                                    <p class="time-element" id="hour"></p>
<p class="title-element">:</p>
                                    <p class="time-element" id="minute"></p>
                                    <p class="title-element">:</p>
                                    <p class="time-element" id="second"></p>
                                </div>
                            </div>
                        </div>
                        <div class="view-in-details">
                            <button id="view-in-details">View in Details</button>
                        </div>
                    </div>
					<div class="box-detection-history">
						<div class="history-title">
							<h3 class="history-title-p">Detection History</h3>
						</div>
						<div class="history-list">
							<table>
								<thead>
									<tr>
										<th>Time</th>
										<th>Detection</th>
									</tr>
								</thead>
								<tbody>
									<%
									List<CameraError> cameraerror1 = (List<CameraError>) request.getAttribute("CameraError1");
									if (cameraerror1 != null) {
									    for (int i = 0; i < cameraerror1.size(); i++) {
									%>
									        <tr>
									            <td><%= cameraerror1.get(i).getError_type() %></td>
									            <td><%= cameraerror1.get(i).getdescript() %></td>
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
				</div>
            </div>
            <!-- content bottom -->
<!--             <div class="content-bottom">
                <div class="zone">
                    <div class="title-zone">
                        <h3>Work Zone</h3>
                    </div>
                    <hr>
                </div>
                <div class="zone">
                    <div class="title-zone">
                        <h3>Hazard Zone</h3>
                    </div>
                    <hr>
                </div>
            </div>
        </div> -->
    </div>
    <script>
    fetch('./header.jsp')
    .then(response => response.text())
    .then(data => {
        document.getElementById('header').innerHTML = data;
    })
    .catch(error => console.error('Error fetching header:', error));
    
    

    <%
    if (cameraProject11 != null && !cameraProject11.isEmpty()) {
    %>
    const Data =[
        <% for(int i = 0; i < cameraProject11.size(); i++) {
            if (cameraProject11.get(i) != null && cameraProject11.get(i).getCamera_name() != null) { %>
            {
                name: '<%= cameraProject11.get(i).getCamera_name() %>',
                area: '<%= cameraProject11.get(i).getProject_name() %>'
            }
            <% if(i < cameraProject11.size() - 1) { %>,<% } %>
        <% } } %>
    ];
    <% } else { %>
    const Data = [];
    <% } %>

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

/*     const html = listHistory.map(item => {
        return `
        <div class="history-list-item">
            <div class="history-list-item-name">
                <p>${item.name}</p>
            </div>
            <div class="history-list-item-price">
                <p>${item.price}</p>
            </div>
        </div>
        `
    }) */

    document.querySelector('.history-list').innerHTML = html.join('')
    function updateTime() {
        var now = new Date();
        document.getElementById("date").textContent = now.getDate();
        document.getElementById("month").textContent = now.getMonth() + 1;
        document.getElementById("year").textContent = now.getFullYear();
        document.getElementById("hour").textContent = now.getHours();
        document.getElementById("minute").textContent = now.getMinutes();
        document.getElementById("second").textContent = now.getSeconds();
    }
    setInterval(updateTime, 1000);
    window.onload = getLocation;



    // Truy cập luồng video từ camera
    navigator.mediaDevices.getUserMedia({ video: true })
        .then(function (stream) {
            var videoElement = document.getElementById('video');
            videoElement.srcObject = stream;
        })
        .catch(function (error) {
            console.log('Lỗi: ' + error);
        });
        
        

    </script>
</body>
</html>