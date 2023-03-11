import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:chamting_app/src/app.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart' show ProviderScope;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(
    child: MyApp(),
  ));
  doWhenWindowReady(() {
    final win = appWindow;
    const initialSize = Size(900, 600);
    win.minSize = initialSize;
    win.size = initialSize;
    win.alignment = Alignment.center;
    win.title = "Chamting App";
    win.show();
  });
}
