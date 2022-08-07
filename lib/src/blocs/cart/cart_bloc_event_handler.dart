import 'package:blocs_at_scale/src/blocs/cart/cart_event.dart';
import 'package:blocs_at_scale/src/blocs/cart/cart_state.dart';
import 'package:blocs_at_scale/src/models/cart_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartBlocEventHandler {
  /// Handler for [InitializeCart] + [CartUninitialized] combination.
  ///
  /// On success it emits: [CartInitialLoading], [CartLoaded].
  void mapInitCartToState(
    InitializeCart event,
    CartUninitialized state,
    Emitter<CartState> emit, {
    required CartStorage storage,
  }) {
    emit(CartInitialLoading());
    emit(CartLoaded(storage: storage));
  }

  /// Handler for [AddToCart] + [CartLoaded] combination.
  ///
  /// On success it emits: [CartUpdating], [CartLoaded].
  void mapAddToCartToState(
    AddToCart event,
    CartLoaded state,
    Emitter<CartState> emit, {
    required CartStorage storage,
  }) {
    emit(CartUpdating(storage: storage));
    storage.addEntry(event.product);
    emit(CartLoaded(storage: storage));
  }

  /// Handler for [AddToCart] + [CartLoaded] combination.
  ///
  /// On success it emits: [CartUpdating], [CartLoaded].
  void mapRemoveFromCartToState(
    RemoveFromCart event,
    CartLoaded state,
    Emitter<CartState> emit, {
    required CartStorage storage,
  }) {
    emit(CartUpdating(storage: storage));
    storage.removeEntry(event.product);
    emit(CartLoaded(storage: storage));
  }
}
