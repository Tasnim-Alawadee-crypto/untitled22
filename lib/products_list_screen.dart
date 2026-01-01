import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'product_details_screen.dart';

class ProductsListScreen extends StatefulWidget {
  const ProductsListScreen({super.key});

  @override
  State<ProductsListScreen> createState() => _ProductsListScreenState();
}

class _ProductsListScreenState extends State<ProductsListScreen> {
  List products = [];

  Future<void> fetchProducts() async {
    final res = await http.get(
      Uri.parse('https://dummyjson.com/products'),
    );
    final data = json.decode(res.body);
    setState(() {
      products = data['products'];
    });
  }

  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Products')),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, i) {
          final p = products[i];
          return ListTile(
            leading: Image.network(p['thumbnail'], width: 50),
            title: Text(p['title']),
            subtitle: Text(
              'Price: \$${p['price']} | Discount: ${p['discountPercentage']}%',
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ProductDetailsScreen(product: p),
                ),
              );
            },
          );
        },
      ),
    );
  }
}