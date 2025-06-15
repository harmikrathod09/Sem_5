class EcommerceModel{
  List<Map<String, dynamic>> _products = [
    {"name": "Smartphone", "price": 60000, "image": "https://m.media-amazon.com/images/I/31KxpX7Xk7L._SX300_SY300_QL70_FMwebp_.jpg"},
    {"name": "Shoes", "price": 499, "image": "https://m.media-amazon.com/images/I/61md3szAgLL._SY575_.jpg"},
    {"name": "Watch", "price": 1599, "image": "https://m.media-amazon.com/images/I/71wXX5IRnzL._SY355_.jpg"},
    {"name": "Headphones", "price": 900, "image": "https://m.media-amazon.com/images/I/31F20Q6c9hL._SX300_SY300_QL70_FMwebp_.jpg"},
    {"name": "Backpack", "price": 500, "image": "https://m.media-amazon.com/images/I/61cFG8LQ5sL._SX569_.jpg"},
    {"name": "Sunglasses", "price": 499, "image": "https://m.media-amazon.com/images/I/61xbGkFmwvL._SX679_.jpg"},
    {"name": "Coffee Maker", "price": 20000, "image": "https://m.media-amazon.com/images/I/41X+sOw6HVL._SY300_SX300_.jpg"},
    {"name": "Bicycle", "price": 6000, "image": "https://m.media-amazon.com/images/I/51-sAWhWCnL._SX300_SY300_QL70_FMwebp_.jpg"},
    {"name": "Smart TV", "price": 34000, "image": "https://m.media-amazon.com/images/I/41LotAqmMRL._SX300_SY300_QL70_FMwebp_.jpg"},
    {"name": "Gaming Console", "price": 1000, "image": "https://m.media-amazon.com/images/I/61SLwruzA-L._SL1500_.jpg"},
  ];

  List<Map<String, dynamic>> get  products => _products;

  List<Map<String, dynamic>> _recentOrders = [
    {
      "orderId": "Order #1001",
      "itemsCount": 2,
      "totalPrice": 1099.99,
      "status": "Delivered",
    },
    {
      "orderId": "Order #1002",
      "itemsCount": 1,
      "totalPrice": 599.00,
      "status": "Processing",
    },
    {
      "orderId": "Order #1003",
      "itemsCount": 3,
      "totalPrice": 459.50,
      "status": "Delivered",
    },
    {
      "orderId": "Order #1004",
      "itemsCount": 4,
      "totalPrice": 799.00,
      "status": "Processing",
    },
  ];

  List<Map<String, dynamic>> get recentOrders => _recentOrders;

}