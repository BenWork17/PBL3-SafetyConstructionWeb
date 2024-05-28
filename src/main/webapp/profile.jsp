<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="./css/profile.css">
</head>
<body>
    <div id="header"></div>
    <div class="wrapper">
        <div class="user-info">
            <h1>User Information</h1>
            <hr>
            <p><strong>Username:</strong> <span id="username">Nguyen Van A</span></p>
            <hr>
            <p><strong>Full Name:</strong> <span id="full-name">Nguyễn Văn A</span></p>
            <hr>
            <p><strong>Email:</strong> <span id="email">Nguyễn Văn A</span></p>
            <hr>
            <p><strong>Phone:</strong> <span id="phone">0388789998</span></p>
            <hr>
            <p><strong>Role:</strong> <span id="role">Admin</span></p>
            <hr>
            <button id="logout-button">Log Out</button>
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
</body>
</html>