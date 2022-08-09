import 'package:fluent_ui/fluent_ui.dart';

class InternetInfoBar extends StatelessWidget {
  const InternetInfoBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: InfoBar(
        title: const Text("No Internet"),
        content: const Text("You are not connected to internet !!"),
        // action: IconButton(
        //   icon: const Icon(FluentIcons.chrome_close),
        //   onPressed: () {},
        //   style: ButtonStyle(
        //     iconSize: ButtonState.all(12.0),
        //   ),
        // ),
        severity: InfoBarSeverity.warning,
        onClose: () {},
        isLong: false,
      ),
    );
  }
}
