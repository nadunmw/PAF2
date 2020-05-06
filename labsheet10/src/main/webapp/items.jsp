<%@page import="com.labsheet10.Item"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="Views/bootstrap.min.css">
<script src="Components/jquery-3.2.1.min.js"></script>
<script src="Components/bootstrap.min.js"></script>
<script src="Components/items.js"></script>

</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-6">
				<h1>Patience Registration</h1>
				<form id="formItem" name="formItem">
					FIRST NAME: <input id="fname" name="fname" type="text"
						class="form-control form-control-sm"> <br> 
						LAST NAME:<input id="lname" name="lname" type="text"
						class="form-control form-control-sm"> <br> 
					NIC: <input id="nic" name="nic" type="text"
						class="form-control form-control-sm"> <br>
					DOB: <input id="dob" name="dob" type="text"
						class="form-control form-control-sm"> <br>
						PASSWORD: <input id="pw" name="pw" type="text"
						class="form-control form-control-sm"> <br> <input
						id="btnSave" name="btnSave" type="button" value="Save"
						class="btn btn-primary"> <input type="hidden"
						id="hidItemIDSave" name="hidItemIDSave" value="">
				</form>
				
				<div id="alertSuccess" class="alert alert-success"></div>
				<div id="alertError" class="alert alert-danger"></div>
				<br>
				
				<div id="divItemsGrid">
					<%
						Item itemObj = new Item();
					out.print(itemObj.readItems());
					%>
				</div>
			</div>
		</div>
	</div>
</html>