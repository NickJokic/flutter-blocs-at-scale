import 'package:bloc/bloc.dart';
import 'package:blocs_at_scale/src/blocs/user/user_event.dart';
import 'package:blocs_at_scale/src/blocs/user/user_state.dart';
import 'package:blocs_at_scale/src/models/user_model.dart';
import 'package:blocs_at_scale/src/services/repositories/user_repository.dart';
import 'package:blocs_at_scale/src/blocs/user/user_bloc.dart';

/// Helper class which implements the separate state+event handlers.
/// It's handler functions should only be called by the [UserBloc].
class UserBlocEventHandler {
  final UserRepository userRepository;

  UserBlocEventHandler({required this.userRepository});

  /// Handler for [FetchUser] + [UserUninitialized] combination.
  ///
  /// On success it emits: [UserInitialFetching], [UserLoaded].
  /// On failure it emits: [UserInitialFetching], [UserInitialFetchingError], [UserUninitialized].
  Future<void> mapInitialFetchUserToState(FetchUser event, UserUninitialized state, Emitter<UserState> emit) async {
    try {
      emit(UserInitialFetching());
      final User _fetchedUser = await userRepository.fetchUser(simulateError: event.simulateError ?? false);
      emit(UserLoaded(user: _fetchedUser));
    } catch (e) {
      print(e);
      emit(UserInitialFetchingError(e));
      emit(UserUninitialized());
    }
  }

  /// Handler for [FetchUser] + [UserLoaded] combination.
  ///
  /// On success it emits: [UserRefetching], [UserRefetchingSuccess], [UserLoaded].
  /// On failure it emits: [UserRefetching], [UserRefetchingError], [UserLoaded].
  Future<void> mapRefetchUserToState(FetchUser event, UserLoaded state, Emitter<UserState> emit) async {
    try {
      emit(UserRefetching(state));
      final User _refetchedUser = await userRepository.fetchUser(simulateError: event.simulateError ?? false);
      emit(UserRefetchingSuccess(user: _refetchedUser));
      emit(UserLoaded(user: _refetchedUser));
    } catch (e) {
      print(e);
      emit(UserRefetchingError(state, e));
      emit(UserLoaded.clone(state));
    }
  }
}
