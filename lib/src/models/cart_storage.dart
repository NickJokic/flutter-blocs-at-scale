import 'package:blocs_at_scale/src/models/product_model.dart';
import 'package:blocs_at_scale/src/util/models/data_type.dart';

class CartStorage extends DataType {
  final List<CartStorageEntry> entries; // key is productId, value is quantity

  /// Creates a new empty [CartStorage]
  CartStorage() : entries = [];

  @override
  List<Object?> get props => [...super.props, entries];

  /// Adds a new [CartStorageEntry] or increases the quantity of the existing one.
  void addEntry(Product product) {
    int _entryIndex = entries.indexWhere((cartEntry) => cartEntry.product.id == product.id);
    if (_entryIndex != -1) {
      entries[_entryIndex] = entries[_entryIndex].copyWith(quantity: entries[_entryIndex].quantity + 1);
    } else {
      entries.add(CartStorageEntry(product: product, quantity: 1));
    }
  }

  /// Decreases or removes the quantity of the existing [CartStorageEntry].
  void removeEntry(Product product) {
    int _entryIndex = entries.indexWhere((cartEntry) => cartEntry.product.id == product.id);
    if (_entryIndex != -1) {
      if (entries[_entryIndex].quantity > 1) {
        entries[_entryIndex] = entries[_entryIndex].copyWith(quantity: entries[_entryIndex].quantity - 1);
      } else {
        entries.removeAt(_entryIndex);
      }
    }
  }

  /// Returns the current quantity of a [Product] in the cart.
  int getProductQuantity(int productId) {
    try {
      return entries.firstWhere((entry) => entry.product.id == productId).quantity;
    } catch (e) {
      return 0;
    }
  }

  /// Returns the total price of the current cart items.
  double getCartTotalPrice() => entries.fold(0, (sum, entry) => sum + (entry.quantity * entry.product.price));
}

class CartStorageEntry extends DataType {
  final Product product;
  final int quantity;

  const CartStorageEntry({required this.product, required this.quantity});

  CartStorageEntry copyWith({int? quantity}) {
    return CartStorageEntry(
      product: product,
      quantity: quantity ?? this.quantity,
    );
  }
}
