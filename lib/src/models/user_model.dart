import 'package:blocs_at_scale/src/util/models/data_type.dart';

class User extends DataType {
  final int userId;
  final String userEmail;
  final String username;

  const User({
    required this.userId,
    required this.userEmail,
    required this.username,
  });

  /// Returns a new [User] object with copied/modified values.
  User copyWith({String? username}) {
    return User(
      userId: userId, // immutable
      userEmail: userEmail, // immutable
      username: username ?? this.username,
    );
  }

  @override
  List<Object?> get props => [userId, userEmail, username];

  @override
  String toString() => 'User {userId: $userId,\nuserEmail: $userEmail,\nusername: $username}';
}
