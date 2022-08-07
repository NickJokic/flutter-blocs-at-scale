import 'package:bloc/bloc.dart';
import 'package:blocs_at_scale/src/blocs/util/remote_data_bloc/remote_data_event.dart';
import 'package:blocs_at_scale/src/blocs/util/remote_data_bloc/remote_data_state.dart';

class RemoteDataEventHandler<Data> {
  const RemoteDataEventHandler();

  /// Handler for [FetchRemoteData] + [RemoteDataUninitialized] combination.
  /// Handles initial fetch when the remote data is not yet present.
  ///
  /// On success it emits: [RemoteDataInitialFetching], [RemoteDataLoaded].
  /// On failure it emits: [RemoteDataInitialFetching], [RemoteDataInitialFetchingError], [RemoteDataUninitialized].
  Future<void> mapInitialFetchRemoteDataToState(
    FetchRemoteData event,
    RemoteDataUninitialized state,
    Emitter<RemoteDataState<Data>> emit,
    Function(RemoteDataState<Data>, FetchRemoteData) fetchAndParseData,
  ) async {
    try {
      emit(RemoteDataInitialFetching());
      final Data data = await fetchAndParseData(state as RemoteDataState<Data>, event);
      emit(RemoteDataLoaded(data));
    } catch (e) {
      print(e);
      emit(RemoteDataInitialFetchingError(e));
      emit(RemoteDataUninitialized());
    }
  }

  /// Handler for [FetchRemoteData] + [RemoteDataLoaded] combination.
  /// Handles refetch of the remote data.
  ///
  /// On success it emits: [RemoteDataRefetching], [RemoteDataLoaded].
  /// On failure it emits: [RemoteDataRefetching], [RemoteDataRefetchingFailed], [RemoteDataLoaded].
  Future<void> mapRefetchRemoteDataToState(
    FetchRemoteData event,
    RemoteDataLoaded state,
    Emitter<RemoteDataState<Data>> emit,
    Function(RemoteDataState<Data>, FetchRemoteData) fetchAndParseData,
  ) async {
    try {
      emit(RemoteDataRefetching(state));
      final Data data = await fetchAndParseData(state as RemoteDataState<Data>, event);
      emit(RemoteDataRefetchingSuccess(data));
      emit(RemoteDataLoaded(data));
    } catch (e) {
      print(e);
      emit(RemoteDataRefetchingFailed(state, e));
      emit(RemoteDataLoaded.clone(state));
    }
  }
}
