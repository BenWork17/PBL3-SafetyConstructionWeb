<%@page import="model.Users"%>
<%@page import="java.util.List"%>
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

<%
List<Users> user =(List<Users>) session.getAttribute("profile");
Users user1=null;
if(user!=null&& !user.isEmpty()){
	 user1=user.get(0);
}
else{
	System.out.print("loi null");
}
%>
<body>
    <div id="header"></div>
    <div class="wrapper">
        <div class="user-info">
            <h1>User Information</h1>
            <hr>
            <% if (user != null) { %>
                <p><strong>Username:</strong> <span id="username"><%= user1.getUsers_name() %></span></p>
                <hr>
                <p><strong>Full Name:</strong> <span id="full-name"><%= user1.getFull_name() %></span></p>
                <hr>
                <p><strong>Email:</strong> <span id="email"><%= user1.getEmail() %></span></p>
                <hr>
                <p><strong>Phone:</strong> <span id="phone"><%= user1.getPhone() %></span></p>
                <hr>
                <p><strong>Role:</strong> <span id="role"><%= user1.getRole_ID() == 1 ? "Admin" : "User" %></span></p>
                <hr>
            <% } else { %>
                <p>User not found.</p>
            <% } %>
            <button id="logout-button" >Log Out</button>
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="./common/heardcm.js"></script>
    <script>
        fetch('./header.jsp')
            .then(response => response.text())
            .then(data => {
                document.getElementById('header').innerHTML = data;
            })
            .catch(error => console.error('Error fetching header:', error));
        
        
        $(document).ready(function() {
            $('#logout-button').click(function() {
                $.ajax({
                    url: 'logout',
                    method: 'GET',
                    success: function(response) {
                        window.location.href = 'login.jsp'; 
                    },
                    error: function(xhr, status, error) {
                        console.error('Error:', error);
                        alert('Logout failed');
                    }
                });
            });
        });

    </script>
</body>
</html>