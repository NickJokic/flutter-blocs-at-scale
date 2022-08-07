import 'package:blocs_at_scale/src/util/models/data_type.dart';

class Product extends DataType {
  final int id;
  final String name;
  final String manufacturer;
  final String description;
  final String assetImagePath;
  final double weightKg;
  final double price;

  const Product({
    required this.id,
    required this.name,
    required this.manufacturer,
    required this.description,
    required this.assetImagePath,
    required this.weightKg,
    required this.price,
  });

  @override
  List<Object?> get props => [...super.props, id, name, manufacturer, description, assetImagePath, weightKg, price];

  @override
  String toString() => 'Product {id: $id, name: $name, price: $price}';
}
