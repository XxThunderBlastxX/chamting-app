import 'package:fluent_ui/fluent_ui.dart';

//ErrSnackBar is a to show error message as snackbar
class ErrSnackBar extends Snackbar {
  final String? err;
  ErrSnackBar({Key? key, this.err})
      : super(
          key: key,
          extended: true,
          content: Padding(
            padding: const EdgeInsets.all(3.0),
            child: Text(err.toString(),
                softWrap: true, overflow: TextOverflow.visible),
          ),
        );
}
