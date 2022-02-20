import 'package:blocs_at_scale/src/blocs/index.dart';
import 'package:blocs_at_scale/src/screens/home/components/home_screen_user_section.dart';
import 'package:blocs_at_scale/src/screens/home/home_scaffold.dart';
import 'package:blocs_at_scale/src/utility_widgets/dialogs/fullscreen_loading_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

const _kSnackBarDuration = Duration(milliseconds: 3000);
const _kSnackBarPadding = EdgeInsets.symmetric(horizontal: 32, vertical: 16);

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late String text;
  bool isDialogOpen = false;

  @override
  Widget build(BuildContext context) {
    return HomeScaffold(
      child: BlocListener<UserBloc, UserState>(
        listener: (context, state) {
          if (state is UserFetching) {
            _showLoadingDialog(context);
          } else if (state is UserError) {
            _showErrorSnackbar(context);
          } else if (state is UserRefetchingSuccess) {
            _showSuccessSnackbar(context);
          } else if (state is UserLoaded || state is UserUninitialized) {
            _hideLoadingDialog(context);
          }
        },
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
            child: Column(
              children: const [
                HomeScreenUserSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showSuccessSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        padding: _kSnackBarPadding,
        content: Text('User data has been refetched successfully.'),
        duration: _kSnackBarDuration,
        backgroundColor: Colors.green,
      ),
    );
  }

  void _showErrorSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        padding: _kSnackBarPadding,
        content: Text('An error has ocurred. Please check your connection and try again.'),
        duration: _kSnackBarDuration,
        backgroundColor: Colors.red,
      ),
    );
  }

  void _showLoadingDialog(BuildContext context) async {
    assert(isDialogOpen == false, 'Tried to show loading dialog which might already be shown.');

    setState(() => isDialogOpen = true);
    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const FullscreenLoadingDialog(),
    );
    setState(() => isDialogOpen = false);
  }

  void _hideLoadingDialog(BuildContext context) {
    assert(isDialogOpen == true, 'Tried to pop loading dialog which might already be popped.');
    Navigator.of(context).maybePop();
  }
}
