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
    <link rel="stylesheet" href="./css/mutil_cctv.css">
    <title>Document </title>
</head>
	
	
 	<%
    List<CameraProject> cameraProjects = (List<CameraProject>) request.getAttribute("CameraProject");
	%>


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
    
    
    <script>
    fetch('./header.jsp')
    .then(response => response.text())
    .then(data => {
        document.getElementById('header').innerHTML = data;
    })
    .catch(error => console.error('Error fetching header:', error));


	    const cam = [
	        <% for(int i = 0; i < cameraProjects.size(); i++) { %>
	        {
	            Project_name: '<%= cameraProjects.get(i).getProject_name() %>',
	            Camera_name: '<%= cameraProjects.get(i).getCamera_name() %>',
	            IP_address: '<%= cameraProjects.get(i).getIP_address() %>'
	        }
	        <% if(i < cameraProjects.size() - 1) { %>,<% } %>
	        <% } %>
	    ];
	





        function showPage(pageName) {
            let DATA=[];
            const contentElement = document.querySelector('.content');
            switch (pageName) {
                case 'cctv-view-all':
                    contentElement.innerHTML = `
                    <div class="cctv-view-all-content">
                        <div class="title-content">
                            <h2>CCTV View All</h2>
                        </div>
                        <div class="cctv-view">
                            <div class="container cctv-view-content"></div>
                            <div class="pagination">
                                <a href="#" class="page-link previous">&lt;&lt;</a>
                                <span class="page-number">1</span>
                                <a href="#" class="page-link next">&gt;&gt;</a>
                            </div>
                        </div>
                    </div>
                `;
                    DATA=cam;

                    renderPage(DATA,'.cctv-view-content', '.previous', '.next', '.page-number');
                    break;
                case 'site-A':
                    contentElement.innerHTML = `
                        <div class="cctv-view-all-content">
                            <div class="title-content">
                                <h2>SITE-A</h2>
                            </div>
                            <div class="cctv-view">
                                <div class="container cctv-view-content"></div>
                                <div class="pagination">
                                    <a href="#" class="page-link previous">&lt;&lt;</a>
                                    <span class="page-number">1</span>
                                    <a href="#" class="page-link next">&gt;&gt;</a>
                                </div>
                            </div>
                        </div>
                    `;
                    DATA=cam.filter(item=>item.Project_name==='SiteA');
                    console.log(DATA) 
                    renderPage(DATA,'.cctv-view-content', '.previous', '.next', '.page-number');
                    break;
                case 'site-B':
                    contentElement.innerHTML = `
                        <div class="cctv-view-all-content">
                            <div class="title-content">
                                <h2>SITE-B</h2>
                            </div>
                            <div class="cctv-view">
                                <div class="container cctv-view-content"></div>
                                <div class="pagination">
                                    <a href="#" class="page-link previous">&lt;&lt;</a>
                                    <span class="page-number">1</span>
                                    <a href="#" class="page-link next">&gt;&gt;</a>
                                </div>
                            </div>
                        </div>
                    `;

                    DATA=cam.filter(item=>item.Project_name==='SiteB');
                    renderPage(DATA,'.cctv-view-content', '.previous', '.next', '.page-number');
                    break;
                case 'underground-vertical-zone':
                    contentElement.innerHTML = `
                        <div class="cctv-view-all-content">
                            <div class="title-content">
                                <h2>UNDERGROUND VERTICAL ZONE</h2>
                            </div>
                            <div class="cctv-view">
                                <div class="container cctv-view-content"></div>
                                <div class="pagination">
                                    <a href="#" class="page-link previous">&lt;&lt;</a>
                                    <span class="page-number">1</span>
                                    <a href="#" class="page-link next">&gt;&gt;</a>
                                </div>
                            </div>
                        </div>
                    `;
                    DATA=cam.filter(item=>item.Project_name==='Underground');
                    renderPage(DATA,'.cctv-view-content', '.previous', '.next', '.page-number');
                    break;
                case'show-bookmark':
                        contentElement.innerHTML = `
                        <div class="cctv-view-all-content">
                            <div class="title-content">
                                <h2>SHOW BOOKMARK</h2>
                            </div>
                            <div class="cctv-view">
                                <div class="container show-bookmark"></div>
                                <div class="pagination">
                                    <a href="#" class="page-link previous">&lt;&lt;</a>
                                    <span class="page-number">1</span>
                                    <a href="#" class="page-link next">&gt;&gt;</a>
                                </div>
                            </div>
                        </div>
                    `;
                    DATA=bookmarkedItems
                    renderPage(DATA,'.show-bookmark', '.previous', '.next', '.page-number');
                    break;
                default:
                    break;
                
            }
        }
        let bookmarkedItems = [];

        function toggleBookmark(button) {
            // Lấy thông tin của mục từ phần tử HTML
            const itemId = parseInt(button.parentElement.parentElement.querySelector('.element-area').textContent);
            const itemName = button.parentElement.parentElement.querySelector('.element-name-cctv').textContent;
            
            const isBookmarked = bookmarkedItems.some(item => item.Project_name === itemId && item.Camera_name === itemName); // Kiểm tra xem mục đã được đánh dấu bookmark chưa
            if (isBookmarked) {
                bookmarkedItems = bookmarkedItems.filter(item => !(item.Project_name === itemId && item.Camera_name === itemName)); // Loại bỏ mục khỏi danh sách bookmarkedItems
                button.classList.remove('bookmarked'); // Xóa class 'bookmarked' để gỡ bỏ hiển thị icon bookmark
            } else {
                const selectedItem = cam.find(item => item.Project_name === itemId && item.Camera_name === itemName);
                bookmarkedItems.push(selectedItem); // Thêm mục vào danh sách bookmarkedItems
                button.classList.add('bookmarked'); // Thêm class 'bookmarked' để hiển thị icon bookmark
            }
            renderData(bookmarkedItems, '.show-bookmark');
        }

        
        document.querySelectorAll('.element-bookmark button').forEach(button => {
            button.addEventListener('click', function() {
                toggleBookmark(this);
            });
        });
        
        function createItemRenderer(item) {
            const itemRenderer = document.createElement('div');
            itemRenderer.classList.add('item');
            itemRenderer.innerHTML = `
                <div class="item-view-cctv">
	                 <iframe class="video-cctv" frameborder="0" type="video/mp4" src="${item.IP_address}" width="100%" height="100%"  allow="autoplay"></iframe>

                </div>
                <div class="item-information">
                    <div class="element-type">
                        <div class="element-icon"></div>
                        <div class="element-area"> ${item.Project_name}</div>
                        <div class="element-name-cctv">${item.Camera_name}</div>
                        <div class="element-status-cctv"></div>
                        <div class="element-bookmark">
                            <button onclick="toggleBookmark(this)"><i class="fas fa-bell"></i></button>
                        </div>
                    </div>
                    <div class="element-notifications">
                        <button class="button-notifications"> No Unidentified Notifications</button>
                    </div>
                </div>
            `;

            return itemRenderer;
        }


        function renderData(data, containerSelector) {
            const container = document.querySelector(containerSelector);
            container.innerHTML = '';
            data.forEach(item => {
                const itemRenderer = createItemRenderer(item);
                container.appendChild(itemRenderer);
            });
        }
        function updatePageNumber(pageNumberSelector, currentPage) {
            document.querySelector(pageNumberSelector).textContent = currentPage;
        }

        function renderPage(data,containerSelector, previousButtonSelector, nextButtonSelector, pageNumberSelector) {
            let currentPage = 1;
            const itemsPerPage = 8;
            const previousButton = document.querySelector(previousButtonSelector);
            const nextButton = document.querySelector(nextButtonSelector);

            function render() {
                const start = (currentPage - 1) * itemsPerPage;
                const end = start + itemsPerPage;
                const dataToShow = data.slice(start, end);
                renderData(dataToShow, containerSelector);
                updatePageNumber(pageNumberSelector, currentPage);
            }

            previousButton.addEventListener('click', function (event) {
                if (currentPage > 1) {
                    currentPage--;
                    render();
                }
                event.preventDefault();
            });

            nextButton.addEventListener('click', function (event) {
                const totalPages = Math.ceil(data.length / itemsPerPage);
                if (currentPage < totalPages) {
                    currentPage++;
                    render();
                }
                event.preventDefault();
            });

            render();
        }

        // Hiển thị trang mặc định


        var prevClicked = null;
        function toggleClicked(element) {
            if (prevClicked !== null && prevClicked !== element) {
                prevClicked.classList.remove('clicked');
            }
            element.classList.toggle('clicked');
            prevClicked = element;
        }


    </script>
<!-- 	<script src="./js/mutil_cctv.js"></script> -->

</body>


</html>