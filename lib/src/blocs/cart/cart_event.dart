import 'package:blocs_at_scale/src/models/product_model.dart';
import 'package:blocs_at_scale/src/util/models/data_type.dart';

abstract class CartEvent extends DataType {}

class InitializeCart extends CartEvent {
  InitializeCart();

  @override
  List<Object?> get props => [...super.props];
}

class AddToCart extends CartEvent {
  final Product product;
  AddToCart({required this.product});

  @override
  List<Object?> get props => [...super.props, product];
}

class RemoveFromCart extends CartEvent {
  final Product product;
  RemoveFromCart({required this.product});

  @override
  List<Object?> get props => [...super.props, product];
}
