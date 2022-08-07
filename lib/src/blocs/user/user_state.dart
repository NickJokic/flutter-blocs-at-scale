import 'package:blocs_at_scale/src/models/user_model.dart';
import 'package:blocs_at_scale/src/util/models/data_type.dart';

abstract class UserState extends DataType {}

/// Mixin for every [UserState] that represents network activity.
mixin UserFetching on UserState {}

/// Mixin for every [UserState] that represents an temporary error.
mixin UserError on UserState {}

/// Mixin for every [UserState] that represents an temporary success.
mixin UserSuccess on UserState {}

// ####################
// Uninitialized States
// ####################

class UserUninitialized extends UserState {}

class UserInitialFetching extends UserState with UserFetching {}

class UserInitialFetchingError extends UserState with UserError {
  final dynamic error;
  UserInitialFetchingError(this.error);

  @override
  List<Object?> get props => [...super.props, error];
}

// ##################
// Initialized States
// ##################

abstract class UserInitialized extends UserState {
  final User user;
  UserInitialized({required this.user});

  UserInitialized.clone(UserInitialized oldState) : this(user: oldState.user);

  @override
  List<Object?> get props => [...super.props, user];
}

class UserLoaded extends UserInitialized {
  UserLoaded({required User user}) : super(user: user);
  UserLoaded.clone(UserInitialized oldState) : super.clone(oldState);
}

class UserRefetching extends UserInitialized with UserFetching {
  UserRefetching(UserInitialized oldState) : super.clone(oldState);
}

class UserRefetchingSuccess extends UserInitialized with UserSuccess {
  UserRefetchingSuccess({required User user}) : super(user: user);
}

class UserRefetchingError extends UserInitialized with UserError {
  final dynamic error;
  UserRefetchingError(UserInitialized oldState, this.error) : super.clone(oldState);

  @override
  List<Object?> get props => [...super.props, error];
}
