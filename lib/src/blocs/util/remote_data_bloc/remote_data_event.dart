import 'package:blocs_at_scale/src/util/models/data_type.dart';

abstract class RemoteDataEvent extends DataType {}

class FetchRemoteData<Data> extends RemoteDataEvent {
  final bool? simulateError;
  FetchRemoteData({this.simulateError = false});

  @override
  List<Object?> get props => [...super.props, simulateError];
}
