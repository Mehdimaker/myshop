app = angular.module('app', []);
app.controller('appCtrl',['$scope', '$http', function ($scope, $http) {
  
  $scope.products=[];
  $http.get("/products.json").success(function (data) {
        $scope.products = data;
  });

//Uncheck
function uncheck() {
    document.getElementById("checkbox").checked = false;
} 
uncheck();
//Selection
  $scope.pselecteds=[];

  $scope.addselected = function(id){
 //essayer de concatener $scope.select + id 
    var test = false;
    angular.forEach($scope.pselecteds, function (pselected, index) {
      if (id == pselected.id){
        $scope.pselecteds.splice(index, 1);
        test = true;
      };
    });
    if (test == false){
      angular.forEach($scope.products, function (product, index) {
        if (id == product.id){
          $scope.pselecteds.push(product);
        };
      });
    };
    
  };

}]);
