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
                                <button class="button_delete button_delete1 "  id_cam="<%= cameraProject.get(i).getCamera_ID() %>"  >Xóa</button>
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
                            <button type="submit" id="btn_add_cam" onclick="saveProduct()">Save</button>
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
                                <button class="button_fix" onclick="edit2(this)">Sửa</button>
                                <button class="button_delete "  id_user="<%= user.get(i).getUsers_ID() %>">Xóa</button>
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
                            <button type="submit"  id="btn_add" onclick="saveUser()">Save</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
     <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    

    <script >
    	$(document).ready(function(){
    		$('.button_delete').click(function(){
    			var id = $(this).attr("id_user")
    			var row =$(this).closest('.tr_class')
    			$.ajax({
    				method:"POST",
    				url:"http://localhost:8081/pbl3/api/deleteuser",
    				data:{id:id}
    			}).done(function(data){
    					row.remove()
    				
    			});
    			
    		})
    		
    		$('.button_delete1').click(function(){
    			var id = $(this).attr("id_cam")
    			var row =$(this).closest('.tr_class1')
    			$.ajax({
    				method:"POST",
    				url:"http://localhost:8081/pbl3/api/deletecamera",
    				data:{id:id}
    			}).done(function(data){
    					row.remove()
    				
    			});
    			
    		})
    		
    		$('#btn_add').click(function(e){
    			e.preventDefault()
    			var user_name = $('#Users_name').val()
    			var full_name = $('#Full_name').val()
    			var email = $('#Email').val()
				var phone = $('#Phone').val()
    			var password = $('#Password').val()
    			var role = $('#Role').val()
    			var row =$(this).closest('.tbody_class')
    			$.ajax({
    				method:"POST",
    				url:"http://localhost:8081/pbl3/api/adduser",
    				data:{
    					username:user_name,
    					fullname:full_name,
    					email:email,
    					phone:phone,
    					password:password,
    					roleid:role
    				}
    			}).done(function(data){
    				
    			});
    			
    		})
    		
    		$('#btn_add_cam').click(function(ev){
    			ev.preventDefault()
    			var camera_name = $('#Camera_name').val()
    			var ip_adress = $('#IP_address').val()
    			var status = $('#Status').val()
				var project_name = $('#Project').val()
    			$.ajax({
    				method:"POST",
    				url:"http://localhost:8081/pbl3/api/addcamera",
    				data:{
    					cameraame:camera_name,
    					ipadress:ip_adress,
    					status:status,
    					projectname:project_name
    				}
    			}).done(function(data){
    				
    			});
    			
    		})
    		
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

        function closeModal() {
            document.getElementById('modal').style.display = 'none';
        }

        function openModal2() {
            document.getElementById('modal2').style.display = 'block';
            document.getElementById('New_User_Form').reset();
            document.getElementById('editIndex2').value = '';
        }

        function closeModal2() {
            document.getElementById('modal2').style.display = 'none';
        }

        
        function edit2(button) {
            const row = button.parentNode.parentNode;
            const cells = row.getElementsByTagName('td');
            document.getElementById('editIndex2').value = row.rowIndex;
            document.getElementById('Users_name').value = cells[1].textContent;
            document.getElementById('Full_name').value = cells[2].textContent;
            document.getElementById('Email').value = cells[3].textContent;
            document.getElementById('Phone').value = cells[4].textContent;
            document.getElementById('Role').value = cells[5].textContent;
            document.getElementById('modalTitle2').textContent = 'Sửa Người Dùng';
            document.getElementById('modal2').style.display = 'block';
        }
        
        
        
        function saveUser() {
        const index = document.getElementById('editIndex2').value;
        const table = document.getElementById('userTable').getElementsByTagName('tbody')[0];
        const newRow = index ? table.rows[index - 1] : table.insertRow();
        newRow.innerHTML = `
            <td>${index || table.rows.length}</td>
            <td>${document.getElementById('Users_name').value}</td>
            <td>${document.getElementById('Full_name').value}</td>
            <td>${document.getElementById('Email').value}</td>
            <td>${document.getElementById('Phone').value}</td>
            <td>${document.getElementById('Role').value}</td>
            <td>
	            <button class="button_add" onclick="openModal2()">Thêm mới</button>
	            <button class="button_fix" onclick="edit2(this)">Sửa</button>
	            <button class="button_delete "  %>">Xóa</button>
            </td>
        `;
        closeModal2();
    	}
        
        
        function saveProduct() {
            const index = document.getElementById('editIndex').value;
            const table = document.getElementById('productTable').getElementsByTagName('tbody')[0];
            const newRow = index ? table.rows[index - 1] : table.insertRow();
            newRow.innerHTML = `
                <td>${index || table.rows.length}</td>
                <td>${document.getElementById('Camera_name').value}</td>
                <td>${document.getElementById('IP_address').value}</td>
                <td>${document.getElementById('Status').value}</td>
                <td>${document.getElementById('Project').value}</td>
                <td>
                    <button class="button_add" onclick="openModal()">Thêm mới</button>
                    <button onclick="edit(this)">Sửa</button>
                    <button onclick="deleteRow(this)">Xóa</button>
                </td>
            `;
            closeModal();
        }
    

    </script>
</body>
</html>
    