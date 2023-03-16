import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';

final WindowButtonColors buttonColors = WindowButtonColors(
    iconNormal: Colors.black,
    mouseOver: Colors.grey[400],
    mouseDown: const Color(0xFF805306),
    iconMouseOver: Colors.black,
    iconMouseDown: const Color(0xFFFFD500));

final WindowButtonColors closeButtonColors = WindowButtonColors(
    mouseOver: const Color(0xFFD32F2F),
    mouseDown: const Color(0xFFB71C1C),
    iconNormal: Colors.black,
    iconMouseOver: Colors.white);

class WindowButtons extends StatefulWidget {
  const WindowButtons({Key? key}) : super(key: key);

  @override
  WindowButtonsState createState() => WindowButtonsState();
}

class WindowButtonsState extends State<WindowButtons> {
  void maximizeOrRestore() {
    setState(() {
      appWindow.maximizeOrRestore();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        MinimizeWindowButton(colors: buttonColors),
        appWindow.isMaximized
            ? RestoreWindowButton(
                colors: buttonColors,
                onPressed: maximizeOrRestore,
              )
            : MaximizeWindowButton(
                colors: buttonColors,
                onPressed: maximizeOrRestore,
              ),
        CloseWindowButton(colors: closeButtonColors),
      ],
    );
  }
}

class TitleBar extends StatelessWidget {
  const TitleBar({super.key});

  @override
  Widget build(BuildContext context) {
    return WindowTitleBarBox(
      child: Row(
        children: <Widget>[
          Expanded(
              child: MoveWindow(
            child: const Padding(
              padding: EdgeInsets.fromLTRB(10, 8, 3, 3),
              child: Text(
                'Chamting-App',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
          )),
          const WindowButtons(),
        ],
      ),
    );
  }
}
