import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:fluent_ui/fluent_ui.dart';

//WindowsTitleBar is the top windows bar to move, minimize, maximize,and close windows
class WindowsTitleBar extends StatelessWidget {
  final bool? requiredBackButton;
  const WindowsTitleBar({
    Key? key,
    this.requiredBackButton = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 40,
      child: WindowTitleBarBox(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: MoveWindow(
                child: requiredBackButton == true
                    ? Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 3.0,
                          horizontal: 3.0,
                        ),
                        margin: const EdgeInsets.only(
                          top: 5.0,
                          left: 5.0,
                          right: 0.0,
                          bottom: 0.0,
                        ),
                        child: IconButton(
                          icon: const Icon(FluentIcons.chrome_back),
                          onPressed: () => Navigator.of(context).pop(),
                          style: ButtonStyle(
                            iconSize: ButtonState.all(16),
                            shape: ButtonState.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                        ),
                      )
                    : MoveWindow(),
              ),
            ),
            const WindowsButtons()
          ],
        ),
      ),
    );
  }
}

//Set the color properties of the Windows Buttons
final buttonColors = WindowButtonColors(
    iconNormal: const Color(0xFF805306),
    mouseOver: const Color(0xFFF6A00C),
    mouseDown: const Color(0xFF805306),
    iconMouseOver: const Color(0xFF805306),
    iconMouseDown: const Color(0xFFFFD500));

//Set the color properties of Close Button
final closeButtonColors = WindowButtonColors(
    mouseOver: const Color(0xFFD32F2F),
    mouseDown: const Color(0xFFB71C1C),
    iconNormal: const Color(0xFF805306),
    iconMouseOver: Colors.white);

//Windows button to minimize, maximize and close windows
class WindowsButtons extends StatelessWidget {
  const WindowsButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MinimizeWindowButton(colors: buttonColors),
        MaximizeWindowButton(colors: buttonColors),
        CloseWindowButton(colors: closeButtonColors),
      ],
    );
  }
}
