var app = angular.module("menuApp", []);

app.controller("MenuController", function($scope, $http) {
    $scope.menuItems = [];
    $scope.cart = [];

    // Load menu items from server
    $http.get("GetMenuServlet").then(function(response) {
        $scope.menuItems = response.data;
    });

    $scope.addToCart = function(item) {
        let found = $scope.cart.find(i => i.id === item.id);
        if (found) {
            found.quantity++;
        } else {
            item.quantity = 1;
            $scope.cart.push(item);
        }

        // Save cart to localStorage for persistence
        localStorage.setItem("bitright_cart", JSON.stringify($scope.cart));
    };

    // Load existing cart from storage
    const savedCart = localStorage.getItem("bitright_cart");
    if (savedCart) {
        $scope.cart = JSON.parse(savedCart);
    }
});
