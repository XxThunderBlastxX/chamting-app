import 'package:fluent_ui/fluent_ui.dart';

class VerticalSpacer extends SizedBox {
  final double? space;

  const VerticalSpacer({Key? key, this.space = 12})
      : super(key: key, height: space);
}
