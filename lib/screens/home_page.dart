import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'cart_page.dart';
import 'product_detail_page.dart';
import '../actions/cart_actions.dart';
import '../models/cart_item.dart';
import '../app_state.dart';
import '../widgets/product_card.dart';

class HomePage extends StatelessWidget {
  final List<Map<String, String>> products = [
    {
      'name': 'Moisturizer',
      'image': 'assets/images/moist.jpg',
      'brand': 'Glad2Glow',
      'weight': '30g',
      'description': 'Moisturizer containing Pomegranate and 5% Niacinamide...'
    },
    // Add other products as needed
  ];

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, List<CartItem>>(
      converter: (store) => store.state.cartState.items,
      builder: (context, cartItems) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Shopping'),
            actions: [
              IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CartPage()),
                  );
                },
              ),
              if (cartItems.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: Center(
                    child: Text(
                      '${cartItems.length}',
                      style: TextStyle(color: Colors.red, fontSize: 16),
                    ),
                  ),
                ),
            ],
          ),
          body: GridView.builder(
            padding: const EdgeInsets.all(10),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.7,
            ),
            itemCount: products.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductDetailPage(
                        product: products[index]['name']!,
                        image: products[index]['image']!,
                        brand: products[index]['brand']!,
                        weight: products[index]['weight']!,
                        description: products[index]['description']!,
                      ),
                    ),
                  );
                },
                child: ProductCard(
                  product: products[index]['name']!,
                  image: products[index]['image']!,
                  isAdded: cartItems.any((item) => item.productName == products[index]['name']),
                  addToCart: () {
                    StoreProvider.of<AppState>(context).dispatch(
                      AddToCartAction(
                        CartItem(
                          productName: products[index]['name']!,
                          productImage: products[index]['image']!,
                          quantity: 1, // Default quantity
                        ),
                      ),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('${products[index]['name']} added to cart')),
                    );
                  },
                ),
              );
            },
          ),
        );
      },
    );
  }
}