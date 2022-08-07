import 'package:blocs_at_scale/src/models/user_model.dart';
import 'package:blocs_at_scale/src/util/demo_data/demo_data.dart';
import 'package:blocs_at_scale/src/util/constants/util_constants.dart';

/// Repository responsible for handling [User]-related fetches.
class UserRepository {
  UserRepository();

  /// Simulates the fetch and returns a [User] object.
  Future<User> fetchUser({bool simulateError = false}) async {
    await Future.delayed(UtilConstants.kFetchDelay); // Simulate the response time

    if (simulateError) {
      throw Exception('An error occured during the fetching of the user.');
    }

    return DemoData.kTestUser;
  }
}
