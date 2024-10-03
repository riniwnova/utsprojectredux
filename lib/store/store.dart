// lib/store/store.dart

import 'package:redux/redux.dart'; // Ensure you have redux package imported
import '../app_state.dart';
import '../reducers/cart_reducer.dart';

// Create the Redux Store with the AppState and cartReducer
final Store<AppState> store = Store<AppState>(
  cartReducer as Reducer<AppState>, // Use the cartReducer to handle state updates
  initialState: AppState.initial(), // Set the initial state
);
