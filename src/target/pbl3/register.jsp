<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="./css/register.css">
</head>
<body>
    <div class="wrapper">
        <form class="box-register" action="http://localhost:8080/pbl3/register " method="post">
            <div class="title">
                <h3>Sign Up</h3>
            </div>
            <hr>
            <div class="box-input">
                <input type="text" id="Username" name="Username"/>
                <span class="title-input">Username</span>
                <div class="errorMessages"></div>
            </div>
            <div class="box-input">
                <input type="text" id="Fullname" name="Fullname"/>
                <span class="title-input">Fullname</span>
                <div class="errorMessages"></div>
            </div>
            <div class="box-input">
                <input type="text" id="Email" name="Email"/>
                <span class="title-input">Email</span>
                <div class="errorMessages"></div>
            </div>
            <div class="box-input">
                <input type="text" id="Phone" name="Phone"/>
                <span class="title-input">Phone</span>
                <div class="errorMessages"></div>
            </div>
            <div class="box-input">
                <input type="password" id="password" name="Password" required/>
                <span class="title-input">Password</span>
                <div class="errorMessages"></div>
            </div>
            <div class="box-input">
                <input type="password" id="Confirm-password" name="Confirm-password" required/>
                <span class="title-input">Confirm Password</span>
                <div class="errorMessages"></div>
            </div>
            <div class="button-signup">
                <button type="submit" value="Sign Up"> Sign Up</button>
            </div>
            <div class="button-goback">
                <button>
                    Go Back
                </button>
            </div>
        </form>
    </div>
    
    <script src="./js/register.js"></script>
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
    <script>
        Validator({
            form:'.box-register',
            formGroupSelector :'.box-input',
            errorSelector :'.errorMessages',
            rules:[
                Validator.isRequired('#Username'),
                Validator.isRequired('#Fullname'),
                Validator.isEmail('#Email'),
                Validator.isRequired('#Phone'),
                Validator.minLength('#password',6),
                Validator.isRequired('#Confirm-password'),
                Validator.isConfirmed('#Confirm-password',function(){
                    return document.querySelector('#password').value;
                },'Mật Khẩu nhập lại không chính xác')
            ],
            onsubmit: function(data){
                console.log(data);
            }
        })
    </script>
</body>
</html>