'use strict';
App.controller('AppCtrl2', [ '$scope', 'UserService',
		function($scope, UserService) {
	//$scope.project;
			$scope.submit = function(project) {
			
				 UserService.createUser(project);
				 
				
			};
			$scope.reset = function() {
				$scope.project = {
					Name : "",
					Address : "",
					Email : ""
				}
			};
			$scope.reset();

		} ]);
