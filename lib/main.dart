import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:blocs_at_scale/src/app.dart';
import 'package:blocs_at_scale/src/blocs/util/custom_bloc_observer.dart';
import 'package:blocs_at_scale/src/services/repositories/user_repository.dart';
import 'package:provider/provider.dart';

import 'src/blocs/index.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  BlocOverrides.runZoned(
    () {
      final _providers = [
        Provider(create: (context) => UserRepository()),
        BlocProvider<UserBloc>(create: (context) => UserBloc(userRepository: context.read<UserRepository>())),
      ];

      runApp(
        MultiProvider(
          providers: _providers,
          child: const App(),
        ),
      );
    },
    blocObserver: CustomBlocObserver(),
  );
}
