import 'package:flutter/material.dart';
import 'package:widgets/widgets.dart';

class VerifyPhoneCodeView extends StatefulWidget {
  final Function(TextFieldController code) verifyPhoneCode;

  const VerifyPhoneCodeView({required this.verifyPhoneCode, super.key});

  @override
  State<VerifyPhoneCodeView> createState() => _VerifyPhoneCodeViewState();
}

class _VerifyPhoneCodeViewState extends State<VerifyPhoneCodeView> {
  TextFieldController code = TextFieldController.code(labelText: 'Verify Code');

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        TextFieldWidget(
          controller: code,
        ),
        SizedBox(height: context.config.padding),
        ElevatedButtonWidget('Login', onPressed: () async {
          if (!code.isValid()) {
            code.emptyAllowed = false;
            return;
          }
          try {
            await widget.verifyPhoneCode(code);
          } catch (e) {
            Messaging.info(message: e.toString());
            return;
          }
        }),
      ],
    );
  }
}
