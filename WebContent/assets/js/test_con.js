'use strict';
App.controller('AppCtrl2', ['$scope', 'RestService', function($scope, RestService) {
	var self = this;
    self.user={id:null,Name:'',Address:'',Email:''};
    self.users=[];
    
    self.fetchAllUsers = function(){
    	RestService.fetchAllUsers()
            .then(
					       function(d) {
						        self.users = d;
					       },
      					function(errResponse){
      						console.error('Error while fetching Currencies');
      					}
			       );
    };
     
    $scope.submit = function(user){
    	alert("In Con"+ self.user.Name);
    	RestService.createUser(user)
	              .then(
                self.fetchAllUsers, 
			              function(errResponse){
				               console.error('Error while creating User.');
			              }	
            );
    };
	
}]);
/*
	var self=this;
	self.project={id:null,Name:'',Address:'',Email:''};
			$scope.submit = function(project) {
			alert("SUBMIT!");
				 RestService.createUser(project).then(
	                      function(){
	                    	  alert("Success in Con!!!");
	                      }, 
			              function(errResponse){
				             //  console.error('Error while creating User.');
	                    	  alert("ERROR in Con!!!");
	                      });
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
*/