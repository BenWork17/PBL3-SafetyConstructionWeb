<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.google.gson.Gson"%>
<%@page import="model.CameraProject"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./css/mutil_cctv.css">
    <title>Document </title>
</head>
	
    <%
    List<CameraProject> cameraProjects = (List<CameraProject>) request.getAttribute("CameraProject");
	%>
     	<% for (CameraProject project : cameraProjects) { %>
                <p>Project Name: <%= project.getProject_name() %>,</p>
                <p>Location: <%= project.getCamera_name() %>,</p>
            
        <% } %>
<body>
    <div id="header"></div>

    <div class="wrapper">
        <div class="item-list">
            <div class="item-title">CCTV MONITORING</div>
            <hr>
            <div id="item-cctv-view-all" class="item-cctv-view-all"
                onclick="toggleClicked(this);showPage('cctv-view-all')">
                <div class="incon">
                    <svg class="svg-mutil_cctv" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512">
                        <path
                            d="M0 128C0 92.7 28.7 64 64 64H320c35.3 0 64 28.7 64 64V384c0 35.3-28.7 64-64 64H64c-35.3 0-64-28.7-64-64V128zM559.1 99.8c10.4 5.6 16.9 16.4 16.9 28.2V384c0 11.8-6.5 22.6-16.9 28.2s-23 5-32.9-1.6l-96-64L416 337.1V320 192 174.9l14.2-9.5 96-64c9.8-6.5 22.4-7.2 32.9-1.6z" />
                    </svg>
                </div>
                <div class="c-tent">CCTV View All</div>
            </div>
            <div id="item-site-A" class="item-site-A" onclick="toggleClicked(this);showPage('site-A')">
                <div class="incon">
                    <svg class="svg-mutil_cctv" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512">
                        <path
                            d="M0 128C0 92.7 28.7 64 64 64H320c35.3 0 64 28.7 64 64V384c0 35.3-28.7 64-64 64H64c-35.3 0-64-28.7-64-64V128zM559.1 99.8c10.4 5.6 16.9 16.4 16.9 28.2V384c0 11.8-6.5 22.6-16.9 28.2s-23 5-32.9-1.6l-96-64L416 337.1V320 192 174.9l14.2-9.5 96-64c9.8-6.5 22.4-7.2 32.9-1.6z" />
                    </svg>
                </div>
                <div class="c-tent">SITE-A</div>
            </div>
            <div class="item-site-B" onclick="toggleClicked(this);showPage('site-B')">
                <div class="incon">
                    <svg class="svg-mutil_cctv" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512">
                        <path
                            d="M0 128C0 92.7 28.7 64 64 64H320c35.3 0 64 28.7 64 64V384c0 35.3-28.7 64-64 64H64c-35.3 0-64-28.7-64-64V128zM559.1 99.8c10.4 5.6 16.9 16.4 16.9 28.2V384c0 11.8-6.5 22.6-16.9 28.2s-23 5-32.9-1.6l-96-64L416 337.1V320 192 174.9l14.2-9.5 96-64c9.8-6.5 22.4-7.2 32.9-1.6z" />
                    </svg>
                </div>
                <div class="c-tent">SITE-B</div>
            </div>
            <div class="item-underground-vertical-zone"
                onclick="toggleClicked(this);showPage('underground-vertical-zone')">
                <div class="incon">
                    <svg class="svg-mutil_cctv" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512">
                        <path
                            d="M0 128C0 92.7 28.7 64 64 64H320c35.3 0 64 28.7 64 64V384c0 35.3-28.7 64-64 64H64c-35.3 0-64-28.7-64-64V128zM559.1 99.8c10.4 5.6 16.9 16.4 16.9 28.2V384c0 11.8-6.5 22.6-16.9 28.2s-23 5-32.9-1.6l-96-64L416 337.1V320 192 174.9l14.2-9.5 96-64c9.8-6.5 22.4-7.2 32.9-1.6z" />
                    </svg>
                </div>
                <div class="c-tent">Underground Vertical Zone</div>
            </div>
            <div class="item-title">BOOKMARK</div>
            <hr>
            <div class="item-show-bookmark" onclick="toggleClicked(this);showPage('show-bookmark')">
                <div class="incon"></div>
                <div class="c-tent">Show Bookmark</div>
            </div>
        </div>
        <div class="box-content">
            <!-- <div class="title-content"></div> -->
            <div class="content"></div>
            <!-- <div class="pagination-content"></div> -->
        </div>
    </div>
	<script src="./js/mutil_cctv.js"></script>
</body>

</html>