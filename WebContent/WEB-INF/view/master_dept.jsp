<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en" ng-app="StarterApp">
<head>


<%@include file="global_css.jsp"%>

<body layout="row" ng-controller="AppCtrl">
	<%@include file="side-nav.jsp"%>


	<div layout="column" class="relative" layout-fill role="main">

		<%@ include file="header.jsp"%>


		<div layout="row" layout-wrap>

			<div flex="25">[flex]25</div>

			<div flex="50">
				[flex]50

				<form ng-controller="DeptCtrl as ctrl" ng-submit="ctrl.submit()"
					name="deptForm">
					<input type="text" name="dept_id" ng-model="ctrl.dept.dept_id" />
					<md-input-container class="md-block"> <label>
						Department Name</label> <input required name="dept_name" ng-model="ctrl.dept.dept_name">
					<div ng-messages="deptForm.name.$error">
						<div ng-message="required">This is required.</div>
					</div>
					</md-input-container>
					<input type="number" name="status" ng-model="ctrl.dept.status" />
					<md-button type="button" ng-click="reset()">RESET</md-button>
					<md-button class="md-primary md-default-theme"
						ng-disabled="deptForm.$invalid">ADD</md-button>
				</form>
				<md-content laout="column" flex> <md-card>
				
				
				
				</md-card> </md-content>
			</div>

			<div flex="25">[flex]25</div>
		</div>

		
	


	
	</div>
	<%@include file="global_js.jsp"%>
	

	<script src="<c:url value='/assets/js/dept_controller.js' />"></script>
	<script src="<c:url value='/assets/js/dept_service.js' />"></script>



</body>
</html>
