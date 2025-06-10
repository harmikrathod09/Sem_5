import 'package:flutter/material.dart';

class EcommerceDashboard extends StatelessWidget {
  EcommerceDashboard({super.key});



  final List<Map<String, dynamic>> products = [
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("E-Commerce Dashboard"),
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: "Search products",
                prefixIcon: Icon(Icons.search),
              ),
            ),
            SizedBox(height: 12),
            Expanded(
              child: ListView.separated(
                itemCount: products.length,
                separatorBuilder: (_, __) => SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final product = products[index];
                  return ListTile(
                    leading: Image.network(product["image"], width: 60, height: 60),
                    title: Text(product["name"]),
                    subtitle: Text("RS ${product["price"]}"),
                    trailing: ElevatedButton(
                      onPressed: () {},
                      child: Text("Add"),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
