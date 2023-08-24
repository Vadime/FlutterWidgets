import 'package:flutter/material.dart';
import 'package:widgets/widgets.dart';

class SendPasswordView extends StatefulWidget {
  final Function() toSignIn;
  final Function(TextFieldController email) sendPassword;
  const SendPasswordView({
    required this.toSignIn,
    required this.sendPassword,
    super.key,
  });

  @override
  State<SendPasswordView> createState() => _SendPasswordViewState();
}

class _SendPasswordViewState extends State<SendPasswordView> {
  TextFieldController email = TextFieldController.email();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Spacer(),
        LoginHeader(
          'Send Password',
          'You have your Password again? ',
          TextButtonWidget(
            'Sign In',
            onPressed: widget.toSignIn,
          ),
        ),
        TextFieldWidget(
         controller: email,
          margin: EdgeInsets.fromLTRB(
              context.config.padding,
              context.config.paddingH,
              context.config.padding,
              context.config.paddingH),
        ),
        const Spacer(),
        ElevatedButtonWidget(
          'Send Password',
          onPressed: () => widget.sendPassword(email),
          margin: EdgeInsets.all(context.config.padding),
        ),
      ],
    );
  }
}
