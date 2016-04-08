'use strict';
App.factory('DeptService', [
		'$http',
		'$q',
		function($http, $q) {

			return {
				createUser : function(dept) {
					return $http.post(
							'http://localhost:8080/RigorProject/dept_post/',
							dept).then(function(response) {
						
						return response.data;
					}, function(errResponse) {

						//console.error('Error while creating user');
						return $q.reject(errResponse);
					});
				},
			};

		} ]);