var app = angular.module('biteRightApp', []);

app.controller('registerController', function($scope) {
    console.log("Register Controller Loaded");
});

app.controller('loginController', function($scope) {
    console.log("Login Controller Loaded");
});



app.controller('menuController', function($scope, $http) {
    $scope.menuItems = [];

    $http.get('MenuServlet')
        .then(function(response) {
            $scope.menuItems = response.data;
        }, function(error) {
            console.error('Error fetching menu:', error);
        });

    $scope.addToCart = function(menuId) {
        $http.post('CartServlet', { action: 'add', menuId: menuId })
            .then(function(response) {
                alert('Item added to cart!');
            }, function(error) {
                console.error('Error adding to cart:', error);
            });
    };
});

app.controller('cartController', function($scope, $http) {
    $scope.cartItems = [];
    $scope.totalPrice = 0;

    $http.get('CartServlet?action=view')
        .then(function(response) {
            $scope.cartItems = response.data.cartItems;
            $scope.totalPrice = response.data.totalPrice;
        }, function(error) {
            console.error('Error fetching cart:', error);
        });

    $scope.placeOrder = function() {
        $http.post('OrderServlet', { action: 'place' })
            .then(function(response) {
                alert('Order placed successfully!');
                window.location.href = 'orders.jsp';
            }, function(error) {
                console.error('Error placing order:', error);
            });
    };
});

app.controller('ordersController', function($scope, $http) {
    $scope.orders = [];

    $http.get('OrderServlet?action=list')
        .then(function(response) {
            $scope.orders = response.data;
        }, function(error) {
            console.error('Error fetching orders:', error);
        });
});
