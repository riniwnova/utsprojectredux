// lib/actions/cart_actions.dart

import '../models/cart_item.dart';

class AddToCartAction {
  final CartItem item; // Keep this as the CartItem object

  AddToCartAction(this.item);

  CartItem? get cartItem => null; // Constructor
}

class RemoveFromCartAction {
  final String productName;

  RemoveFromCartAction(this.productName);
}

class IncreaseQuantityAction {
  final String productName;

  IncreaseQuantityAction(this.productName);
}

class DecreaseQuantityAction {
  final String productName;

  DecreaseQuantityAction(this.productName);
}