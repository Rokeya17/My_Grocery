import 'package:flutter/material.dart';

void main() {
  runApp(GroceryApp());
}

class GroceryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grocery Shop',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final List<GroceryItem> groceryItems = [
    GroceryItem(
      name: 'Apples',
      price: 2.99,
      image: 'assets/apple.jpg',
    ),
    GroceryItem(
      name: 'Bananas',
      price: 1.99,
      image: 'assets/banana.jpg',
    ),
    GroceryItem(
      name: 'Carrots',
      price: 0.99,
      image: 'assets/carrot.jpg',
    ),
    // Add more grocery items here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Grocery Shop'),
      ),
      body: ListView.builder(
        itemCount: groceryItems.length,
        itemBuilder: (context, index) {
          final item = groceryItems[index];
          return GroceryItemCard(item: item);
        },
      ),
    );
  }
}

class GroceryItem {
  final String name;
  final double price;
  final String image;

  GroceryItem({
    required this.name,
    required this.price,
    required this.image,
  });
}

class GroceryItemCard extends StatelessWidget {
  final GroceryItem item;

  GroceryItemCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16.0),
      child: Column(
        children: [
          Image.asset(
            item.image,
            height: 150.0,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          ListTile(
            title: Text(item.name),
            subtitle: Text('\$${item.price.toStringAsFixed(2)}'),
            trailing: IconButton(
              icon: Icon(Icons.add_shopping_cart),
              onPressed: () {
                // Add item to the shopping cart
                // You can implement this functionality here
              },
            ),
          ),
        ],
      ),
    );
  }
}
