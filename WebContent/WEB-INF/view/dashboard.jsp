<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en" ng-app="StarterApp">
<head>
<%@include file="global_css.jsp"%>
</head>
<body layout="row" ng-controller="AppCtrl">
	<%@include file="side-nav.jsp"%>


	<div layout="column" class="relative" layout-fill role="main">

		<%@ include file="header.jsp"%>

		<md-content flex md-scroll-y> <ui-view layout="column"
			layout-fill layout-padding>
		<div class="inset" hide-sm></div>

		</ui-view> </md-content>
	</div>
	<%@include file="global_js.jsp"%>
</body>
</html>