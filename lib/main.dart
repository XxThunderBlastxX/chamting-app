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
    const initialSize = Size(1280, 720);
    const minSize = Size(780, 680);
    appWindow.minSize = minSize;
    appWindow.size = initialSize;
    appWindow.alignment = Alignment.center;
    appWindow.show();
  });
}
