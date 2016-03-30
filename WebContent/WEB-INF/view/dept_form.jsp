<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en" ng-app="myApp">
<head>
<%@ include file="global_css.jsp"%>
</head>
<body layout="row" >

	<%@include file="side-nav.jsp"%>

	<div layout="column" class="relative" layout-fill role="main">

		<%@ include file="header.jsp"%>

		<md-content flex md-scroll-y> <ui-view layout="column"
			layout-fill layout-padding>
		<div class="inset" hide-sm></div>

		<div class="generic-container" ng-controller="UserController as ctrl">
			<div class="panel panel-default">
				<div class="panel-heading">
					<span class="lead">User Registration Form </span>
				</div>
				<div class="formcontainer">
					<form ng-submit="ctrl.submit()" name="myForm"
						class="form-horizontal">
						<input type="hidden" ng-model="ctrl.user.id" />
						<div class="row">
							<div class="form-group col-md-12">
								<label class="col-md-2 control-lable" for="file">Name</label>
								<div class="col-md-7">
									<input type="text" ng-model="ctrl.user.username" name="uname"
										class="username form-control input-sm"
										placeholder="Enter your name" required ng-minlength="3" />
									<div class="has-error" ng-show="myForm.$dirty">
										<span ng-show="myForm.uname.$error.required">This is a
											required field</span> <span ng-show="myForm.uname.$error.minlength">Minimum
											length required is 3</span> <span ng-show="myForm.uname.$invalid">This
											field is invalid </span>
									</div>
								</div>
							</div>
						</div>


						<div class="row">
							<div class="form-group col-md-12">
								<label class="col-md-2 control-lable" for="file">Address</label>
								<div class="col-md-7">
									<input type="text" ng-model="ctrl.user.address"
										class="form-control input-sm"
										placeholder="Enter your Address. [This field is validation free]" />
								</div>
							</div>
						</div>

						<div class="row">
							<div class="form-group col-md-12">
								<label class="col-md-2 control-lable" for="file">Email</label>
								<div class="col-md-7">
									<input type="email" ng-model="ctrl.user.email" name="email"
										class="email form-control input-sm"
										placeholder="Enter your Email" required />
									<div class="has-error" ng-show="myForm.$dirty">
										<span ng-show="myForm.email.$error.required">This is a
											required field</span> <span ng-show="myForm.email.$invalid">This
											field is invalid </span>
									</div>
								</div>
							</div>
						</div>

						<div class="row">
							<div class="form-actions floatRight">
								<input type="submit"
									value="{{!ctrl.user.id ? 'Add' : 'Update'}}"
									class="btn btn-primary btn-sm" ng-disabled="myForm.$invalid">
								<button type="button" ng-click="ctrl.reset()"
									class="btn btn-warning btn-sm" ng-disabled="myForm.$pristine">Reset
									Form</button>
							</div>
						</div>
					</form>
				</div>
			</div>
			</div>

		</ui-view> </md-content>
	</div>
	<%@ include file="global_js.jsp"%>
	<script src="<c:url value='/assets/js/user_service/user_service.js' />"></script>
	<script src="<c:url value='/assets/js/user_service/user_controller.js' />"></script>


</body>
</html>