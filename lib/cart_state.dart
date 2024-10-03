// cart_state.dart
import 'models/cart_item.dart';

class CartState {
  final List<CartItem> items;

  CartState({required this.items});

  factory CartState.initial() {
    return CartState(
      items: [],
    );
  }
}