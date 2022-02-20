import 'package:blocs_at_scale/src/models/user_model.dart';

const Duration _kFetchDelay = Duration(milliseconds: 1500);
const User _kTestUser = User(userId: 420794622712, userEmail: 'ulf@tester.code', username: 'Ulf');

/// Repository responsible for handling [User]-related fetches.
class UserRepository {
  final User _currentUser;
  UserRepository() : _currentUser = _kTestUser;

  /// Simulates the fetch and returns a [User] object.
  Future<User> fetchUser({bool simulateError = false}) async {
    await Future.delayed(_kFetchDelay); // Simulate the response time

    if (simulateError) {
      throw Exception('An error occured during the fetching of the user.');
    }

    return _currentUser;
  }
}
