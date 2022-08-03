import 'package:fluent_ui/fluent_ui.dart';

import '../../textStyles/body_text_style.dart';
import '../../textStyles/text_style.dart';

class FormTextBox extends StatelessWidget {
  final String? headerText;
  final String? placeholderText;
  final TextEditingController? textController;
  final Function(String?)? validator;

  const FormTextBox({
    Key? key,
    this.headerText,
    this.placeholderText,
    this.textController,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 8.0,
        right: 0.0,
        left: 0.0,
        bottom: .0,
      ),
      child: TextFormBox(
        header: headerText,
        headerStyle: BodyTextStyle(
          size: TextSize.medium,
          weight: FontWeight.w500,
        ),
        placeholder: placeholderText,
        padding: const EdgeInsets.all(8.0),
        controller: textController,
        onChanged: validator,
      ),
    );
  }
}
