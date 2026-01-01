import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatelessWidget {
  final Map product;
  const ProductDetailsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product['title'])),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            Image.network(product['thumbnail'], height: 200),
            const SizedBox(height: 10),
            Text('Price: \$${product['price']}'),
            Text('Discount: ${product['discountPercentage']}%'),
            Text('Rating: ${product['rating']}'),
            const SizedBox(height: 10),
            Text(product['description']),
            const SizedBox(height: 20),
            SizedBox(
              height: 120,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: product['images'].length,
                itemBuilder: (context, i) {
                  return Padding(
                    padding: const EdgeInsets.all(4),
                    child: Image.network(product['images'][i]),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}