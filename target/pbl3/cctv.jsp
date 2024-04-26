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
                    <div class="box-selects">
                        <div class="selectss">
                            <div class="select1">
                                <select class="customSelect" id="customSelect1">
                                </select>
                            </div>
                            <div class="select2">
                                <select class=" customSelect" id="customSelect2">
                                </select>
                            </div>
                        </div>
                        <div class="add">
                            <h3 class="add-p">+</h3>
                            <p class="add-p">Add Work/Hazard Zone</p>
                        </div>
                    </div>
                    <div class="cctv">
                        <video id="video" width="100%" height="100%" autoplay></video>
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
                        <div class="history-list"></div>
                    </div>
                </div>
            </div>
            <!-- content bottom -->
            <div class="content-bottom">
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
        </div>
    </div>
    <script>
    fetch('./header.jsp')
    .then(response => response.text())
    .then(data => {
        document.getElementById('header').innerHTML = data;
    })
    .catch(error => console.error('Error fetching header:', error));
    </script>
    <script src="./js/cctv.js"></script>
</body>
</html>