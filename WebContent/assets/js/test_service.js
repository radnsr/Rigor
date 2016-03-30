'use strict';
App.factory('UserService', ['$http', '$q', function($http, $q){
	
	return{
		 createUser: function(project){
			 alert(project);
				return $http.post('http://localhost:8080/RigorProject/user/', project)
						.then(
								function(response){
									return response.data;
								}, 
								function(errResponse){
									console.error('Error while creating user');
									return $q.reject(errResponse);
								}
						);
	    },
	};
}]);