import 'package:equatable/equatable.dart';

/// Reusable abstraction of [Equatable] with predefined properties.
abstract class DataType extends Equatable {
  const DataType();

  @override
  List<Object?> get props => [];

  @override
  bool get stringify => true;
}
