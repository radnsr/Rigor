'use strict';
App.controller('DeptCtrl', [
		'$scope',
		'DeptService',
		function($scope, DeptService) {
			var self = this;
			self.dept = {
				dept_id : '',
				dept_name : '',
				status : ''
			};
			self.depts = [];

			self.fetchAllUsers = function() {
				// RestService.fetchAllUsers()
				// alert("FETCH!!");

			};

			self.createUser = function(dept) {

				DeptService.createUser(dept).then(self.fetchAllUsers,
						function(errResponse) {

							console.log(errResponse.data);
						});
			};
			self.submit = function() {

				console.log('Saving New User', self.dept);
				self.createUser(self.dept);

				self.reset();
			};
			self.reset = function() {
				self.dept = {
					dept_id : '',
					dept_name : '',
					status : 0
				};
				$scope.deptForm.$setPristine(); // reset Form
			};

		} ]);