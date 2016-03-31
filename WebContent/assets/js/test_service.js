'use strict';
App.factory('RestService', [
		'$http',
		'$q',
		function($http, $q) {

			return {
				createUser : function($scope,user) {
					alert("In Service"+ $scope.user.Name);
					return $http.post(
							'http://localhost:8080/RigorProject/user_post/',
							project).then(function(response) {
								alert("Success in service");
						return response.data;
					}, function(errResponse) {
						alert("Error in service");
						// console.error('Error while creating user');
						return $q.reject(errResponse);
					});
				},
			};
			return {
				create : function(project) {
					alert(project);
					// Simple GET request example :
					return $http.post('/someUrl', project).then(
							function(response) {
								// this callback will be called asynchronously
								// when the
								// response is available
							}, function(response) {
								// this callback will be called asynchronously
								// if an
								// error occurs or server returns response with
								// an error
								// status.
							});
				},
			};
		} ]);