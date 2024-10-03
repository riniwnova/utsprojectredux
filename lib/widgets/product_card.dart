// lib/widgets/product_card.dart
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String product;
  final String image;
  final bool isAdded;
  final VoidCallback addToCart;

  ProductCard({
    required this.product,
    required this.image,
    required this.isAdded,
    required this.addToCart,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            image,
            height: 120,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              product,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            child: ElevatedButton(
              onPressed: isAdded ? null : addToCart,
              child: Text(isAdded ? 'Added' : 'Add to Cart'),
              style: ElevatedButton.styleFrom(
                backgroundColor: isAdded ? Colors.grey : Colors.blue, // Change color based on whether it's added
              ),
            ),
          ),
        ],
      ),
    );
  }
}