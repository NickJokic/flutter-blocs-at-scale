import 'package:blocs_at_scale/src/config/theme/app_images.dart';
import 'package:blocs_at_scale/src/models/product_model.dart';
import 'package:blocs_at_scale/src/models/user_model.dart';

class DemoData {
  // Demo User
  static const User kTestUser = User(userId: 420794622712, userEmail: 'nick@tester.code', username: 'Nick');
  // Demo Products
  static const List<Product> kProductList = [
    Product(
      id: 1,
      name: 'Espresso Beans',
      manufacturer: 'Brewz',
      description:
          'Mazagran, extraction grinder café au lait chicory lungo cultivar. Organic qui, at qui, chicory irish, ristretto, redeye steamed filter blue mountain espresso. Sugar roast crema latte half and half plunger pot robust. Americano con panna, dark, french press that organic variety aromatic french press...',
      assetImagePath: AppImages.testProduct,
      weightKg: 0.5,
      price: 12.49,
    ),
    Product(
      id: 2,
      name: 'Decaf Ground',
      manufacturer: 'Brewz',
      description:
          'Mazagran, extraction grinder café au lait chicory lungo cultivar. Organic qui, at qui, chicory irish, ristretto, redeye steamed filter blue mountain espresso. Sugar roast crema latte half and half plunger pot robust. Americano con panna, dark, french press that organic variety aromatic french press...',
      assetImagePath: AppImages.testProduct,
      weightKg: 0.5,
      price: 12.49,
    ),
    Product(
      id: 3,
      name: 'Espresso Beans',
      manufacturer: 'Brewz',
      description:
          'Mazagran, extraction grinder café au lait chicory lungo cultivar. Organic qui, at qui, chicory irish, ristretto, redeye steamed filter blue mountain espresso. Sugar roast crema latte half and half plunger pot robust. Americano con panna, dark, french press that organic variety aromatic french press...',
      assetImagePath: AppImages.testProduct,
      weightKg: 0.5,
      price: 12.49,
    ),
    Product(
      id: 4,
      name: 'Espresso Beans',
      manufacturer: 'Brewz',
      description:
          'Mazagran, extraction grinder café au lait chicory lungo cultivar. Organic qui, at qui, chicory irish, ristretto, redeye steamed filter blue mountain espresso. Sugar roast crema latte half and half plunger pot robust. Americano con panna, dark, french press that organic variety aromatic french press...',
      assetImagePath: AppImages.testProduct,
      weightKg: 0.5,
      price: 12.49,
    ),
    Product(
      id: 5,
      name: 'Espresso Beans',
      manufacturer: 'Brewz',
      description:
          'Mazagran, extraction grinder café au lait chicory lungo cultivar. Organic qui, at qui, chicory irish, ristretto, redeye steamed filter blue mountain espresso. Sugar roast crema latte half and half plunger pot robust. Americano con panna, dark, french press that organic variety aromatic french press...',
      assetImagePath: AppImages.testProduct,
      weightKg: 0.5,
      price: 12.49,
    ),
    Product(
      id: 6,
      name: 'Espresso Beans',
      manufacturer: 'Brewz',
      description:
          'Mazagran, extraction grinder café au lait chicory lungo cultivar. Organic qui, at qui, chicory irish, ristretto, redeye steamed filter blue mountain espresso. Sugar roast crema latte half and half plunger pot robust. Americano con panna, dark, french press that organic variety aromatic french press...',
      assetImagePath: AppImages.testProduct,
      weightKg: 0.5,
      price: 12.49,
    ),
  ];
}
