import 'package:bloc_test/bloc_test.dart';
import 'package:blocs_at_scale/src/blocs/index.dart';
import 'package:blocs_at_scale/src/models/user_model.dart';
import 'package:blocs_at_scale/src/services/repositories/user_repository.dart';
import 'package:blocs_at_scale/src/util/demo_data/demo_data.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'user_bloc_test.mocks.dart';

@GenerateMocks([UserRepository])
void main() {
  group('UserBloc', () {
    late UserBlocV2 _userBloc;
    late MockUserRepository _userRepository;

    setUp(() {
      _userRepository = MockUserRepository();
      _userBloc = UserBlocV2(userRepository: _userRepository);
    });

    // Initial state of the BLOC.
    test('Initial state', () {
      expect(_userBloc.state, RemoteDataUninitialized<User>());
    });

    group('FetchRemoteData', () {
      // [RemoteDataUninitialized] + SUCCESS.
      blocTest(
        'SUCCESS: emits [RemoteDataInitialFetching], [RemoteDataLoaded] on FetchRemoteData + RemoteDataUninitialized.',
        build: () {
          when(_userRepository.fetchUser()).thenAnswer((realInvocation) async => DemoData.kTestUser);
          return _userBloc;
        },
        act: (UserBlocV2 bloc) => bloc.add(FetchRemoteData()),
        expect: () => [isA<RemoteDataInitialFetching<User>>(), isA<RemoteDataLoaded<User>>()],
        verify: (UserBlocV2 bloc) => expect(bloc.state, RemoteDataLoaded<User>(DemoData.kTestUser)),
      );

      // [RemoteDataUninitialized] + ERROR.
      blocTest(
        'ERROR: emits [RemoteDataInitialFetching], [RemoteDataInitialFetchingError], [RemoteDataUninitialized] on FetchRemoteData + RemoteDataUninitialized.',
        build: () {
          when(_userRepository.fetchUser()).thenAnswer((realInvocation) async => throw Error());
          return _userBloc;
        },
        act: (UserBlocV2 bloc) => bloc.add(FetchRemoteData()),
        expect: () => [
          isA<RemoteDataInitialFetching<User>>(),
          isA<RemoteDataInitialFetchingError<User>>(),
          isA<RemoteDataUninitialized<User>>()
        ],
        verify: (UserBlocV2 bloc) => expect(bloc.state, RemoteDataUninitialized<User>()),
      );

      // [RemoteDataLoaded] + SUCCESS.
      blocTest(
        'SUCCESS: emits [RemoteDataRefetching], [RemoteDataRefetchingSuccess], [RemoteDataLoaded] on FetchRemoteData + RemoteDataLoaded.',
        build: () {
          when(_userRepository.fetchUser()).thenAnswer((realInvocation) async => DemoData.kTestUser);
          return _userBloc;
        },
        act: (UserBlocV2 bloc) {
          bloc.add(FetchRemoteData()); // successful fetch
          bloc.add(FetchRemoteData()); // successful re-fetch
        },
        skip: 2, // skips the resulting states of the initial fetch
        expect: () => [
          isA<RemoteDataRefetching<User>>(),
          isA<RemoteDataRefetchingSuccess<User>>(),
          isA<RemoteDataLoaded<User>>()
        ],
        verify: (UserBlocV2 bloc) => expect(bloc.state, RemoteDataLoaded<User>(DemoData.kTestUser)),
      );

      // [RemoteDataLoaded] + ERROR.
      blocTest(
        'ERROR: emits [RemoteDataRefetching], [RemoteDataRefetchingFailed], [RemoteDataLoaded] on FetchRemoteData + RemoteDataLoaded.',
        build: () {
          when(_userRepository.fetchUser()).thenAnswer((realInvocation) async => DemoData.kTestUser);
          when(_userRepository.fetchUser(simulateError: true)).thenAnswer((realInvocation) async => throw Error());
          return _userBloc;
        },
        act: (UserBlocV2 bloc) {
          bloc.add(FetchRemoteData()); // successful fetch
          bloc.add(FetchRemoteData(simulateError: true)); // failed re-fetch
        },
        skip: 2, // skips the resulting states of the initial fetch
        expect: () => [
          isA<RemoteDataRefetching<User>>(),
          isA<RemoteDataRefetchingFailed<User>>(),
          isA<RemoteDataLoaded<User>>(),
        ],
        verify: (UserBlocV2 bloc) => expect(bloc.state, RemoteDataLoaded<User>(DemoData.kTestUser)),
      );
    });
  });
}
