<%@page import="model.CameraProject"%>
<%@page import="model.Users"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="./css/manage.css">
    
    <title>Document</title>
</head>
<%
List<Users> user=(List<Users>) request.getAttribute("User");

List<CameraProject> cameraProject=(List<CameraProject>) request.getAttribute("CameraProject");
%>
<body>
    <div id="header"></div>
    <div class="wrapper">
        <div class="box-title">
            <span>Manage</span>
        </div>
        <div class="manage-cctv">
            <div class="manage-title">
                <h3>Manage CCTV</h3>
            </div>
            <div class="manage-conten">
                <table id="productTable">
                    <thead>
                        <tr>
                            <th>Camera_ID</th>
                            <th>Camera_name</th>
                            <th>IP_address</th>
                            <th>Status</th>
                            <th>Project</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                    <%for(int i=0;i<cameraProject.size();i++){ %>
                        <tr class="tr_class1">
                            <td><%= (i+1) %></td>
                            <td><%= cameraProject.get(i).getCamera_name() %></td>
                            <td><%= cameraProject.get(i).getIP_address() %></td>
                            <td><%= cameraProject.get(i).getStastus() %></td>
                            <td><%= cameraProject.get(i).getProject_name() %></td>
                            <td>
                                <button class="button_add" onclick="openModal()">Thêm mới</button>
                                <button class="button_delete button_delete1"  id_cameras="<%= cameraProject.get(i).getCamera_ID() %>"  >Xóa</button>
                            </td>
                        </tr>
                        <%} %>

                    </tbody>
                </table>

                <div id="modal" class="modal">
                    <div class="modal-content">
                        <span class="close" onclick="closeModal()">&times;</span>
                        <h2 id="modalTitle">Add Camera</h2>
                        <form id="New_Product_Form">
                            <input type="hidden" id="editIndex">
                            <label for="Camera_name">Camera Name:</label>
                            <input type="text" id="Camera_name" name="cameraame" required><br>
                            <label for="IP_address">IP_address:</label>
                            <input type="text" id="IP_address" name="ipadress" required><br>
                            <label for="Status">Status:</label>
                            <input type="text" id="Status" name="status" required><br>
                            <label for="Project">Project:</label>
                            <input type="text" id="Project" name="projectname" required><br>
                            <button type="submit" id="btn_add_cam" onclick="saveCamera(event)">Save</button>
                        </form>
                        
                    </div>
                </div>
            </div>
        </div>
        <div class="manage-user">
            <div class="manage-title">
                <h3>Manage User</h3>
            </div>
            <div class="manage-conten">
                <table id="userTable">
                    <thead>
                        <tr>
                            <th>Users_ID</th>
                            <th>Users_name</th>
                            <th>Full_name</th>
                            <th>Email</th>
                            <th>Phone</th>
                            <th>Role</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody class="tbody_class">
                    <%for(int i=0;i<user.size();i++) {%>
                        <tr class="tr_class">
                            <td><%=(i+1) %></td>
                            <td><%= user.get(i).getUsers_name() %></td>
                            <td><%= user.get(i).getFull_name() %></td>
                            <td><%= user.get(i).getEmail() %></td>
                            <td><%= user.get(i).getPhone() %></td>
                            <td><%= user.get(i).getRole_ID() %></td>
                            <td>
                                <button class="button_add" onclick="openModal2()">Thêm mới</button>
                                <button class="button_fix" onclick="edit2(this)"  id_user1="<%= user.get(i).getUsers_ID() %>" >Sửa</button>
                                <button class="button_delete button_delete2" onclick="deleteRow2(this)" id_user="<%= user.get(i).getUsers_ID() %>">Xóa</button>
                            </td>
                        </tr>
                        <%} %>
                    </tbody>
                </table>
                <div id="modal2" class="modal">
                    <div class="modal-content">
                        <span class="close" onclick="closeModal2()">&times;</span>
                        <h2 id="modalTitle2">Add Users</h2>
                        <form id="New_User_Form">
                            <input type="hidden" id="editIndex2">
                            <label for="Users_name">Users_name:</label>
                            <input type="text" id="Users_name" name="username" required><br>
                            <label for="Full_name">Full_name:</label>
                            <input type="text" id="Full_name" name="fullname" required><br>
                            <label for="Email">Email:</label>
                            <input type="text" id="Email" name="email" required><br>
                            <label for="Phone">Phone:</label>
                            <input type="text" id="Phone" name="phone" required><br>
                            <label for="Phone">Password:</label>
                            <input type="text" id="Password" name="password" required><br>
                            <label for="Role">Role:</label>
                            <input type="text" id="Role" name="roleid" required><br>
                            <button type="submit"  id="btn_add" onclick="saveUser(event)">Save</button>
                        </form>
                    </div>
                </div>
                
                <div id="modal3" class="modal">
				    <div class="modal-content">
				        <span class="close" onclick="closeModal3()">&times;</span>
				        <h2 id="modalTitle3">Add Users</h2>
				        <form id="New_User_Form">
				            <input type="hidden" id="editIndex3">
				            <input type="hidden" id="User_ID3" name="userid">
				            <label for="Users_name">Users_name:</label>
				            <input type="text" id="Users_name3" name="username" required><br>
				            <label for="Full_name">Full_name:</label>
				            <input type="text" id="Full_name3" name="fullname" required><br>
				            <label for="Email">Email:</label>
				            <input type="text" id="Email3" name="email" required><br>
				            <label for="Phone">Phone:</label>
				            <input type="text" id="Phone3" name="phone" required><br>
				            <label for="Password">Password:</label>
				            <input type="text" id="Password3" name="password" required><br>
				            <label for="Role">Role:</label>
				            <input type="text" id="Role3" name="roleid" required><br>
				            <button type="submit" onclick="saveModifyUser(event)">Save</button>
				        </form>
				    </div>
				</div>
                
                
            </div>
        </div>
    </div>
     <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    

    <script >
    	$(document).ready(function(){
    		$('.button_delete2').click(function(){
    			var id = $(this).attr("id_user")
    			var row =$(this).closest('.tr_class')
    			$.ajax({
    				method:"POST",
    				url:"http://localhost:8081/pbl3/api/deleteuser",
    				data:{id:id}
    			}).done(function(data){
    					alert('Row deleted');
    					row.remove()
    			}).fail(function() {
    	            alert('Failed to delete user');
    	        });
    			
    		});
    		
    		$('.button_delete1').click(function(){
    			var id = $(this).attr("id_cameras")
    			var row =$(this).closest('.tr_class1')
    			$.ajax({
    				method:"POST",
    				url:"http://localhost:8081/pbl3/api/deletecamera",
    				data:{idcamera:id}
    			}).done(function(data){
    					alert('Row deleted');
    					row.remove()
    			}).fail(function() {
    	            alert('Failed to delete camera');
    	        });
    			
    		});
    		    		
    	})
    </script>

    <script>
        fetch('./header.jsp')
            .then(response => response.text())
            .then(data => {
                document.getElementById('header').innerHTML = data;
            })
            .catch(error => console.error('Error fetching header:', error));

        function openModal() {
            document.getElementById('modal').style.display = 'block';
            document.getElementById('New_Product_Form').reset();
            document.getElementById('editIndex').value = '';
        }
        function openModal2() {
            document.getElementById('modal2').style.display = 'block';
            document.getElementById('New_User_Form').reset();
            document.getElementById('editIndex2').value = '';
        }

        
        function closeModal() {
            document.getElementById('modal').style.display = 'none';
        }
        function closeModal2() {
            document.getElementById('modal2').style.display = 'none';
        }
        function closeModal3() {
            document.getElementById('modal3').style.display = 'none';
        }

        
        function edit2(button) {
            const row = button.parentNode.parentNode;
            const cells = row.getElementsByTagName('td');
            const userId = $(button).attr('id_user1');
            document.getElementById('editIndex3').value = row.rowIndex;
            document.getElementById('User_ID3').value = userId; 
            document.getElementById('Users_name3').value = cells[1].textContent;
            document.getElementById('Full_name3').value = cells[2].textContent;
            document.getElementById('Email3').value = cells[3].textContent;
            document.getElementById('Phone3').value = cells[4].textContent;
            document.getElementById('Role3').value = cells[5].textContent;
            document.getElementById('modalTitle3').textContent = 'Sửa Người Dùng';
            document.getElementById('modal3').style.display = 'block';
        }

        
        
        
        function saveUser(event) {
            event.preventDefault();
            var user_name = $('#Users_name').val();
            var full_name = $('#Full_name').val();
            var email = $('#Email').val();
            var phone = $('#Phone').val();
            var password = $('#Password').val();
            var role = $('#Role').val();

            $.ajax({
                method: "POST",
                url: "http://localhost:8081/pbl3/api/adduser",
                data: {
                    username: user_name,
                    fullname: full_name,
                    email: email,
                    phone: phone,
                    password: password,
                    roleid: role
                }
            }).done(function(data) {
                $('#userTable tbody').append(`
                    <tr class="tr_class">
                        <td>${$('#userTable tbody tr').length + 1}</td>
                        <td>${user_name}</td>
                        <td>${full_name}</td>
                        <td>${email}</td>
                        <td>${phone}</td>
                        <td>${role}</td>
                        <td>
                            <button class="button_add" onclick="openModal2()">Thêm mới</button>
                            <button class="button_fix" onclick="edit2(this)">Sửa</button>
                            <button class="button_delete" onclick="deleteRow2(this)" id_user="${data.userId}">Xóa</button>
                        </td>
                    </tr>
                `);
                alert('User added successfully');
                closeModal2();
            }).fail(function() {
                alert('Failed to add user');
            });
        }
        
        
        function saveCamera(event) {
            event.preventDefault();
            var camera_name = $('#Camera_name').val();
            var ip_address = $('#IP_address').val();
            var status = $('#Status').val();
            var project = $('#Project').val();

            $.ajax({
                method: "POST",
                url: "http://localhost:8081/pbl3/api/addcamera",
                data: {
                	cameraame: camera_name,
                    ipadress: ip_address,
                    status: status,
                    projectname: project
                }
            }).done(function(data) {
                $('#productTable tbody').append(`
                    <tr class="tr_class1">
                        <td>${$('#productTable tbody tr').length + 1}</td>
                        <td>${camera_name}</td>
                        <td>${ip_address}</td>
                        <td>${status}</td>
                        <td>${project}</td>
                        <td>
                            <button class="button_add" onclick="openModal()">Thêm mới</button>
                            <button class="button_delete button_delete1" id_cam="${data.cameraId}">Xóa</button>
                        </td>
                    </tr>
                `);
                alert('Camera added successfully');
                closeModal(); 
            }).fail(function() {
                alert('Failed to add camera');
            });
        }

		 function saveModifyUser(event) {
			    event.preventDefault();
			    var user_id = $('#User_ID3').val(); 
			    var user_name = $('#Users_name3').val();
			    var full_name = $('#Full_name3').val();
			    var email = $('#Email3').val();
			    var phone = $('#Phone3').val();
			    var password = $('#Password3').val();
			    var role = $('#Role3').val();
		
			    var url = "http://localhost:8081/pbl3/api/modifyuser";
		
			    $.ajax({
			        method: "POST",
			        url: url,
			        data: {
			            userid: user_id,
			            username: user_name,
			            fullname: full_name,
			            email: email,
			            phone: phone,
			            password: password,
			            roleid: role
			        }
			    }).done(function(data) {
			       
			        $('#userTable tbody tr').each(function() {
			            var row = $(this);
			            var id = row.find('.button_fix').attr('id_user1'); 
			            if (id == user_id) {
			                row.find('td').eq(1).text(user_name);
			                row.find('td').eq(2).text(full_name);
			                row.find('td').eq(3).text(email);
			                row.find('td').eq(4).text(phone);
			                row.find('td').eq(5).text(role);
			                return false; 
			            }
			        });
			        alert('User updated successfully');
			        closeModal3();
			    }).fail(function() {
			        alert('Failed to update user');
			    });
			}

    </script>
</body>
</html>
    