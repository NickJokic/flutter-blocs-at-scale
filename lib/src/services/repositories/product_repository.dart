import 'package:blocs_at_scale/src/models/product_model.dart';
import 'package:blocs_at_scale/src/util/demo_data/demo_data.dart';
import 'package:blocs_at_scale/src/util/constants/util_constants.dart';

class ProductRepository {
  /// Simulates the fetch and returns a list of [Product]s.
  Future<List<Product>> fetchProducts({bool simulateError = false}) async {
    await Future.delayed(UtilConstants.kFetchDelay); // Simulate the response time

    if (simulateError) {
      throw Exception('An error occured during the fetching of the products.');
    }

    return DemoData.kProductList;
  }
}
