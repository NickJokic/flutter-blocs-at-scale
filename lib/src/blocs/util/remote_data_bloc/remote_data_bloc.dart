import 'package:bloc/bloc.dart';
import 'package:blocs_at_scale/src/blocs/util/remote_data_bloc/remote_data_event.dart';
import 'package:blocs_at_scale/src/blocs/util/remote_data_bloc/remote_data_event_handler.dart';
import 'package:blocs_at_scale/src/blocs/util/remote_data_bloc/remote_data_state.dart';
import 'package:flutter/material.dart';

/// Abstract Bloc implementation for simple hydrated "Fetch and Store Data" Blocs.
/// Any Object/Primitive Data can be accessed via the [RemoteDataInitialized.data] property.
abstract class RemoteDataBloc<Data> extends Bloc<RemoteDataEvent, RemoteDataState<Data>> {
  late RemoteDataEventHandler<Data> _handler;

  RemoteDataBloc() : super(RemoteDataUninitialized()) {
    _handler = RemoteDataEventHandler<Data>();
    on<FetchRemoteData>(_mapFetchRemoteDataToState);
  }

  /// Propagates the [FetchUser] event down to the corresponding event handler.
  Future<void> _mapFetchRemoteDataToState(
    FetchRemoteData event,
    Emitter<RemoteDataState<Data>> emit,
  ) async {
    return _handleStatesOnEvent(
      isNoOp: state is RemoteDataFetching || state is RemoteDataError || state is RemoteDataSuccess,
      onRemoteDataUninitialized: () => _handler.mapInitialFetchRemoteDataToState(
        event,
        state as RemoteDataUninitialized,
        emit,
        fetchAndParseData,
      ),
      onRemoteDataLoaded: () => _handler.mapRefetchRemoteDataToState(
        event,
        state as RemoteDataLoaded,
        emit,
        fetchAndParseData,
      ),
    );
  }

  /// Helper function that can be used by [_mapFetchRemoteDataToState] function
  /// for cleaner propagation of the events to the corresponding event handler.
  Future<void> _handleStatesOnEvent({
    required bool isNoOp,
    Function()? onRemoteDataUninitialized,
    Function()? onRemoteDataLoaded,
  }) async {
    if (isNoOp) {
      return;
    } else if (state is RemoteDataUninitialized && onRemoteDataUninitialized != null) {
      return onRemoteDataUninitialized();
    } else if (state is RemoteDataLoaded && onRemoteDataLoaded != null) {
      return onRemoteDataLoaded();
    } else {
      throw UnimplementedError('No handler implemented for combination: ${state.runtimeType}.');
    }
  }

  /// Function which retrieves the blocs data from the backend,
  /// parses the response and returns the parsed [Data] Object.
  /// The [oldState] and thus the old [Data] object is also accesible,
  /// if merging of the new and old data is required.
  @visibleForTesting
  Future<Data> fetchAndParseData(RemoteDataState<Data> oldState, FetchRemoteData event);
}
