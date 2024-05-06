<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" type="text/css" href="./css/login.css">
</head>
<body>
	<div class="wrapper">
		<form class="box-login" action="http://localhost:8080/pbl3/login "
			method="post">
			<div class="title">
				<h3>Login</h3>
			</div>
			<hr>
			<div class="box-input">
				<input type="text" name="username" /> <span class="title-input">Username</span>
			</div>
			<div class="box-input">
				<input type="password" name="password" required /> <span
					class="title-input">Password</span>
			</div>
			<p class="forgot-pass">Forgot Password?</p>
			<div class="btn-login">
				<button type="submit" value="Sign In">Sign In</button>
			</div>
			<div class="register">
				Not a member? <a href="./register.jsp">Sign Up</a>
			</div>
		</form>
	</div>


	<script>    
        document.addEventListener('DOMContentLoaded', function() {
            const inputs = document.querySelectorAll('input');
            const titleInput = document.querySelectorAll('.title-input');
                inputs.forEach((item, index) => {
                item.addEventListener('click', () => {
                    titleInput[index].classList.add('active');
                });
                    if (item.value.trim() !== '') {
                    titleInput[index].classList.add('active');
                }
                item.addEventListener('blur', () => {
                    if (item.value.trim() === '') { 
                        titleInput[index].classList.remove('active');
                    }
                });
            });
                window.addEventListener('pageshow', function(event) {
                if (event.persisted || (window.performance && window.performance.navigation.type === 2)) { 
                    inputs.forEach(input => input.value = '');
                    titleInput.forEach(title => title.classList.remove('active'));
                }
            });
        });
    </script>
</body>
</html>