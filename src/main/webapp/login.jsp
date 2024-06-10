<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
<!--     <link rel="stylesheet" type="text/css" href="./css/login.css">
 -->
 <style >
 @charset "UTF-8";
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

.wrapper {
    display: flex;
    justify-content: center;
    align-items: center;
    width: 100vw;
    height: 100vh;
    background-image:  url("./img/436446888_1016487736765429_3959454371799771410_n.png");
    background-size: cover;
}

.box-login {
    width: 400px;
    height: 400px;
    background-color: white;
    padding: 30px 0;
    border-radius: 20px;
}

.title {
    text-align: center;
    font-size: 30px;
    margin-bottom: 20px;
}

hr {
    margin-bottom: 20px;
}

.box-input {
    position: relative;
    width: 100%;
    height: 40px;
    padding: 0 30px;
    margin-bottom: 20px;
}

.box-input input {
    width: 100%;
    height: 100%;
    border: none;
    outline: none;
    border-bottom: 2px solid black;
    font-size: 20px;
}

.box-input span {
    position: absolute;
    top: 50%;
    left: 30px;
    transform: translateY(-50%);
    font-weight: 600;
    opacity: 0.4;
    font-size: 16px;
}

.box-input input ~ .active {
    top: -10px;
    color :rgb(255, 0, 0);
}

.box-login .forgot-pass {
    opacity: 0.5;
    margin-left: 30px;
}

.box-login .btn-login {
    width: 100%;
    height: 50px;
    padding: 0 30px;
    margin-top: 20px ;
}

.box-login .btn-login button {
    width: 100%;
    height: 100%;
    padding: 0 30px;
    background-color: #2691d9;
    color: #b2f3ff;
    border: none;
    border-radius: 25px;
    font-size: 20px;
    cursor: pointer;
}

.box-login .btn-login button:hover {
    background-color: #569cff;
}

.box-login .register {
    text-align: center;
    margin-top: 20px;
}

.box-login .register a {
    text-decoration: none;
    color: #86b4ff;
}

 
 </style>
 </head>
<body>
	<div class="wrapper">
		<form class="box-login" action="http://localhost:8081/pbl3/login "
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