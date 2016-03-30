<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en" ng-app="StarterApp">
<head>
<%@ include file="global_css.jsp"%>

</head>

<body layout="row" ng-controller="AppCtrl">

	<%@include file="side-nav.jsp"%>

	<div layout="column" class="relative" layout-fill role="main">

		<%@ include file="header.jsp"%>
		<md-toolbar class="md-warn">
		<div class="md-toolbar-tools">
			<h2 class="md-flex">Toolbar: md-warn</h2>
		</div>
		</md-toolbar>
		<div  layout="column" ng-cloak>
			<md-content layout-padding>

			<form name="projectForm">

				<md-input-container class="md-block"> <label>Client
					Name</label> <input required name="clientName"
					ng-model="project.clientName">
				<div ng-messages="projectForm.clientName.$error">
					<div ng-message="required">This is required.</div>
				</div>
				</md-input-container>
				<md-input-container class="md-block"> <label>Client
					Email</label> <input required type="email" name="clientEmail"
					ng-model="project.clientEmail" minlength="5" maxlength="50"
					ng-pattern="/^.+@.+\..+$/" />
				<div ng-messages="projectForm.clientEmail.$error" >
				<div ng-message="required">This is required.</div>
				<div ng-message="minlength">Minimum length is 5.</div>
				<div ng-message="pattern">Not look like an e-mail address.</div>
				<div ng-message="maxlength">Maximum length is 50.</div>
				
				</div>
				</md-input-container>

			</form>
			</md-content>
		</div>
	</div>
	<%@ include file="global_js.jsp"%>

	<script src="<c:url value='/assets/js/user_service/user_service.js' />"></script>
	<script
		src="<c:url value='/assets/js/user_service/user_controller.js' />"></script>



</body>
</html>