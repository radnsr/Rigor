<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en" ng-app="StarterApp">
<head>
<%@include file="global_css.jsp"%>
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" href="http://rawgit.com/daniel-nagy/md-data-table/master/dist/md-data-table.css">
</head>
<body layout="row" ng-controller="AppCtrl">
	<%@include file="side-nav.jsp"%>


	<div layout="column" class="relative" layout-fill role="main">

		<%@ include file="header.jsp"%>

		<md-content flex md-scroll-y> <ui-view layout="column"
			layout-fill layout-padding>
		<div class="inset" hide-sm></div>

<md-toolbar class="md-table-toolbar md-default">
  <div class="md-toolbar-tools">
    <span>Nutrition</span>
  </div>
</md-toolbar>

   <md-card ng-controller="tableCtrl" >
        
        <md-toolbar class="md-table-toolbar md-default" ng-hide="options.rowSelection && selected.length">
          <div class="md-toolbar-tools">
            <span>Nutrition</span>
            <div flex></div>
            <md-button class="md-icon-button" ng-click="loadStuff()">
              <md-icon>refresh</md-icon>
            </md-button>
          </div>
        </md-toolbar>
        
        <md-toolbar class="md-table-toolbar alternate" ng-show="options.rowSelection && selected.length">
          <div class="md-toolbar-tools">
            <span>{{selected.length}} {{selected.length > 1 ? 'items' : 'item'}} selected</span>
          </div>
        </md-toolbar>
        
        <md-table-container>
          <table md-table md-row-select="options.rowSelection" multiple="{{options.multiSelect}}" ng-model="selected" md-progress="promise">
            <thead ng-if="!options.decapitate" md-head md-order="query.order" md-on-reorder="logOrder">
              <tr md-row>
                <th md-column md-order-by="name"><span>Dessert (100g serving)</span></th>
                <th md-column md-order-by="type"><span>Type</span></th>
                <th md-column md-numeric md-order-by="calories.value" md-desc><span>Calories</span></th>
                <th md-column md-numeric md-order-by="fat.value"><span>Fat (g)</span></th>
                <th md-column md-numeric md-order-by="carbs.value"><span>Carbs (g)</span></th>
                <th md-column md-numeric md-order-by="protein.value"><span>Protein (g)</span></th>
                <th md-column md-numeric md-order-by="sodium.value" hide-gt-xs show-gt-md><span>Sodium (mg)</span></th>
                <th md-column md-numeric md-order-by="calcium.value" hide-gt-xs show-gt-lg><span>Calcium (%)</span></th>
                <th md-column md-numeric md-order-by="iron.value" hide-gt-xs show-gt-lg><span>Iron (%)</span></th>
                <th md-column md-order-by="comment">
                  <md-icon>comments</md-icon>
                  <span>Comments</span>
                </th>
              </tr>
            </thead>
            <tbody md-body>
              <tr md-row md-select="dessert" md-on-select="logItem" md-auto-select="options.autoSelect" ng-disabled="dessert.calories.value > 400" ng-repeat="dessert in desserts.data | filter: filter.search | orderBy: query.order | limitTo: query.limit : (query.page -1) * query.limit">
                <td md-cell>{{dessert.name}}</td>
                <td md-cell>
                  <md-select ng-model="dessert.type" placeholder="Other">
                    <md-option ng-value="type" ng-repeat="type in getTypes()">{{type}}</md-option>
                  </md-select>
                </td>
                <td md-cell>{{dessert.calories.value}}</td>
                <td md-cell>{{dessert.fat.value | number: 2}}</td>
                <td md-cell>{{dessert.carbs.value}}</td>
                <td md-cell>{{dessert.protein.value | number: 2}}</td>
                <td md-cell hide-gt-xs show-gt-md>{{dessert.sodium.value}}</td>
                <td md-cell hide-gt-xs show-gt-lg>{{dessert.calcium.value}}%</td>
                <td md-cell hide-gt-xs show-gt-lg>{{dessert.iron.value}}%</td>
                <td md-cell ng-click="editComment($event, dessert)" ng-class="{'md-placeholder': !dessert.comment}">
                  {{dessert.comment || 'Add a comment'}}
                </td>
              </tr>
            </tbody>
          </table>
        </md-table-container>

        <md-table-pagination md-limit="query.limit" md-limit-options="limitOptions" md-page="query.page" md-total="{{desserts.count}}" md-page-select="options.pageSelect" md-boundary-links="options.boundaryLinks" md-on-paginate="logPagination"></md-table-pagination>
      </md-card>

		</ui-view> </md-content>
	</div>
	<%@include file="global_js.jsp"%>
	
	<script>
	

	App.config(['$mdThemingProvider', function ($mdThemingProvider) {
	    'use strict';
	    
	    $mdThemingProvider.theme('default')
	      .primaryPalette('red');
	}])

	.controller('tableCtrl', ['$mdEditDialog', '$q', '$scope', '$timeout', function ($mdEditDialog, $q, $scope, $timeout) {
	  'use strict';
	  
	  $scope.selected = [];
	  $scope.limitOptions = [5, 10, 15];
	  
	  $scope.options = {
	    rowSelection: true,
	    multiSelect: true,
	    autoSelect: true,
	    decapitate: false,
	    largeEditDialog: false,
	    boundaryLinks: false,
	    limitSelect: true,
	    pageSelect: true
	  };
	  
	  $scope.query = {
	    order: 'name',
	    limit: 5,
	    page: 1
	  };
	  
	  $scope.desserts = {
	    "count": 9,
	    "data": [
	      {
	        "name": "Frozen yogurt",
	        "type": "Ice cream",
	        "calories": { "value": 159.0 },
	        "fat": { "value": 6.0 },
	        "carbs": { "value": 24.0 },
	        "protein": { "value": 4.0 },
	        "sodium": { "value": 87.0 },
	        "calcium": { "value": 14.0 },
	        "iron": { "value": 1.0 }
	      }, {
	        "name": "Ice cream sandwich",
	        "type": "Ice cream",
	        "calories": { "value": 237.0 },
	        "fat": { "value": 9.0 },
	        "carbs": { "value": 37.0 },
	        "protein": { "value": 4.3 },
	        "sodium": { "value": 129.0 },
	        "calcium": { "value": 8.0 },
	        "iron": { "value": 1.0 }
	      }, {
	        "name": "Eclair",
	        "type": "Pastry",
	        "calories": { "value":  262.0 },
	        "fat": { "value": 16.0 },
	        "carbs": { "value": 24.0 },
	        "protein": { "value":  6.0 },
	        "sodium": { "value": 337.0 },
	        "calcium": { "value":  6.0 },
	        "iron": { "value": 7.0 }
	      }, {
	        "name": "Cupcake",
	        "type": "Pastry",
	        "calories": { "value":  305.0 },
	        "fat": { "value": 3.7 },
	        "carbs": { "value": 67.0 },
	        "protein": { "value": 4.3 },
	        "sodium": { "value": 413.0 },
	        "calcium": { "value": 3.0 },
	        "iron": { "value": 8.0 }
	      }, {
	        "name": "Jelly bean",
	        "type": "Candy",
	        "calories": { "value":  375.0 },
	        "fat": { "value": 0.0 },
	        "carbs": { "value": 94.0 },
	        "protein": { "value": 0.0 },
	        "sodium": { "value": 50.0 },
	        "calcium": { "value": 0.0 },
	        "iron": { "value": 0.0 }
	      }, {
	        "name": "Lollipop",
	        "type": "Candy",
	        "calories": { "value": 392.0 },
	        "fat": { "value": 0.2 },
	        "carbs": { "value": 98.0 },
	        "protein": { "value": 0.0 },
	        "sodium": { "value": 38.0 },
	        "calcium": { "value": 0.0 },
	        "iron": { "value": 2.0 }
	      }, {
	        "name": "Honeycomb",
	        "type": "Other",
	        "calories": { "value": 408.0 },
	        "fat": { "value": 3.2 },
	        "carbs": { "value": 87.0 },
	        "protein": { "value": 6.5 },
	        "sodium": { "value": 562.0 },
	        "calcium": { "value": 0.0 },
	        "iron": { "value": 45.0 }
	      }, {
	        "name": "Donut",
	        "type": "Pastry",
	        "calories": { "value": 452.0 },
	        "fat": { "value": 25.0 },
	        "carbs": { "value": 51.0 },
	        "protein": { "value": 4.9 },
	        "sodium": { "value": 326.0 },
	        "calcium": { "value": 2.0 },
	        "iron": { "value": 22.0 }
	      }, {
	        "name": "KitKat",
	        "type": "Candy",
	        "calories": { "value": 518.0 },
	        "fat": { "value": 26.0 },
	        "carbs": { "value": 65.0 },
	        "protein": { "value": 7.0 },
	        "sodium": { "value": 54.0 },
	        "calcium": { "value": 12.0 },
	        "iron": { "value": 6.0 }
	      }
	    ]
	  };
	  
	  $scope.editComment = function (event, dessert) {
	    event.stopPropagation(); // in case autoselect is enabled
	    
	    var editDialog = {
	      modelValue: dessert.comment,
	      placeholder: 'Add a comment',
	      save: function (input) {
	        if(input.$modelValue === 'Donald Trump') {
	          input.$invalid = true;
	          return $q.reject();
	        }
	        if(input.$modelValue === 'Bernie Sanders') {
	          return dessert.comment = 'FEEL THE BERN!'
	        }
	        dessert.comment = input.$modelValue;
	      },
	      targetEvent: event,
	      title: 'Add a comment',
	      validators: {
	        'md-maxlength': 30
	      }
	    };
	    
	    var promise;
	    
	    if($scope.options.largeEditDialog) {
	      promise = $mdEditDialog.large(editDialog);
	    } else {
	      promise = $mdEditDialog.small(editDialog);
	    }
	    
	    promise.then(function (ctrl) {
	      var input = ctrl.getInput();
	      
	      input.$viewChangeListeners.push(function () {
	        input.$setValidity('test', input.$modelValue !== 'test');
	      });
	    });
	  };
	  
	  $scope.toggleLimitOptions = function () {
	    $scope.limitOptions = $scope.limitOptions ? undefined : [5, 10, 15];
	  };
	  
	  $scope.getTypes = function () {
	    return ['Candy', 'Ice cream', 'Other', 'Pastry'];
	  };
	  
	  $scope.loadStuff = function () {
	    $scope.promise = $timeout(function () {
	      // loading
	    }, 2000);
	  }
	  
	  $scope.logItem = function (item) {
	    console.log(item.name, 'was selected');
	  };
	  
	  $scope.logOrder = function (order) {
	    console.log('order: ', order);
	  };
	  
	  $scope.logPagination = function (page, limit) {
	    console.log('page: ', page);
	    console.log('limit: ', limit);
	  }
	}]);
	</script>
	</body>
</html>