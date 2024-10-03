// reducers/app_reducer.dart
import '../app_state.dart';
import 'cart_reducer.dart';

AppState appReducer(AppState state, dynamic action) {
  return AppState(
    cartState: cartReducer(state.cartState, action), // Pass cartState to cartReducer
  );
}