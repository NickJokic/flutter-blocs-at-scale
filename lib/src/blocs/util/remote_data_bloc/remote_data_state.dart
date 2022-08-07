import 'package:blocs_at_scale/src/util/models/data_type.dart';

abstract class RemoteDataState<Data> extends DataType {}

/// Mixin for every [RemoteDataState] that represents network activity.
mixin RemoteDataFetching<Data> on RemoteDataState<Data> {}

/// Mixin for every [RemoteDataState] that represents a temporary success.
mixin RemoteDataSuccess<Data> on RemoteDataState<Data> {}

/// Mixin for every [RemoteDataState] that represents a temporary error.
mixin RemoteDataError<Data> on RemoteDataState<Data> {}

// #####################
// Uninitialized States
// #####################

class RemoteDataUninitialized<Data> extends RemoteDataState<Data> {}

class RemoteDataInitialFetching<Data> extends RemoteDataState<Data> with RemoteDataFetching<Data> {}

class RemoteDataInitialFetchingError<Data> extends RemoteDataState<Data> with RemoteDataError<Data> {
  final dynamic error;
  RemoteDataInitialFetchingError(this.error);

  @override
  List<Object?> get props => [...super.props, error];
}

// ###################
// Initialized States
// ###################

abstract class RemoteDataInitialized<Data> extends RemoteDataState<Data> {
  final Data data;
  RemoteDataInitialized(this.data);
  RemoteDataInitialized.clone(RemoteDataInitialized other) : this(other.data);

  @override
  List<Object?> get props => [...super.props, data];
}

class RemoteDataLoaded<Data> extends RemoteDataInitialized<Data> {
  RemoteDataLoaded(Data data) : super(data);
  RemoteDataLoaded.clone(RemoteDataInitialized oldState) : super.clone(oldState);
}

class RemoteDataRefetching<Data> extends RemoteDataInitialized<Data> with RemoteDataFetching<Data> {
  RemoteDataRefetching(RemoteDataInitialized oldState) : super.clone(oldState);
}

class RemoteDataRefetchingSuccess<Data> extends RemoteDataInitialized<Data> with RemoteDataSuccess<Data> {
  RemoteDataRefetchingSuccess(Data data) : super(data);
  RemoteDataRefetchingSuccess.clone(RemoteDataInitialized oldState) : super.clone(oldState);
}

class RemoteDataRefetchingFailed<Data> extends RemoteDataInitialized<Data> with RemoteDataError<Data> {
  final dynamic error;
  RemoteDataRefetchingFailed(RemoteDataInitialized oldState, this.error) : super.clone(oldState);

  @override
  List<Object?> get props => [...super.props, error];
}
