// app_state.dart
import 'cart_state.dart';

class AppState {
  final CartState cartState;

  var cartItems;

  AppState({required this.cartState});

  factory AppState.initial() {
    return AppState(
      cartState: CartState.initial(),
    );
  }
}