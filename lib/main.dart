import 'package:blocs_at_scale/src/app.dart';
import 'package:blocs_at_scale/src/blocs/util/custom_bloc_observer.dart';
import 'package:blocs_at_scale/src/services/format_helper.dart';
import 'package:blocs_at_scale/src/services/repositories/product_repository.dart';
import 'package:blocs_at_scale/src/services/repositories/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'src/blocs/index.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = CustomBlocObserver();

  final _providers = [
    Provider(create: (context) => UserRepository()),
    Provider(create: (context) => ProductRepository()),
    BlocProvider<UserBlocV2>(
      create: (context) => UserBlocV2(userRepository: context.read<UserRepository>()),
    ),
    BlocProvider<ProductBloc>(
      create: (context) => ProductBloc(productRepository: context.read<ProductRepository>()),
    ),
    BlocProvider<CartBloc>(
      create: (context) => CartBloc(),
    ),
    Provider(create: (context) => FormatHelper()),
  ];

  runApp(
    MultiProvider(
      providers: _providers,
      child: const App(),
    ),
  );
}
