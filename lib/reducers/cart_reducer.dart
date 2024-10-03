// reducers/cart_reducer.dart
import '../cart_state.dart';
import '../actions/cart_actions.dart';

CartState cartReducer(CartState state, dynamic action) {
  if (action is AddToCartAction) {
    return CartState(
      items: List.from(state.items)..add(action.item), // Access the item directly
    );
  }
  return state; // Return the current state if no action matches
}