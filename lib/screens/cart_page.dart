import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import '../../app_state.dart';
import '../actions/cart_actions.dart';
import '../models/cart_item.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart Page'),
      ),
      body: StoreConnector<AppState, List<CartItem>>(
        converter: (store) => store.state.cartItems,
        builder: (context, cartItems) {
          if (cartItems.isEmpty) {
            return Center(child: Text('No items in the cart'));
          }
          return ListView.builder(
            itemCount: cartItems.length,
            itemBuilder: (context, index) {
              final item = cartItems[index];
              return ListTile(
                leading: Image.asset(item.productImage, width: 50),
                title: Text(item.productName),
                subtitle: Text('Quantity: ${item.quantity}'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.remove),
                      onPressed: () {
                        StoreProvider.of<AppState>(context).dispatch(DecreaseQuantityAction(item.productName));
                      },
                    ),
                    Text(item.quantity.toString()),
                    IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {
                        StoreProvider.of<AppState>(context).dispatch(IncreaseQuantityAction(item.productName));
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        StoreProvider.of<AppState>(context).dispatch(RemoveFromCartAction(item.productName));
                      },
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}