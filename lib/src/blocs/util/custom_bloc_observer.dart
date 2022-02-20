import 'package:bloc/bloc.dart';

/// Custom implementation of [BlocObserver] which is used for
/// logging BLOC-related lifecycle events.
class CustomBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    print('onCreate: ${bloc.runtimeType}');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(
      'onTransition:\n    from: ${transition.currentState.runtimeType}\n    to: ${transition.nextState.runtimeType}\n    event: ${transition.event}',
    );
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    print('onError: ${bloc.runtimeType}, $error');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    print('onClose: ${bloc.runtimeType}');
  }
}
