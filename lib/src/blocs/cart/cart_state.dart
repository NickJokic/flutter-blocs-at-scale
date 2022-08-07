import 'package:blocs_at_scale/src/models/cart_storage.dart';
import 'package:blocs_at_scale/src/util/models/data_type.dart';

mixin CartLoading {}

abstract class CartState extends DataType {}

class CartUninitialized extends CartState {}

class CartInitialLoading extends CartState implements CartLoading {}

abstract class CartInitialized extends CartState {
  final CartStorage storage;

  CartInitialized({required this.storage});

  @override
  List<Object?> get props => [...super.props, storage];
}

class CartLoaded extends CartInitialized {
  CartLoaded({required CartStorage storage}) : super(storage: storage);
}

class CartUpdating extends CartInitialized implements CartLoading {
  CartUpdating({required CartStorage storage}) : super(storage: storage);
}
