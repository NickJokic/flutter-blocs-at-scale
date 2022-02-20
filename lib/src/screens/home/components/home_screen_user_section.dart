import 'package:blocs_at_scale/src/blocs/index.dart';
import 'package:blocs_at_scale/src/utility_widgets/buttons/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreenUserSection extends StatelessWidget {
  const HomeScreenUserSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, userState) {
        final headingText = _getHeadingText(userState);

        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // Heading
            Text(
              headingText,
              style: Theme.of(context).textTheme.headline5?.copyWith(color: Colors.white),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),

            // UserState
            Text(
              'State:\n ${userState.toString()}',
              style: Theme.of(context).textTheme.subtitle1?.copyWith(color: Colors.white),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),

            // Fetch User Button
            CustomElevatedButton(
              bgColor: Colors.blueGrey,
              onPressed: () => _onFetchUser(context, simulateError: false),
              child: const Text('Fetch User'),
            ),
            const SizedBox(height: 12),

            // Fetch User Button (simulate exception)
            CustomElevatedButton(
              bgColor: Colors.deepOrange,
              onPressed: () => _onFetchUser(context, simulateError: true),
              child: const Text('Fetch User (simulate exception)'),
            ),
          ],
        );
      },
    );
  }

  /// Adds a [FetchUser] event.
  void _onFetchUser(BuildContext context, {bool simulateError = false}) {
    context.read<UserBloc>().add(FetchUser(simulateError: simulateError));
  }

  /// Returns heading text based on the current [userState].
  String _getHeadingText(UserState userState) {
    if (userState is UserInitialized) {
      return 'User Initialized: ${userState.user.username}';
    }
    return 'User not yet initialized';
  }
}
