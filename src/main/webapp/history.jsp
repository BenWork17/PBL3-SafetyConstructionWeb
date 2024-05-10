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
        <script src="./js/history.js"></script>
</body>

</html>