<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Login Page</title>
<link rel="stylesheet"
	href="https://ajax.googleapis.com/ajax/libs/angular_material/0.8.3/angular-material.min.css">
<link rel="stylesheet" href="<c:url value='/assets/css/login.css' />" />
</head>
<body>
	<hgroup>
		<h1>Login Page</h1>
		<h3>for</h3>
	</hgroup>
	<form>
		<div class="group">
			<input type="text"><span class="highlight"></span><span
				class="bar"></span> <label>User Name</label>
		</div>
		<div class="group">
			<input type="password"><span class="highlight"></span><span
				class="bar"></span> <label>Password</label>
		</div>
		<button type="button" class="button buttonBlue">
			Login
			<div class="ripples buttonRipples">
				<span class="ripplesCircle"></span>
			</div>
		</button>
	</form>
	<footer>
		<a href="http://www.polymer-project.org/" target="_blank"><img
			src="http://www.virtusa.com/common/img/logos/virtusa_tag_logo_lg.svg"></a>
		<p>Copyright © 2016 Virtusa Corporation. All Rights Reserved.</p>
	</footer>
	<script
		src="https://ajax.googleapis.com/ajax/libs/angularjs/1.3.6/angular.min.js"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/angularjs/1.3.6/angular-animate.min.js"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/angularjs/1.3.5/angular-aria.min.js"></script>

	<script
		src="https://ajax.googleapis.com/ajax/libs/angular_material/0.8.3/angular-material.min.js"></script>

	<script
		src="https://cdn.jsdelivr.net/angular-material-icons/0.4.0/angular-material-icons.min.js"></script>
</body>
</html>