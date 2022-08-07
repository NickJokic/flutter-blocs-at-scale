import 'package:blocs_at_scale/src/config/routing/app_route_name.dart';
import 'package:blocs_at_scale/src/models/product_model.dart';
import 'package:blocs_at_scale/src/screens/cart/cart_screen.dart';
import 'package:blocs_at_scale/src/screens/home/home_screen.dart';
import 'package:blocs_at_scale/src/screens/product_detail/product_detail_screen.dart';
import 'package:blocs_at_scale/src/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';

class AppNavigator {
  static Route? generateRoute(RouteSettings settings) {
    final _initialSettings = RouteSettings(name: settings.name, arguments: settings.arguments);

    switch (settings.name) {
      case AppRouteName.appInit:
        return MaterialPageRoute(
          settings: _initialSettings,
          builder: (_) => const AppInitScreen(),
        );
      case AppRouteName.home:
        return MaterialPageRoute(
          settings: _initialSettings,
          builder: (_) => const HomeScreen(),
        );
      case AppRouteName.productDetail:
        final _product = settings.arguments as Product;
        return MaterialPageRoute(
          settings: _initialSettings,
          builder: (_) => ProductDetailScreen(product: _product),
        );
      case AppRouteName.cart:
        return MaterialPageRoute(
          settings: _initialSettings,
          builder: (_) => const CartScreen(),
        );
      default:
        return MaterialPageRoute(
          settings: _initialSettings,
          builder: (_) => Container(color: Colors.red, height: 200, width: double.infinity),
        );
    }
  }
}
