import 'package:blocs_at_scale/src/util/models/data_type.dart';

abstract class UserEvent extends DataType {}

class FetchUser extends UserEvent {
  final bool? simulateError;

  FetchUser({this.simulateError = false}) : super();

  @override
  List<Object?> get props => [...super.props, simulateError];
}
