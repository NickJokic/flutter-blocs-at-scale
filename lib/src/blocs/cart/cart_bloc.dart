import 'package:bloc/bloc.dart';
import 'package:blocs_at_scale/src/blocs/cart/cart_bloc_event_handler.dart';
import 'package:blocs_at_scale/src/blocs/cart/cart_event.dart';
import 'package:blocs_at_scale/src/blocs/cart/cart_state.dart';
import 'package:blocs_at_scale/src/models/cart_storage.dart';

class CartStorageFactory {
  const CartStorageFactory();
  CartStorage create() => CartStorage();
}

/// Bloc that is responsible for holding and handling
/// the state of the User object.
class CartBloc extends Bloc<CartEvent, CartState> {
  late CartBlocEventHandler _handler;
  late CartStorage _cartStorage;

  CartBloc({CartStorageFactory cartStorageFactory = const CartStorageFactory()}) : super(CartUninitialized()) {
    _handler = CartBlocEventHandler();
    _cartStorage = cartStorageFactory.create();
    // Event handlers
    on<InitializeCart>(_mapInitCartToState);
    on<AddToCart>(_mapAddToCartToState);
    on<RemoveFromCart>(_mapRemoveFromCartToState);
  }

  /// Passes the [InitializeCart] event down to the corresponding event handler.
  Future<void> _mapInitCartToState(InitializeCart event, Emitter<CartState> emit) async {
    return _handleStatesOnEvent(
      isNoOp: state is CartLoading || state is CartInitialized,
      onCartUninitialized: () =>
          _handler.mapInitCartToState(event, state as CartUninitialized, emit, storage: _cartStorage),
    );
  }

  /// Passes the [AddToCart] event down to the corresponding event handler.
  Future<void> _mapAddToCartToState(AddToCart event, Emitter<CartState> emit) async {
    return _handleStatesOnEvent(
      isNoOp: state is CartLoading || state is CartUninitialized,
      onCartLoaded: () => _handler.mapAddToCartToState(event, state as CartLoaded, emit, storage: _cartStorage),
    );
  }

  /// Passes the [RemoveFromCart] event down to the corresponding event handler.
  Future<void> _mapRemoveFromCartToState(RemoveFromCart event, Emitter<CartState> emit) async {
    return _handleStatesOnEvent(
      isNoOp: state is CartLoading || state is CartUninitialized,
      onCartLoaded: () => _handler.mapRemoveFromCartToState(event, state as CartLoaded, emit, storage: _cartStorage),
    );
  }

  /// Reusable helper function that helps with providing
  /// a simple structure for the calling functions.
  Future<void> _handleStatesOnEvent({
    required bool isNoOp,
    Function()? onCartUninitialized,
    Function()? onCartLoaded,
  }) async {
    if (isNoOp) {
      return;
    } else if (state is CartUninitialized) {
      assert(onCartUninitialized != null, 'Missing onCartUninitialized() handler function');
      return onCartUninitialized!();
    } else if (state is CartLoaded) {
      assert(onCartLoaded != null, 'Missing onCartLoaded() handler function');
      return onCartLoaded!();
    } else {
      throw UnimplementedError('No handler implemented for combination: ${state.runtimeType}.');
    }
  }
}
