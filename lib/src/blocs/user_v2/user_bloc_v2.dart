import 'package:blocs_at_scale/src/blocs/index.dart';
import 'package:blocs_at_scale/src/models/user_model.dart';
import 'package:blocs_at_scale/src/services/repositories/user_repository.dart';

class UserBlocV2 extends RemoteDataBloc<User> {
  final UserRepository userRepository;

  UserBlocV2({required this.userRepository});

  @override
  Future<User> fetchAndParseData(RemoteDataState oldState, FetchRemoteData event) async {
    final User _fetchedUser = await userRepository.fetchUser(simulateError: event.simulateError ?? false);
    return _fetchedUser;
  }
}
