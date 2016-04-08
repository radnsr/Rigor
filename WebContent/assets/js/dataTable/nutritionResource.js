App.factory('$nutrition', ['$http', function ($http) {
  'use strict';

  return {
    desserts: $http.get('https://infinite-earth-4803.herokuapp.com/nutrition/desserts/')
  };
}]);