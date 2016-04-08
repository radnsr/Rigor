<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en" ng-app="StarterApp">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>md-data-table</title>

<%@include file="global_css.jsp"%>
<link href="<c:url value='/assets/css/icons.css' />" rel="stylesheet" type="text/css" />
<link href="<c:url value='/assets/css/app.css' />" rel="stylesheet" type="text/css" />

</head>

<body layout="column">

	<md-toolbar>
	<div class="md-toolbar-tools" layout-align="space-between">
		<div class="md-title">Material Design Data Table</div>
	</div>
	</md-toolbar>

	<md-content layout="column" flex> <md-card ng-controller="nutritionController">
		
		
<md-toolbar class="md-table-toolbar md-default" ng-hide="selected.length || filter.show">
  <div class="md-toolbar-tools">
    <h2 class="md-title">Nutrition</h2>
    <div flex></div>
    <md-button class="md-icon-button" ng-click="filter.show = true">
      <md-icon>filter_list</md-icon>
    </md-button>
    <md-button class="md-icon-button" ng-click="addItem($event)">
      <md-icon>local_dining</md-icon>
    </md-button>
  </div>
</md-toolbar>

<md-toolbar class="md-table-toolbar md-default" ng-show="filter.show && !selected.length">
  <div class="md-toolbar-tools">
    <md-icon>search</md-icon>
    <form flex name="filter.form">
      <input type="text" ng-model="query.filter" ng-model-options="filter.options" placeholder="search">
    </form>
    <md-button class="md-icon-button" ng-click="removeFilter()">
      <md-icon>close</md-icon>
    </md-button>
  </div>
</md-toolbar>

<md-toolbar class="md-table-toolbar alternate" ng-show="selected.length">
  <div class="md-toolbar-tools" layout-align="space-between">
    <div>{{selected.length}} {{selected.length > 1 ? 'items' : 'item'}} selected</div>
    <md-button class="md-icon-button" ng-click="delete($event)">
      <md-icon>delete</md-icon>
    </md-button>
  </div>
</md-toolbar>

<md-table-container>
  <table md-table md-row-select multiple ng-model="selected" md-progress="promise">
    <thead md-head md-order="query.order" md-on-reorder="getDesserts">
      <tr md-row>
        <th md-column md-order-by="nameToLower"><span>Dessert (100g serving)</span></th>
        <th md-column md-numeric md-order-by="calories.value"><span>Calories</span></th>
        <th md-column md-numeric>Fat (g)</th>
        <th md-column md-numeric>Carbs (g)</th>
        <th md-column md-numeric>Protein (g)</th>
        <th md-column md-numeric>Sodium (mg)</th>
        <th md-column md-numeric>Calcium (%)</th>
        <th md-column md-numeric>Iron (%)</th>
      </tr>
    </thead>
    <tbody md-body>
      <tr md-row md-select="dessert" md-select-id="name" md-auto-select ng-repeat="dessert in desserts.data">
        <td md-cell>{{dessert.name}}</td>
        <td md-cell>{{dessert.calories.value}}</td>
        <td md-cell>{{dessert.fat.value | number: 1}}</td>
        <td md-cell>{{dessert.carbs.value}}</td>
        <td md-cell>{{dessert.protein.value | number: 1}}</td>
        <td md-cell>{{dessert.sodium.value}}</td>
        <td md-cell>{{dessert.calcium.value}}{{dessert.calcium.unit}}</td>
        <td md-cell>{{dessert.iron.value}}{{dessert.iron.unit}}</td>
      </tr>
    </tbody>
  </table>
</md-table-container>

<md-table-pagination md-limit="query.limit" md-limit-options="[5, 10, 15]" md-page="query.page" md-total="{{desserts.count}}" md-on-paginate="getDesserts" md-page-select></md-table-pagination>
		
		
		</md-card> <footer layout="column"
		layout-align="end"> <footer-content layout="row"
		layout-align="start center" layout-wrap>
	<div layout="row" layout-align="start center">
		<span>Made with&nbsp;</span>
		<md-icon class="material-icons md-18">favorite</md-icon>
		<span>&nbsp;by Daniel Nagy</span>
	</div>
	<div layout="row" layout-align="start center">
		<div>Version 0.10.4</div>
		<a href="https://github.com/daniel-nagy/md-data-table" target="_blank">GitHub</a>
	</div>
	</footer-content> </footer> </md-content>

	<%@include file="global_js.jsp" %>

	<script src="<c:url value='/assets/js/dataTable/app.js' />"></script>
	<script src="<c:url value='/assets/js/dataTable/addItemController.js' />"></script>
	<script src="<c:url value='/assets/js/dataTable/deleteController.js' />"></script>
	<script src="<c:url value='/assets/js/dataTable/nutritionController.js' />"></script>
	<script src="<c:url value='/assets/js/dataTable/authorizeResource.js' />"></script>
	<script src="<c:url value='/assets/js/dataTable/nutritionResource.js' />"></script>



</body>
</html>