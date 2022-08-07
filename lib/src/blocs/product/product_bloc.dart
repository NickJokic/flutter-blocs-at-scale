import 'package:blocs_at_scale/src/blocs/index.dart';
import 'package:blocs_at_scale/src/models/product_model.dart';
import 'package:blocs_at_scale/src/services/repositories/product_repository.dart';

class ProductBloc extends RemoteDataBloc<List<Product>> {
  final ProductRepository productRepository;

  ProductBloc({required this.productRepository});

  @override
  Future<List<Product>> fetchAndParseData(RemoteDataState oldState, FetchRemoteData event) async {
    final List<Product> _fetchedUser =
        await productRepository.fetchProducts(simulateError: event.simulateError ?? false);
    return _fetchedUser;
  }
}
