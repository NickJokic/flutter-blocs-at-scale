import 'package:bloc/bloc.dart';
import 'package:blocs_at_scale/src/blocs/user/user_bloc_event_handler.dart';
import 'package:blocs_at_scale/src/blocs/user/user_event.dart';
import 'package:blocs_at_scale/src/blocs/user/user_state.dart';
import 'package:blocs_at_scale/src/services/repositories/user_repository.dart';

/// Bloc that is responsible for holding and handling
/// the state of the User object.
class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;
  late UserBlocEventHandler handler;

  UserBloc({required this.userRepository}) : super(UserUninitialized()) {
    handler = UserBlocEventHandler(userRepository: userRepository);
    on<FetchUser>(_mapFetchUserToState);
  }

  /// Passes the [FetchUser] event down to the corresponding event handler.
  Future<void> _mapFetchUserToState(FetchUser event, Emitter<UserState> emit) async {
    return _handleStatesOnEvent(
      isNoOp: state is UserFetching || state is UserError || state is UserSuccess,
      onUserUninitialized: () => handler.mapInitialFetchUserToState(event, state as UserUninitialized, emit),
      onUserLoaded: () => handler.mapRefetchUserToState(event, state as UserLoaded, emit),
    );
  }

  /// Reusable helper function that helps with providing
  /// a simple structure for the calling functions.
  Future<void> _handleStatesOnEvent({
    required bool isNoOp,
    Function()? onUserUninitialized,
    Function()? onUserLoaded,
  }) async {
    if (isNoOp) {
      return;
    } else if (state is UserUninitialized) {
      assert(onUserUninitialized != null, 'Missing onUserUninitialized() handler function');
      return onUserUninitialized!();
    } else if (state is UserLoaded) {
      assert(onUserLoaded != null, 'Missing onUserLoaded() handler function');
      return onUserLoaded!();
    } else {
      throw UnimplementedError('No handler implemented for combination: ${state.runtimeType}.');
    }
  }
}
