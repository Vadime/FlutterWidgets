import 'package:flutter/material.dart';
import 'package:widgets/widgets.dart';

class SignInView extends StatefulWidget {
  final Function() toSignUp;
  final Function() toSendPassword;
  final dynamic Function(
      TextFieldController email, TextFieldController password) signIn;
  const SignInView({
    required this.toSignUp,
    required this.toSendPassword,
    required this.signIn,
    super.key,
  });

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  TextFieldController email = TextFieldController.email();
  TextFieldController password = TextFieldController.password();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Spacer(),
        LoginHeader(
          'Sign In',
          "Don't have an Account? ",
          TextButtonWidget(
            'Sign Up',
            onPressed: widget.toSignUp,
          ),
        ),
        CardWidget(
          margin: EdgeInsets.fromLTRB(
              context.config.padding,
              context.config.paddingH,
              context.config.padding,
              context.config.paddingH),
          children: [
            TextFieldWidget(controller: email),
            TextFieldWidget(controller: password)
          ],
        ),
        Align(
          alignment: Alignment.centerRight,
          child: TextButtonWidget(
            'Forgot password?',
            onPressed: widget.toSendPassword,
            margin: EdgeInsets.fromLTRB(
                context.config.padding, 0, context.config.padding, 0),
          ),
        ),
        const Spacer(),
        ElevatedButtonWidget(
          'Sign In',
          onPressed: () async => await widget.signIn(email, password),
          margin: EdgeInsets.fromLTRB(
            context.config.padding,
            0,
            context.config.padding,
            context.config.padding,
          ),
        ),
      ],
    );
  }
}
